# 666 · data source aci_cloud_subnet · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Subnet
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_666 = yamldecode(file("${path.module}/../models/data_aci_cloud_subnet.yml"))["data_aci_cloud_subnet"]
}

data "aci_cloud_subnet" "n666" {
  annotation         = local.m_666["annotation"]
  cloud_cidr_pool_dn = local.m_666["cloud_cidr_pool_dn"]
  description        = local.m_666["description"]
  ip                 = local.m_666["ip"]
}

output "n666_data_aci_cloud_subnet_id" {
  value = data.aci_cloud_subnet.n666.id
}
