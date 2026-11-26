# 599 · data source aci_concrete_device · 5. L4-L7 service graphs
# Data source for ACI Concrete Device
# APIC class: not collected · DN: not collected
# Reads models/data_aci_concrete_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_599 = yamldecode(file("${path.module}/../models/data_aci_concrete_device.yml"))["data_aci_concrete_device"]
}

data "aci_concrete_device" "n599" {
  annotation        = local.m_599["annotation"]
  description       = local.m_599["description"]
  l4_l7_device_dn   = local.m_599["l4_l7_device_dn"]
  name              = local.m_599["name"]
  name_alias        = local.m_599["name_alias"]
  vm_name           = local.m_599["vm_name"]
  vmm_controller_dn = local.m_599["vmm_controller_dn"]
}

output "n599_data_aci_concrete_device_id" {
  value = data.aci_concrete_device.n599.id
}
