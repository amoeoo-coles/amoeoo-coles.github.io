# Provider configuration for the catalogue (CiscoDevNet/catalystcenter 0.6.9).
# Credentials come from variables only (variables.tf / terraform.tfvars.example).

terraform {
  required_version = ">= 1.8.0"
  required_providers {
    catalystcenter = {
      source  = "CiscoDevNet/catalystcenter"
      version = "0.6.9"
    }
  }
}

provider "catalystcenter" {
  url      = var.catalystcenter_url
  username = var.catalystcenter_username
  password = var.catalystcenter_password
  insecure = var.catalystcenter_insecure
}
