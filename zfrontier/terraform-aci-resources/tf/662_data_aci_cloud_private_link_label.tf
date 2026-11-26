# 662 · data source aci_cloud_private_link_label · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Cloud Private Link Label
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_private_link_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_662 = yamldecode(file("${path.module}/../models/data_aci_cloud_private_link_label.yml"))["data_aci_cloud_private_link_label"]
}

data "aci_cloud_private_link_label" "n662" {
  annotation  = local.m_662["annotation"]
  description = local.m_662["description"]
  name        = local.m_662["name"]
  name_alias  = local.m_662["name_alias"]
  parent_dn   = local.m_662["parent_dn"]
}

output "n662_data_aci_cloud_private_link_label_id" {
  value = data.aci_cloud_private_link_label.n662.id
}
