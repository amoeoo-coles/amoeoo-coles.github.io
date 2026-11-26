# 676 · data source aci_cloud_template_region_detail · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Cloud Template Region Detail
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_template_region_detail.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_676 = yamldecode(file("${path.module}/../models/data_aci_cloud_template_region_detail.yml"))["data_aci_cloud_template_region_detail"]
}

data "aci_cloud_template_region_detail" "n676" {
  annotation  = local.m_676["annotation"]
  description = local.m_676["description"]
  name_alias  = local.m_676["name_alias"]
  parent_dn   = local.m_676["parent_dn"]
}

output "n676_data_aci_cloud_template_region_detail_id" {
  value = data.aci_cloud_template_region_detail.n676.id
}
