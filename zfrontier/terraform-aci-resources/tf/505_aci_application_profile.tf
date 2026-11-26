# 505 · resource aci_application_profile · 4. Application
# Manages ACI Application Profile
# APIC class: fvAp · DN: uni/tn-{name}/ap-{name}
# Reads models/aci_application_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_505 = yamldecode(file("${path.module}/../models/aci_application_profile.yml"))["aci_application_profile"]
}

resource "aci_application_profile" "n505" {
  annotation                    = local.m_505["annotation"]
  annotations                   = local.m_505["annotations"]
  description                   = local.m_505["description"]
  name                          = local.m_505["name"]
  name_alias                    = local.m_505["name_alias"]
  owner_key                     = local.m_505["owner_key"]
  owner_tag                     = local.m_505["owner_tag"]
  parent_dn                     = local.m_505["parent_dn"]
  prio                          = local.m_505["prio"]
  priority                      = local.m_505["priority"]
  relation_fv_rs_ap_mon_pol     = local.m_505["relation_fv_rs_ap_mon_pol"]
  relation_to_monitoring_policy = local.m_505["relation_to_monitoring_policy"]
  tags                          = local.m_505["tags"]
  tenant_dn                     = local.m_505["tenant_dn"]
}
