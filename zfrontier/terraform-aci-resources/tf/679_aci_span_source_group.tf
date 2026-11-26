# 679 · resource aci_span_source_group · 7. Monitoring and BAU
# Manages ACI SPAN Source Group
# APIC class: not collected · DN: not collected
# Reads models/aci_span_source_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_679 = yamldecode(file("${path.module}/../models/aci_span_source_group.yml"))["aci_span_source_group"]
}

resource "aci_span_source_group" "n679" {
  admin_st                               = local.m_679["admin_st"]
  annotation                             = local.m_679["annotation"]
  description                            = local.m_679["description"]
  name                                   = local.m_679["name"]
  name_alias                             = local.m_679["name_alias"]
  relation_span_rs_src_grp_to_filter_grp = local.m_679["relation_span_rs_src_grp_to_filter_grp"]
  tenant_dn                              = local.m_679["tenant_dn"]
}
