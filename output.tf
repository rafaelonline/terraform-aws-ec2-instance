output instance_id {
  description = "Lista o ID da instancia"
  value       = join("", aws_instance.default.*.id)
}

output private_ip {
  description = "Lista o IP Privado da instancia"
  value       = join("", aws_instance.default.*.private_ip)
}

output public_ip {
  description = "Lista o IP Publico da instancia"
  value       = join("", aws_instance.default.*.public_ip)
}