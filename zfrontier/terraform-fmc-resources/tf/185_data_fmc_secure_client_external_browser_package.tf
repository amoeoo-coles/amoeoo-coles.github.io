# 185 · data source fmc_secure_client_external_browser_package · 2. Objects
# This data source reads the Secure Client External Browser Package.
# Reads models/data_fmc_secure_client_external_browser_package.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_185 = yamldecode(file("${path.module}/../models/data_fmc_secure_client_external_browser_package.yml"))["data_fmc_secure_client_external_browser_package"]
}

data "fmc_secure_client_external_browser_package" "n185" {
  domain = local.m_185["domain"]
  id     = local.m_185["id"]
  name   = local.m_185["name"]
}

output "n185_data_fmc_secure_client_external_browser_package_id" {
  value = data.fmc_secure_client_external_browser_package.n185.id
}
