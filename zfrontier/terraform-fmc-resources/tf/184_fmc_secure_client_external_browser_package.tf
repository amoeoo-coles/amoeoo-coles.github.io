# 184 · resource fmc_secure_client_external_browser_package · 2. Objects
# This resource manages a Secure Client External Browser Package.
# Reads models/fmc_secure_client_external_browser_package.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_184 = yamldecode(file("${path.module}/../models/fmc_secure_client_external_browser_package.yml"))["fmc_secure_client_external_browser_package"]
}

resource "fmc_secure_client_external_browser_package" "n184" {
  description = local.m_184["description"]
  domain = local.m_184["domain"]
  name = local.m_184["name"]
  path = local.m_184["path"]
}
