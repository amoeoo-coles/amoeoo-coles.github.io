# 219 · data source fmc_single_sign_on_server · 2. Objects
# This data source reads the Single Sign On Server.
# Reads models/data_fmc_single_sign_on_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_219 = yamldecode(file("${path.module}/../models/data_fmc_single_sign_on_server.yml"))["data_fmc_single_sign_on_server"]
}

data "fmc_single_sign_on_server" "n219" {
  domain = local.m_219["domain"]
  id     = local.m_219["id"]
  name   = local.m_219["name"]
}

output "n219_data_fmc_single_sign_on_server_id" {
  value = data.fmc_single_sign_on_server.n219.id
}
