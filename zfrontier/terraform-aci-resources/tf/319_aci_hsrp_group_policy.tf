# 319 · resource aci_hsrp_group_policy · 3. Tenant and networking
# Manages ACI HSRP Group Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_hsrp_group_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_319 = yamldecode(file("${path.module}/../models/aci_hsrp_group_policy.yml"))["aci_hsrp_group_policy"]
}

resource "aci_hsrp_group_policy" "n319" {
  annotation             = local.m_319["annotation"]
  ctrl                   = local.m_319["ctrl"]
  description            = local.m_319["description"]
  hello_intvl            = local.m_319["hello_intvl"]
  hold_intvl             = local.m_319["hold_intvl"]
  hsrp_group_policy_type = local.m_319["hsrp_group_policy_type"]
  key                    = local.m_319["key"]
  name                   = local.m_319["name"]
  name_alias             = local.m_319["name_alias"]
  preempt_delay_min      = local.m_319["preempt_delay_min"]
  preempt_delay_reload   = local.m_319["preempt_delay_reload"]
  preempt_delay_sync     = local.m_319["preempt_delay_sync"]
  prio                   = local.m_319["prio"]
  tenant_dn              = local.m_319["tenant_dn"]
  timeout                = local.m_319["timeout"]
}
