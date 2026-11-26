# Provider configuration for the catalogue (CiscoDevNet/sdwan 0.12.0).
# Credentials come from variables only (variables.tf / terraform.tfvars.example).

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
  insecure = var.sdwan_insecure
}
