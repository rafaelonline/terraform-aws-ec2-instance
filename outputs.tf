output "instance_id" {
  description = "List of IDs of instances"
  value       = compact(aws_instance.default.*.id)
}

output instace_private_ip {
  description = "The IP Private of the Instances."
  value       = compact(aws_instance.default.*.private_ip)
}

output instace_public_ip {
  description = "The IP Public of the Instances."
  value       = compact(aws_eip.default.*.public_ip)
}

output "password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = compact(aws_instance.default.*.password_data)
}