# 462 · data source aci_logical_interface_profile · 3. Tenant and networking
# Data source for ACI Logical Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_logical_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_462 = yamldecode(file("${path.module}/../models/data_aci_logical_interface_profile.yml"))["data_aci_logical_interface_profile"]
}

data "aci_logical_interface_profile" "n462" {
  annotation              = local.m_462["annotation"]
  description             = local.m_462["description"]
  logical_node_profile_dn = local.m_462["logical_node_profile_dn"]
  name                    = local.m_462["name"]
}

output "n462_data_aci_logical_interface_profile_id" {
  value = data.aci_logical_interface_profile.n462.id
}
