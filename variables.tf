variable "instances_number" {
  type        = number
  default     = 1
  description = "Number of EC2 instances to launch"
}

variable ami {
  type        = string
  description = "ID of AMI to use for the instance"
}


variable "instance_type" {
  type        = string
  description = "The type of instance to launch"
}

variable "ec2keys" {
  type        = string
  description = "The key name to use for the instance"
}

variable get_password_data {
  type        = bool
  default     = false
  description = "If true, wait for password data to become available and retrieve it."
}


variable "instances_subnet" {
  type        = list(string)
  description = "A list of VPC Subnet IDs to launch in"
}

variable associate_public_ip_address {
  type        = bool
  default     = false
  description = "If true, the EC2 instance will have associated public IP address"
}

variable security_group {
  type        = list(string)
  description = "A list of security group IDs to associate with"
}

variable iam_instance_profile {
  type        = string
  default     = ""
  description = "The IAM Instance Profile to launch the instance with."
}

variable "user_data_base64" {
  type        = string
  default     = ""
  description = "The user data to provide when launching the instance."
}

variable root_volume_type {
  type        = string
  default     = "gp3"
  description = "Type of volume"
}

variable root_iops {
  type        = number
  default     = 3000
  description = "Amount of provisioned IOPS"
}

variable root_throughput {
  type        = number
  default     = 125
  description = "Throughput to provision for a volume in mebibytes per second (MiB/s)"
}

variable "root_volume_size" {
  type        = string
  description = "Size of the volume in gibibytes (GiB)"
}

variable kms_key {
  type        = string
  default     = ""
  description = "KMS Key to use when encrypting the volume"
}


variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}

variable tags {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
}


