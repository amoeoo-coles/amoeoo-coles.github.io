# 636 · data source aci_cloud_l4_l7_native_load_balancer · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Cloud L4-L7 Native Load Balancer
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_l4_l7_native_load_balancer.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_636 = yamldecode(file("${path.module}/../models/data_aci_cloud_l4_l7_native_load_balancer.yml"))["data_aci_cloud_l4_l7_native_load_balancer"]
}

data "aci_cloud_l4_l7_native_load_balancer" "n636" {
  name       = local.m_636["name"]
  name_alias = local.m_636["name_alias"]
  tenant_dn  = local.m_636["tenant_dn"]
}

output "n636_data_aci_cloud_l4_l7_native_load_balancer_id" {
  value = data.aci_cloud_l4_l7_native_load_balancer.n636.id
}
