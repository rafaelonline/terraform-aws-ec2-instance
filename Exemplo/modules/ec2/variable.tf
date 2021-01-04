variable vpc_id {
  type        = string
  description = "ID da VPC onde estara o recurso"
}

variable subnet_id {
  type        = string
  description = "ID da Subnet onde estara o recurso"
}

variable ami_owner {
  type        = string
  description = "Account ID da conta onde está a imagem"
}

variable ami_name {
  type        = string
  description = "Nome da imagem a ser utilizada"
}

variable type {
  type        = string
  description = "Tipo da instancia. Ex: t3.nano"
}

variable key_name {
  type        = string
  description = "Nome da chave SSH que será utilizada"
}

variable security_group_id {
  type        = list(string)
  description = "ID do SG que a instancia ira utilizar"
}

variable disable_api_termination {
  type        = bool
  description = "Habilita a proteção que impede realizar um terminate na instancia"
  default     = true
}

variable associate_public_ip_address {
  type        = bool
  default     = true
  description = "Associa uma IP publico"
}

variable monitoring {
  type        = bool
  default     = true
  description = "Habilitad o monitoramento detalhado do CloudWatch"
}

variable ebs_optimized {
  type        = bool
  description = "https://docs.aws.amazon.com/pt_br/AWSEC2/latest/WindowsGuide/ebs-optimized.html"
  default     = true
}

variable volume_type {
  type        = string
  description = "volumes de Finalidade geral (SSD)"
  default     = "gp2"
}
variable volume_size {
  description = "Tamanho do volume a ser criado"
  type        = number
}

variable "encrypted" {
  type        = string
  description = "Habilita a criptografia do volume"
  default     = true
}

variable delete_on_termination {
  type        = bool
  description = "Mantem o disco caso a instancia seja deletada"
  default     = false
}

variable iam_instance_profile {
  type        = string
  description = "Define um profile do IAM "
  default     = ""
}

variable "user_data_base64" {
  type        = string
  description = "Configuração que seja passada no user data"
  default     = ""
}



######### TAGS #########
variable name_instance {
  description = "Define um nome para a instancia"
  type        = string
}

variable ambiente_instance {
  type        = string
  description = "Qual o tipo de ambiente. Ex: Producao"
  default     = ""
}

variable owner {
  type        = string
  description = "Responsavel/dono pela instancia. Ex: Financeiro"
  default     = ""
}

variable active {
  type        = string
  description = "Configuracao de horas ativas"
  default     = ""
}


