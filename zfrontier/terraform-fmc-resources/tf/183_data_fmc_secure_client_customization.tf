# 183 · data source fmc_secure_client_customization · 2. Objects
# This data source reads the Secure Client Customization.
# Reads models/data_fmc_secure_client_customization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_183 = yamldecode(file("${path.module}/../models/data_fmc_secure_client_customization.yml"))["data_fmc_secure_client_customization"]
}

data "fmc_secure_client_customization" "n183" {
  domain = local.m_183["domain"]
  id = local.m_183["id"]
  name = local.m_183["name"]
}

output "n183_data_fmc_secure_client_customization_id" {
  value = data.fmc_secure_client_customization.n183.id
}
