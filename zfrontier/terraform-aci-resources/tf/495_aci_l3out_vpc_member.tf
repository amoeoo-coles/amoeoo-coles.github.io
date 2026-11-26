# 495 · resource aci_l3out_vpc_member · 3. Tenant and networking
# Manages ACI L3out VPC Member
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_vpc_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_495 = yamldecode(file("${path.module}/../models/aci_l3out_vpc_member.yml"))["aci_l3out_vpc_member"]
}

resource "aci_l3out_vpc_member" "n495" {
  addr         = local.m_495["addr"]
  annotation   = local.m_495["annotation"]
  description  = local.m_495["description"]
  ipv6_dad     = local.m_495["ipv6_dad"]
  leaf_port_dn = local.m_495["leaf_port_dn"]
  ll_addr      = local.m_495["ll_addr"]
  name_alias   = local.m_495["name_alias"]
  side         = local.m_495["side"]
}
