data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet" "sub" {
  vpc_id = data.aws_vpc.vpc.id
  id     = var.subnet_id
}

data "aws_ami" "ami" {
  owners      = [var.ami_owner]
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }
}