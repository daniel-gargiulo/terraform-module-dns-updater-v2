
# # Non-authentication needed to perform DNS updates - https://registry.terraform.io/providers/hashicorp/dns/latest/docs


## RFC-2136 dns provider 

provider "dns" { 
  update {
    server = "127.0.0.1"
  }
}