# Root Terragrunt configuration. Copy live/, modules/ and data/ into a
# private automation repository so get_repo_root() resolves to that repo.
# Credentials are environment variables only — never commit passwords.
#   TF_HTTP_USERNAME, TF_HTTP_PASSWORD
#   TF_VAR_apic_password, TF_VAR_ndo_password, TF_VAR_nxos_password

locals {
  model = yamldecode(file("${get_repo_root()}/data/sample.yml"))
}

remote_state {
  backend = "http"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    address        = "https://state.example.invalid/states/${path_relative_to_include()}"
    lock_address   = "https://state.example.invalid/states/${path_relative_to_include()}/lock"
    unlock_address = "https://state.example.invalid/states/${path_relative_to_include()}/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    username       = get_env("TF_HTTP_USERNAME", "")
    password       = get_env("TF_HTTP_PASSWORD", "")
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aci  = { source = "CiscoDevNet/aci", version = ">= 2.15.0" }
    mso  = { source = "CiscoDevNet/mso", version = ">= 1.4.0" }
    nxos = { source = "CiscoDevNet/nxos", version = ">= 0.5.0" }
  }
}

variable "apic_url" { type = string }
variable "apic_username" { type = string }
variable "apic_password" {
  type      = string
  sensitive = true
}
variable "ndo_url" { type = string }
variable "ndo_username" { type = string }
variable "ndo_password" {
  type      = string
  sensitive = true
}
variable "nxos_url" { type = string }
variable "nxos_username" { type = string }
variable "nxos_password" {
  type      = string
  sensitive = true
}

provider "aci" {
  username = var.apic_username
  password = var.apic_password
  url      = var.apic_url
  insecure = true
}

provider "mso" {
  username = var.ndo_username
  password = var.ndo_password
  url      = var.ndo_url
  insecure = true
  platform = "nd"
}

provider "nxos" {
  username = var.nxos_username
  password = var.nxos_password
  url      = var.nxos_url
  insecure = true
}
EOF
}
