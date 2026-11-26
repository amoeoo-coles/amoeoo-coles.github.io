# 189 · data source fmc_secure_client_posture_package · 2. Objects
# This data source reads the Secure Client Posture Package.
# Reads models/data_fmc_secure_client_posture_package.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_189 = yamldecode(file("${path.module}/../models/data_fmc_secure_client_posture_package.yml"))["data_fmc_secure_client_posture_package"]
}

data "fmc_secure_client_posture_package" "n189" {
  domain = local.m_189["domain"]
  id = local.m_189["id"]
  name = local.m_189["name"]
}

output "n189_data_fmc_secure_client_posture_package_id" {
  value = data.fmc_secure_client_posture_package.n189.id
}
