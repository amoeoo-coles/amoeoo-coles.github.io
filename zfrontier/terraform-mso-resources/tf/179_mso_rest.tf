# 179 · resource mso_rest · 12. Validate, deploy and utility
# MSO Rest Resource to manage the MSO objects via REST API.
# Class: not collected · DN: not collected
# Reads models/mso_rest.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_179 = yamldecode(file("${path.module}/../models/mso_rest.yml"))["mso_rest"]
}

resource "mso_rest" "n179" {
  method    = local.m_179["method"]
  path      = local.m_179["path"]
  payload   = local.m_179["payload"]
  retrigger = local.m_179["retrigger"]
}
