# 598 · resource aci_concrete_device · 5. L4-L7 service graphs
# Manages ACI Concrete Device
# APIC class: not collected · DN: not collected
# Reads models/aci_concrete_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_598 = yamldecode(file("${path.module}/../models/aci_concrete_device.yml"))["aci_concrete_device"]
}

resource "aci_concrete_device" "n598" {
  annotation        = local.m_598["annotation"]
  description       = local.m_598["description"]
  l4_l7_device_dn   = local.m_598["l4_l7_device_dn"]
  name              = local.m_598["name"]
  name_alias        = local.m_598["name_alias"]
  vm_name           = local.m_598["vm_name"]
  vmm_controller_dn = local.m_598["vmm_controller_dn"]
}
