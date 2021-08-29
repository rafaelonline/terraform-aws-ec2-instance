locals {
  user_data_base64 = <<EOF
#!/bin/bash
sudo echo "staging" > /etc/hostname
EOF
}

module "ec2" {
  source           = "./../"
  ami              = "ami-0796a5e71b3cxxa9a"
  instance_type    = "t3.nano"
  instances_subnet = ["subnet-123xxxx"]
  security_group   = ["sg-123456789xx"]
  ec2keys          = "staging-key"

  user_data_base64 = base64encode(local.user_data_base64)

  root_volume_size = 8

  ebs_block_device = [
    {
      device_name = "xvdf"
      volume_size = 5
    }
  ]

  tags = {
    Name        = "staging-ec2-teste-module-ec2"
    environment = "staging"
  }
}