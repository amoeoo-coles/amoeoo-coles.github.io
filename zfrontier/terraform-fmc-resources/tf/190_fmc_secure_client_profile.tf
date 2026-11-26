# 190 · resource fmc_secure_client_profile · 2. Objects
# This resource manages a Secure Client Profile.
# Reads models/fmc_secure_client_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_190 = yamldecode(file("${path.module}/../models/fmc_secure_client_profile.yml"))["fmc_secure_client_profile"]
}

resource "fmc_secure_client_profile" "n190" {
  description = local.m_190["description"]
  domain = local.m_190["domain"]
  file_type = local.m_190["file_type"]
  name = local.m_190["name"]
  path = local.m_190["path"]
}
