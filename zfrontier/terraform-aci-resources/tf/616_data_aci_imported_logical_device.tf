# 616 · data source aci_imported_logical_device · 5. L4-L7 service graphs
# Data source for ACI Imported Logical Device
# APIC class: vnsLDevIf · DN: uni/tn-{name}/lDevIf-[{ldev}]
# Reads models/data_aci_imported_logical_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_616 = yamldecode(file("${path.module}/../models/data_aci_imported_logical_device.yml"))["data_aci_imported_logical_device"]
}

data "aci_imported_logical_device" "n616" {
  logical_device = local.m_616["logical_device"]
  parent_dn      = local.m_616["parent_dn"]
}

output "n616_data_aci_imported_logical_device_id" {
  value = data.aci_imported_logical_device.n616.id
}
