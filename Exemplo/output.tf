output instance_id {
  value       = [module.ec2.instance_id]
  description = "Lista o ID da instancia"
}

output private_ip {
  value       = [module.ec2.private_ip]
  description = "Lista o IP Privado da instancia"
}

output public_ip {
  value       = [module.ec2.public_ip]
  description = "Lista o IP Publico da instancia"
}