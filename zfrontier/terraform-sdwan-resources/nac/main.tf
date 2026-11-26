# Sample root module for netascode terraform-sdwan-nac-sdwan with CiscoDevNet/sdwan 0.12.0.
# Module source: https://github.com/netascode/terraform-sdwan-nac-sdwan at commit 5c49bbf (main, 5c49bbf6f2dc38b26bb446de96317ae914f10194), whose versions.tf
# requires sdwan ~> 0.12.0. The latest tagged release, v1.5.1, still pins sdwan ~> 0.11.7;
# to use the registry instead: source = "netascode/nac-sdwan/sdwan", version = "1.5.1".
# Inputs and outputs: README terraform-docs tables. Credentials come from variables only.

terraform {
  required_version = ">= 1.8.0"
  required_providers {
    sdwan = {
      source  = "CiscoDevNet/sdwan"
      version = "0.12.0"
    }
  }
}

provider "sdwan" {
  url      = var.sdwan_url
  username = var.sdwan_username
  password = var.sdwan_password
}

variable "sdwan_url" {
  type    = string
  default = "https://sdwan-manager.example.com"
}

variable "sdwan_username" {
  type    = string
  default = "admin"
}

variable "sdwan_password" {
  type      = string
  sensitive = true
}

module "sdwan" {
  source = "git::https://github.com/netascode/terraform-sdwan-nac-sdwan.git?ref=5c49bbf6f2dc38b26bb446de96317ae914f10194"

  # data/*.nac.yaml are merged in file-name order (01_ ... 17_), which is the build order.
  yaml_directories = ["data"]

  # Defaults from the README Inputs table, shown for reference:
  manage_global             = true
  write_default_values_file = ""
}

output "nac_test_scope" {
  value = module.sdwan.nac_test_scope
}
