# 094 · resource aci_external_management_network_subnet · 1. System and fabric setup
# Manages ACI External Management Network Subnet
# APIC class: mgmtSubnet · DN: uni/tn-mgmt/extmgmt-default/instp-{name}/subnet-[{ip}]
# Reads models/aci_external_management_network_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_094 = yamldecode(file("${path.module}/../models/aci_external_management_network_subnet.yml"))["aci_external_management_network_subnet"]
}

resource "aci_external_management_network_subnet" "n094" {
  annotation  = local.m_094["annotation"]
  annotations = local.m_094["annotations"]
  description = local.m_094["description"]
  ip          = local.m_094["ip"]
  name        = local.m_094["name"]
  name_alias  = local.m_094["name_alias"]
  parent_dn   = local.m_094["parent_dn"]
  tags        = local.m_094["tags"]
}
