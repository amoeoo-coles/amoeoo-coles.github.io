# 132 · data source aci_access_interface_override · 2. Access policies
# Data source for ACI Access Interface Override
# APIC class: infraHPathS · DN: uni/infra/hpaths-{name}
# Reads models/data_aci_access_interface_override.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_132 = yamldecode(file("${path.module}/../models/data_aci_access_interface_override.yml"))["data_aci_access_interface_override"]
}

data "aci_access_interface_override" "n132" {
  name      = local.m_132["name"]
  parent_dn = local.m_132["parent_dn"]
}

output "n132_data_aci_access_interface_override_id" {
  value = data.aci_access_interface_override.n132.id
}
