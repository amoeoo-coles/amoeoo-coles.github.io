terraform {
  required_version = ">= 1.11.0"
  required_providers {
    nxos = {
      source  = "CiscoDevNet/nxos"
      version = "0.22.3"
    }
    ndfc = {
      source  = "CiscoDevNet/ndfc"
      version = "0.3.1"
    }
  }
}

# Credentials come only from variables (terraform.tfvars or TF_VAR_* env vars).
provider "nxos" {
  url      = var.nxos_url
  username = var.nxos_username
  password = var.nxos_password
  insecure = var.insecure
}

provider "ndfc" {
  url      = var.ndfc_url
  username = var.ndfc_username
  password = var.ndfc_password
  domain   = var.ndfc_domain
  insecure = var.insecure
}
