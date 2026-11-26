# 186 · resource fmc_secure_client_image · 2. Objects
# This resource manages a Secure Client Image.
# Reads models/fmc_secure_client_image.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_186 = yamldecode(file("${path.module}/../models/fmc_secure_client_image.yml"))["fmc_secure_client_image"]
}

resource "fmc_secure_client_image" "n186" {
  description = local.m_186["description"]
  domain = local.m_186["domain"]
  name = local.m_186["name"]
  path = local.m_186["path"]
}
