# 182 · resource fmc_secure_client_customization · 2. Objects
# This resource manages a Secure Client Customization.
# Reads models/fmc_secure_client_customization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_182 = yamldecode(file("${path.module}/../models/fmc_secure_client_customization.yml"))["fmc_secure_client_customization"]
}

resource "fmc_secure_client_customization" "n182" {
  customization_type = local.m_182["customization_type"]
  description = local.m_182["description"]
  domain = local.m_182["domain"]
  language = local.m_182["language"]
  name = local.m_182["name"]
  operating_system = local.m_182["operating_system"]
  path = local.m_182["path"]
  script_type = local.m_182["script_type"]
}
