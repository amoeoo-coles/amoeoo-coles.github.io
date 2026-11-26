# 501 · resource aci_l2_outside · 3. Tenant and networking
# Manages ACI L2 Outside
# APIC class: not collected · DN: not collected
# Reads models/aci_l2_outside.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_501 = yamldecode(file("${path.module}/../models/aci_l2_outside.yml"))["aci_l2_outside"]
}

resource "aci_l2_outside" "n501" {
  annotation                   = local.m_501["annotation"]
  description                  = local.m_501["description"]
  name                         = local.m_501["name"]
  name_alias                   = local.m_501["name_alias"]
  relation_l2ext_rs_e_bd       = local.m_501["relation_l2ext_rs_e_bd"]
  relation_l2ext_rs_l2_dom_att = local.m_501["relation_l2ext_rs_l2_dom_att"]
  target_dscp                  = local.m_501["target_dscp"]
  tenant_dn                    = local.m_501["tenant_dn"]
}
