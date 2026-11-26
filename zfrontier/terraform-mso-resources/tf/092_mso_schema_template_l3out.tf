# 092 · resource mso_schema_template_l3out · 8. L3Out
# Manages MSO Schema Template L3Out.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_l3out.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_092 = yamldecode(file("${path.module}/../models/mso_schema_template_l3out.yml"))["mso_schema_template_l3out"]
}

resource "mso_schema_template_l3out" "n092" {
  description       = local.m_092["description"]
  display_name      = local.m_092["display_name"]
  l3out_name        = local.m_092["l3out_name"]
  schema_id         = local.m_092["schema_id"]
  template_name     = local.m_092["template_name"]
  vrf_name          = local.m_092["vrf_name"]
  vrf_schema_id     = local.m_092["vrf_schema_id"]
  vrf_template_name = local.m_092["vrf_template_name"]
}
