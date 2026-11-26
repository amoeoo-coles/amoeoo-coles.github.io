# 274 · resource fmc_dynamic_access_policy · 3. Policies
# This resource manages a Dynamic Access Policy.
# Reads models/fmc_dynamic_access_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_274 = yamldecode(file("${path.module}/../models/fmc_dynamic_access_policy.yml"))["fmc_dynamic_access_policy"]
}

resource "fmc_dynamic_access_policy" "n274" {
  description                      = local.m_274["description"]
  domain                           = local.m_274["domain"]
  name                             = local.m_274["name"]
  secure_client_posture_package_id = local.m_274["secure_client_posture_package_id"]
}
