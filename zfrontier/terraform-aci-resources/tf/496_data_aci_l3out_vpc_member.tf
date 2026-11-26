# 496 · data source aci_l3out_vpc_member · 3. Tenant and networking
# Data source for ACI L3out VPC Member
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_vpc_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_496 = yamldecode(file("${path.module}/../models/data_aci_l3out_vpc_member.yml"))["data_aci_l3out_vpc_member"]
}

data "aci_l3out_vpc_member" "n496" {
  addr         = local.m_496["addr"]
  annotation   = local.m_496["annotation"]
  description  = local.m_496["description"]
  ipv6_dad     = local.m_496["ipv6_dad"]
  leaf_port_dn = local.m_496["leaf_port_dn"]
  ll_addr      = local.m_496["ll_addr"]
  name_alias   = local.m_496["name_alias"]
  side         = local.m_496["side"]
}

output "n496_data_aci_l3out_vpc_member_id" {
  value = data.aci_l3out_vpc_member.n496.id
}
