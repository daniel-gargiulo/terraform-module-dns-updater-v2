<!-- BEGIN_TF_DOCS -->
# Terraform
*This module take all json files within input-json folder and create a new dns type 'a' record (resource dns\_a\_record\_set.www)
*Only json files will be taken as local variables, if you upload other type of file, will be ignored, to cange it please edit the .gitignore file.

.
   ├── input-json
   │   ├── finance.json
   │   ├── procurement.json
   │   ├── rrhh.json
   │   └── www.json
   ├── main.tf
   ├── outputs.tf
   ├── provider.tf
   └── variables.tf

## Usage
upload well formed json files to the folder input-json
run -
     terraform init
     terraform plan (check the data)
     terraform apply (confirm with yes)

### Quick Example
Json files example (finance.json)

{
     "addresses": [
         "192.168.100.2"
     ],
     "ttl": 600,
     "zone": "example.com.",
     "dns\_record\_type": "a"
}

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3.2.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dns"></a> [dns](#provider\_dns) | >= 3.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dns_a_record_set.www](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/a_record_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_author"></a> [author](#input\_author) | n/a | `string` | `"gargiulo.daniel@outlook.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_record_set"></a> [dns\_a\_record\_set](#output\_dns\_a\_record\_set) | n/a |
| <a name="output_my-email"></a> [my-email](#output\_my-email) | # my email |
<!-- END_TF_DOCS -->