# Provider configuration for the catalogue (CiscoDevNet/aci 2.21.0).
# Credentials come from variables only (see variables.tf / terraform.tfvars.example).
# Provider arguments in the schema: allow_existing_on_create, annotation, cert_name, insecure, password, private_key, proxy_creds, proxy_url, retries, url, username, validate_relation_dn

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "2.21.0"
    }
  }
}

provider "aci" {
  url      = var.apic_url
  username = var.apic_username
  password = var.apic_password
  insecure = var.apic_insecure
}
