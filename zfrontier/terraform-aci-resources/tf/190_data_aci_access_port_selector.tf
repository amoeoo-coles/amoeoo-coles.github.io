# 190 · data source aci_access_port_selector · 2. Access policies
# Data source for ACI Access Port Selector
# APIC class: infraHPortS · DN: uni/infra/accportprof-{name}/hports-{name}-typ-{type} | uni/infra/fexprof-{name}/hports-{name}-typ-{type}
# Reads models/data_aci_access_port_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_190 = yamldecode(file("${path.module}/../models/data_aci_access_port_selector.yml"))["data_aci_access_port_selector"]
}

data "aci_access_port_selector" "n190" {
  name               = local.m_190["name"]
  parent_dn          = local.m_190["parent_dn"]
  port_selector_type = local.m_190["port_selector_type"]
}

output "n190_data_aci_access_port_selector_id" {
  value = data.aci_access_port_selector.n190.id
}
