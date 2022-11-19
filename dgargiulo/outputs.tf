# ----------------------------------------
# Write your Terraform module outputs here
# ----------------------------------------

## List of record seted one for file

output "dns_a_record_set" {
  value = dns_a_record_set.www[*].addresses
}

## my email
output "my-email" {
  value = var.author
}