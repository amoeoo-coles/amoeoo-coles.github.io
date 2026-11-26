# 266 · data source aci_vpc_explicit_protection_group · 2. Access policies
# Data source for ACI VPC Explicit Protection Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vpc_explicit_protection_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_266 = yamldecode(file("${path.module}/../models/data_aci_vpc_explicit_protection_group.yml"))["data_aci_vpc_explicit_protection_group"]
}

data "aci_vpc_explicit_protection_group" "n266" {
  annotation                       = local.m_266["annotation"]
  description                      = local.m_266["description"]
  name                             = local.m_266["name"]
  vpc_explicit_protection_group_id = local.m_266["vpc_explicit_protection_group_id"]
}

output "n266_data_aci_vpc_explicit_protection_group_id" {
  value = data.aci_vpc_explicit_protection_group.n266.id
}
