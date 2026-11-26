# Provider configuration for the catalogue (CiscoDevNet/ise 0.5.2).
# Credentials come from variables only (variables.tf / terraform.tfvars.example).

terraform {
  required_version = ">= 1.8.0"
  required_providers {
    ise = {
      source  = "CiscoDevNet/ise"
      version = "0.5.2"
    }
  }
}

provider "ise" {
  url      = var.ise_url
  username = var.ise_username
  password = var.ise_password
  insecure = var.ise_insecure
}
