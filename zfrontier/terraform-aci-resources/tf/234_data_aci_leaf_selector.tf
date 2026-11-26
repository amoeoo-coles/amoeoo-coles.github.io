# 234 · data source aci_leaf_selector · 2. Access policies
# Data source for ACI Leaf Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_leaf_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_234 = yamldecode(file("${path.module}/../models/data_aci_leaf_selector.yml"))["data_aci_leaf_selector"]
}

data "aci_leaf_selector" "n234" {
  annotation              = local.m_234["annotation"]
  description             = local.m_234["description"]
  leaf_profile_dn         = local.m_234["leaf_profile_dn"]
  name                    = local.m_234["name"]
  name_alias              = local.m_234["name_alias"]
  switch_association_type = local.m_234["switch_association_type"]
}

output "n234_data_aci_leaf_selector_id" {
  value = data.aci_leaf_selector.n234.id
}
