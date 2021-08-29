 # AWS EC2 Instance Terraform module

Módulo Terraform para criar instancias EC2 na AWS

## Exemplo de utilização

* Consulte o diretório Exemplo.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.1.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.1.15 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | ID of AMI to use for the instance | `string` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | If true, the EC2 instance will have associated public IP address | `bool` | `false` | no |
| <a name="input_ebs_block_device"></a> [ebs\_block\_device](#input\_ebs\_block\_device) | Additional EBS block devices to attach to the instance | `list(map(string))` | `[]` | no |
| <a name="input_ec2keys"></a> [ec2keys](#input\_ec2keys) | The key name to use for the instance | `string` | n/a | yes |
| <a name="input_get_password_data"></a> [get\_password\_data](#input\_get\_password\_data) | If true, wait for password data to become available and retrieve it. | `bool` | `false` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | The IAM Instance Profile to launch the instance with. | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance to launch | `string` | n/a | yes |
| <a name="input_instances_number"></a> [instances\_number](#input\_instances\_number) | Number of EC2 instances to launch | `number` | `1` | no |
| <a name="input_instances_subnet"></a> [instances\_subnet](#input\_instances\_subnet) | A list of VPC Subnet IDs to launch in | `list(string)` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key to use when encrypting the volume | `string` | `""` | no |
| <a name="input_root_iops"></a> [root\_iops](#input\_root\_iops) | Amount of provisioned IOPS | `number` | `3000` | no |
| <a name="input_root_throughput"></a> [root\_throughput](#input\_root\_throughput) | Throughput to provision for a volume in mebibytes per second (MiB/s) | `number` | `125` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Size of the volume in gibibytes (GiB) | `string` | n/a | yes |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | Type of volume | `string` | `"gp3"` | no |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | A list of security group IDs to associate with | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | n/a | yes |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | The user data to provide when launching the instance. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instace_private_ip"></a> [instace\_private\_ip](#output\_instace\_private\_ip) | The IP Private of the Instances. |
| <a name="output_instace_public_ip"></a> [instace\_public\_ip](#output\_instace\_public\_ip) | The IP Public of the Instances. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | List of IDs of instances |
| <a name="output_password_data"></a> [password\_data](#output\_password\_data) | List of Base-64 encoded encrypted password data for the instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Licença
Este projeto está licenciado sob a licença [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)