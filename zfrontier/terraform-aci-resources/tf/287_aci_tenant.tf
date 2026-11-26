# 287 · resource aci_tenant · 3. Tenant and networking
# Manages ACI Tenant
# APIC class: fvTenant · DN: uni/tn-{name}
# Reads models/aci_tenant.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_287 = yamldecode(file("${path.module}/../models/aci_tenant.yml"))["aci_tenant"]
}

resource "aci_tenant" "n287" {
  annotation                    = local.m_287["annotation"]
  annotations                   = local.m_287["annotations"]
  description                   = local.m_287["description"]
  name                          = local.m_287["name"]
  name_alias                    = local.m_287["name_alias"]
  owner_key                     = local.m_287["owner_key"]
  owner_tag                     = local.m_287["owner_tag"]
  relation_fv_rs_tenant_mon_pol = local.m_287["relation_fv_rs_tenant_mon_pol"]
  relation_fv_rs_tn_deny_rule   = local.m_287["relation_fv_rs_tn_deny_rule"]
  relation_to_monitoring_policy = local.m_287["relation_to_monitoring_policy"]
  tags                          = local.m_287["tags"]
}
