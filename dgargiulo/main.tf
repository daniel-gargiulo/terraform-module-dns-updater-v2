/**
* # Terraform
*This module take all json files within input-json folder and create a new dns type 'a' record (resource dns_a_record_set.www)
*Only json files will be taken as local variables, if you upload other type of file, will be ignored, to cange it please edit the .gitignore file.
*
* .
*    ├── input-json
*    │   ├── finance.json
*    │   ├── procurement.json
*    │   ├── rrhh.json
*    │   └── www.json
*    ├── main.tf
*    ├── outputs.tf
*    ├── provider.tf
*    └── variables.tf
*
*
* ## Usage
* upload well formed json files to the folder input-json 
* run -
*      terraform init 
*      terraform plan (check the data)
*      terraform apply (confirm with yes)
*      
* ### Quick Example
* Json files example (finance.json)
*  
* {
*      "addresses": [
*          "192.168.100.2"
*      ],
*      "ttl": 600,
*      "zone": "example.com.",
*      "dns_record_type": "a"
* }
*
*/
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ---------------------------------------------------------------------------------------------------------------------
# SET TERRAFORM RUNTIME REQUIREMENTS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  # This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.13.5"
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = ">= 3.2.3"
    }
  }
}

# ------------------------------------------
# Write your local resources here
# ------------------------------------------

locals {
  json_data = [for f in fileset("${path.module}/input-json/", "*.json") :
    {
      local_data = jsondecode(file("${path.module}/input-json/${f}"))
    }
  ]
}


# ------------------------------------------
# Write your Terraform resources here
# ------------------------------------------
## This resource can be improved by adding a for each to read more than one address.

resource "dns_a_record_set" "www" {
  count = length(local.json_data)
  zone  = local.json_data[count.index].local_data.zone
  name  = "www"
  addresses = [
    local.json_data[count.index].local_data.addresses[0]
  ]
  ttl = local.json_data[0].local_data.ttl
}