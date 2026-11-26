# 095 · data source aci_external_management_network_subnet · 1. System and fabric setup
# Data source for ACI External Management Network Subnet
# APIC class: mgmtSubnet · DN: uni/tn-mgmt/extmgmt-default/instp-{name}/subnet-[{ip}]
# Reads models/data_aci_external_management_network_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_095 = yamldecode(file("${path.module}/../models/data_aci_external_management_network_subnet.yml"))["data_aci_external_management_network_subnet"]
}

data "aci_external_management_network_subnet" "n095" {
  ip        = local.m_095["ip"]
  parent_dn = local.m_095["parent_dn"]
}

output "n095_data_aci_external_management_network_subnet_id" {
  value = data.aci_external_management_network_subnet.n095.id
}
