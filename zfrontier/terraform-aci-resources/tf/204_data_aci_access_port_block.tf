# 204 · data source aci_access_port_block · 2. Access policies
# Data source for ACI Access Port Block
# APIC class: infraPortBlk · DN: uni/infra/accportprof-{name}/hports-{name}-typ-{type}/portblk-{name} | uni/infra/fexprof-{name}/hports-{name}-typ-{type}/portblk-{name} | uni/infra/spaccportprof-{name}/shports-{name}-typ-{type}/portblk-{name}
# Reads models/data_aci_access_port_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_204 = yamldecode(file("${path.module}/../models/data_aci_access_port_block.yml"))["data_aci_access_port_block"]
}

data "aci_access_port_block" "n204" {
  name      = local.m_204["name"]
  parent_dn = local.m_204["parent_dn"]
}

output "n204_data_aci_access_port_block_id" {
  value = data.aci_access_port_block.n204.id
}
