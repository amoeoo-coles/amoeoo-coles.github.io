# 181 · data source fmc_secure_client_custom_attribute · 2. Objects
# This data source reads the Secure Client Custom Attribute.
# Reads models/data_fmc_secure_client_custom_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_181 = yamldecode(file("${path.module}/../models/data_fmc_secure_client_custom_attribute.yml"))["data_fmc_secure_client_custom_attribute"]
}

data "fmc_secure_client_custom_attribute" "n181" {
  domain = local.m_181["domain"]
  id     = local.m_181["id"]
  name   = local.m_181["name"]
}

output "n181_data_fmc_secure_client_custom_attribute_id" {
  value = data.fmc_secure_client_custom_attribute.n181.id
}
