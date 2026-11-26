# 675 · resource aci_cloud_template_region_detail · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Cloud Template Region Detail
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_template_region_detail.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_675 = yamldecode(file("${path.module}/../models/aci_cloud_template_region_detail.yml"))["aci_cloud_template_region_detail"]
}

resource "aci_cloud_template_region_detail" "n675" {
  annotation     = local.m_675["annotation"]
  description    = local.m_675["description"]
  hub_networking = local.m_675["hub_networking"]
  name_alias     = local.m_675["name_alias"]
  parent_dn      = local.m_675["parent_dn"]
}
