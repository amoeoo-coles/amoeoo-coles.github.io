# 198 · data source aci_spine_access_port_selector · 2. Access policies
# Data source for ACI Spine Access Port Selector
# APIC class: infraSHPortS · DN: uni/infra/spaccportprof-{name}/shports-{name}-typ-{type}
# Reads models/data_aci_spine_access_port_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_198 = yamldecode(file("${path.module}/../models/data_aci_spine_access_port_selector.yml"))["data_aci_spine_access_port_selector"]
}

data "aci_spine_access_port_selector" "n198" {
  name               = local.m_198["name"]
  parent_dn          = local.m_198["parent_dn"]
  port_selector_type = local.m_198["port_selector_type"]
}

output "n198_data_aci_spine_access_port_selector_id" {
  value = data.aci_spine_access_port_selector.n198.id
}
