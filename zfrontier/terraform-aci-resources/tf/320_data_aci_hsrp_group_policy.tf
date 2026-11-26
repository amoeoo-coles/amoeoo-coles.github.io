# 320 · data source aci_hsrp_group_policy · 3. Tenant and networking
# Data source for ACI HSRP Group Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_hsrp_group_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_320 = yamldecode(file("${path.module}/../models/data_aci_hsrp_group_policy.yml"))["data_aci_hsrp_group_policy"]
}

data "aci_hsrp_group_policy" "n320" {
  annotation             = local.m_320["annotation"]
  ctrl                   = local.m_320["ctrl"]
  description            = local.m_320["description"]
  hello_intvl            = local.m_320["hello_intvl"]
  hold_intvl             = local.m_320["hold_intvl"]
  hsrp_group_policy_type = local.m_320["hsrp_group_policy_type"]
  key                    = local.m_320["key"]
  name                   = local.m_320["name"]
  name_alias             = local.m_320["name_alias"]
  preempt_delay_min      = local.m_320["preempt_delay_min"]
  preempt_delay_reload   = local.m_320["preempt_delay_reload"]
  preempt_delay_sync     = local.m_320["preempt_delay_sync"]
  prio                   = local.m_320["prio"]
  tenant_dn              = local.m_320["tenant_dn"]
  timeout                = local.m_320["timeout"]
}

output "n320_data_aci_hsrp_group_policy_id" {
  value = data.aci_hsrp_group_policy.n320.id
}
