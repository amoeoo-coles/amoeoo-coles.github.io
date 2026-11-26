# 191 · data source fmc_secure_client_profile · 2. Objects
# This data source reads the Secure Client Profile.
# Reads models/data_fmc_secure_client_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_191 = yamldecode(file("${path.module}/../models/data_fmc_secure_client_profile.yml"))["data_fmc_secure_client_profile"]
}

data "fmc_secure_client_profile" "n191" {
  domain = local.m_191["domain"]
  id     = local.m_191["id"]
  name   = local.m_191["name"]
}

output "n191_data_fmc_secure_client_profile_id" {
  value = data.fmc_secure_client_profile.n191.id
}
