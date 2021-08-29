resource "aws_instance" "default" {
  count = var.instances_number

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.ec2keys
  get_password_data           = var.get_password_data
  subnet_id                   = element(var.instances_subnet, count.index)
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.security_group
  disable_api_termination     = false
  monitoring                  = var.tags.environment == "production" ? true : false
  iam_instance_profile        = var.iam_instance_profile

  user_data_base64 = var.user_data_base64

  root_block_device {
    volume_type           = var.root_volume_type
    iops                  = var.root_iops
    throughput            = var.root_throughput
    volume_size           = var.root_volume_size
    kms_key_id            = var.kms_key
    encrypted             = true
    delete_on_termination = true
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", true)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", true)
      iops                  = lookup(ebs_block_device.value, "iops", 3000)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", var.kms_key)
      throughput            = lookup(ebs_block_device.value, "throughput", 125)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", "gp3")
    }
  }

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  lifecycle {
    ignore_changes = [
      root_block_device,
      ebs_block_device,
      ami,
    ]
  }

  tags = var.tags

  volume_tags = var.tags
}

resource "aws_eip" "default" {
  count = var.associate_public_ip_address == true ? length(aws_instance.default[*].primary_network_interface_id) : 0

  network_interface = element(aws_instance.default[*].primary_network_interface_id, count.index)
  vpc               = true

  depends_on = [aws_instance.default]

  tags = var.tags
}