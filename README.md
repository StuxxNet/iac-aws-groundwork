# iac-aws-groundwork
Terraform package to create the groundwork for AWS
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/eip) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.private_network_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | The default tags for all resources. | `map(string)` | <pre>{<br>  "Environment": "Dev",<br>  "Owner": "DevOps Team"<br>}</pre> | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | <pre>map(object({<br>    cidr_block        = string<br>    availability_zone = string<br>    is_public         = bool<br>  }))</pre> | <pre>{<br>  "private-01": {<br>    "availability_zone": "eu-central-1a",<br>    "cidr_block": "10.0.3.0/24",<br>    "is_public": false<br>  },<br>  "private-02": {<br>    "availability_zone": "eu-central-1b",<br>    "cidr_block": "10.0.4.0/24",<br>    "is_public": false<br>  },<br>  "private-03": {<br>    "availability_zone": "eu-central-1c",<br>    "cidr_block": "10.0.5.0/24",<br>    "is_public": false<br>  },<br>  "public-01": {<br>    "availability_zone": "eu-central-1a",<br>    "cidr_block": "10.0.0.0/24",<br>    "is_public": true<br>  },<br>  "public-02": {<br>    "availability_zone": "eu-central-1b",<br>    "cidr_block": "10.0.1.0/24",<br>    "is_public": true<br>  },<br>  "public-03": {<br>    "availability_zone": "eu-central-1c",<br>    "cidr_block": "10.0.2.0/24",<br>    "is_public": true<br>  }<br>}</pre> | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR block for the VPC. | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnets_ids"></a> [private\_subnets\_ids](#output\_private\_subnets\_ids) | The ID of the VPC |
| <a name="output_public_subnets_ids"></a> [public\_subnets\_ids](#output\_public\_subnets\_ids) | The ID of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
