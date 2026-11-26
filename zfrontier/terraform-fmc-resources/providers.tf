# Provider configuration for the catalogue (CiscoDevNet/fmc 2.8.0).
# Credentials come from variables only (variables.tf / terraform.tfvars.example).

terraform {
  required_version = ">= 1.8.0"
  required_providers {
    fmc = {
      source  = "CiscoDevNet/fmc"
      version = "2.8.0"
    }
  }
}

provider "fmc" {
  url      = var.fmc_url
  username = var.fmc_username
  password = var.fmc_password
  insecure = var.fmc_insecure
}
