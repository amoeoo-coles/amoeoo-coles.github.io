# 188 · resource fmc_secure_client_posture_package · 2. Objects
# This resource manages a Secure Client Posture Package.
# Reads models/fmc_secure_client_posture_package.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_188 = yamldecode(file("${path.module}/../models/fmc_secure_client_posture_package.yml"))["fmc_secure_client_posture_package"]
}

resource "fmc_secure_client_posture_package" "n188" {
  description = local.m_188["description"]
  domain = local.m_188["domain"]
  name = local.m_188["name"]
  path = local.m_188["path"]
}
