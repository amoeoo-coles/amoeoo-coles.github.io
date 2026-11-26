# 638 · data source aci_cloud_l4_l7_third_party_device · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Cloud L4-L7 Third Party Device
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_l4_l7_third_party_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_638 = yamldecode(file("${path.module}/../models/data_aci_cloud_l4_l7_third_party_device.yml"))["data_aci_cloud_l4_l7_third_party_device"]
}

data "aci_cloud_l4_l7_third_party_device" "n638" {
  name       = local.m_638["name"]
  name_alias = local.m_638["name_alias"]
  tenant_dn  = local.m_638["tenant_dn"]
}

output "n638_data_aci_cloud_l4_l7_third_party_device_id" {
  value = data.aci_cloud_l4_l7_third_party_device.n638.id
}
