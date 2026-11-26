# 269 · resource aci_vxlan_pool · 2. Access policies
# Manages ACI VXLAN Pool
# APIC class: not collected · DN: not collected
# Reads models/aci_vxlan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_269 = yamldecode(file("${path.module}/../models/aci_vxlan_pool.yml"))["aci_vxlan_pool"]
}

resource "aci_vxlan_pool" "n269" {
  annotation  = local.m_269["annotation"]
  description = local.m_269["description"]
  name        = local.m_269["name"]
  name_alias  = local.m_269["name_alias"]
}
