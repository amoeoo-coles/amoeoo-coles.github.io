# 316 · data source aci_end_point_retention_policy · 3. Tenant and networking
# Data source for ACI End Point Retention Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_end_point_retention_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_316 = yamldecode(file("${path.module}/../models/data_aci_end_point_retention_policy.yml"))["data_aci_end_point_retention_policy"]
}

data "aci_end_point_retention_policy" "n316" {
  annotation          = local.m_316["annotation"]
  bounce_age_intvl    = local.m_316["bounce_age_intvl"]
  bounce_trig         = local.m_316["bounce_trig"]
  description         = local.m_316["description"]
  hold_intvl          = local.m_316["hold_intvl"]
  local_ep_age_intvl  = local.m_316["local_ep_age_intvl"]
  move_freq           = local.m_316["move_freq"]
  name                = local.m_316["name"]
  name_alias          = local.m_316["name_alias"]
  remote_ep_age_intvl = local.m_316["remote_ep_age_intvl"]
  tenant_dn           = local.m_316["tenant_dn"]
}

output "n316_data_aci_end_point_retention_policy_id" {
  value = data.aci_end_point_retention_policy.n316.id
}
