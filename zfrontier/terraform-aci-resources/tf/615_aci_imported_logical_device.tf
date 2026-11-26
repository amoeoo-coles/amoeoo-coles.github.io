# 615 · resource aci_imported_logical_device · 5. L4-L7 service graphs
# Manages ACI Imported Logical Device
# APIC class: vnsLDevIf · DN: uni/tn-{name}/lDevIf-[{ldev}]
# Reads models/aci_imported_logical_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_615 = yamldecode(file("${path.module}/../models/aci_imported_logical_device.yml"))["aci_imported_logical_device"]
}

resource "aci_imported_logical_device" "n615" {
  annotation     = local.m_615["annotation"]
  annotations    = local.m_615["annotations"]
  description    = local.m_615["description"]
  logical_device = local.m_615["logical_device"]
  name           = local.m_615["name"]
  name_alias     = local.m_615["name_alias"]
  parent_dn      = local.m_615["parent_dn"]
  tags           = local.m_615["tags"]
}
