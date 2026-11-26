# Provider configuration for the catalogue (CiscoDevNet/mso 3.1.0).
# Credentials come from variables only (see variables.tf / terraform.tfvars.example).
# Provider arguments in the schema: domain, insecure, password, platform, proxy_url, retries, url, username

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    mso = {
      source  = "CiscoDevNet/mso"
      version = "3.1.0"
    }
  }
}

provider "mso" {
  url      = var.mso_url
  username = var.mso_username
  password = var.mso_password
  insecure = var.mso_insecure
  domain   = var.mso_domain
}
