resource "aws_instance" "default" {
  ami                         = data.aws_ami.ami.id
  instance_type               = var.type
  key_name                    = var.key_name
  availability_zone           = data.aws_subnet.sub.availability_zone
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_id
  disable_api_termination     = var.disable_api_termination
  associate_public_ip_address = var.associate_public_ip_address
  monitoring                  = var.monitoring
  iam_instance_profile        = var.iam_instance_profile

  user_data_base64 = var.user_data_base64

  ebs_optimized = var.ebs_optimized

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
    encrypted             = var.encrypted
  }

  tags = {
    Name     = var.name_instance
    Ambiente = var.ambiente_instance
    Owner    = var.owner
    Schedule = var.active
  }

  volume_tags = {
    Name     = var.name_instance
    Ambiente = var.ambiente_instance
    Owner    = var.owner
  }
}

resource "aws_eip" "default" {
  count             = var.associate_public_ip_address ? 1 : 0
  network_interface = join("", aws_instance.default.*.primary_network_interface_id)
  vpc               = true

  depends_on = [aws_instance.default]

  tags = {
    Name     = var.name_instance
    Ambiente = var.ambiente_instance
    Owner    = var.owner
  }
}