# 187 · data source fmc_secure_client_image · 2. Objects
# This data source reads the Secure Client Image.
# Reads models/data_fmc_secure_client_image.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_187 = yamldecode(file("${path.module}/../models/data_fmc_secure_client_image.yml"))["data_fmc_secure_client_image"]
}

data "fmc_secure_client_image" "n187" {
  domain = local.m_187["domain"]
  id = local.m_187["id"]
  name = local.m_187["name"]
}

output "n187_data_fmc_secure_client_image_id" {
  value = data.fmc_secure_client_image.n187.id
}
