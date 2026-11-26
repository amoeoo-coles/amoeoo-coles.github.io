# 661 · resource aci_cloud_private_link_label · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Cloud Private Link Label
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_private_link_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_661 = yamldecode(file("${path.module}/../models/aci_cloud_private_link_label.yml"))["aci_cloud_private_link_label"]
}

resource "aci_cloud_private_link_label" "n661" {
  annotation  = local.m_661["annotation"]
  description = local.m_661["description"]
  name        = local.m_661["name"]
  name_alias  = local.m_661["name_alias"]
  parent_dn   = local.m_661["parent_dn"]
}
