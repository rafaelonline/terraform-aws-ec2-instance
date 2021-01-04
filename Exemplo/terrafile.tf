locals {
  ambiente_instance = "staging"
  owner             = "ACME"
  user_data_ec2     = <<EOF
#!/bin/bash
sudo echo "staging" > /etc/hostname
                  EOF
}

module "ec2" {
  source                      = "./modules/ec2"
  vpc_id                      = "vpc-123abc"
  subnet_id                   = "subnet-123xxxx"
  ami_owner                   = "99999999999"
  ami_name                    = "*ubuntu*"
  type                        = "t3.micro"
  key_name                    = "staging-key"
  security_group_id           = ["sg-123456789xx"]
  disable_api_termination     = true
  associate_public_ip_address = true
  monitoring                  = true
  iam_instance_profile        = ""

  user_data_base64 = base64encode(local.user_data_ec2)

  volume_type           = "gp2"
  volume_size           = 8
  delete_on_termination = false
  encrypted             = true

  name_instance     = "staging"
  ambiente_instance = local.ambiente_instance
  owner             = local.owner
}