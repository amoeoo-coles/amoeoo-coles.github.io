# 328 · data source aci_ip_address_pool · 3. Tenant and networking
# Data source for ACI IP Address Pool
# APIC class: fvnsAddrInst · DN: uni/tn-{name}/addrinst-{name}
# Reads models/data_aci_ip_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_328 = yamldecode(file("${path.module}/../models/data_aci_ip_address_pool.yml"))["data_aci_ip_address_pool"]
}

data "aci_ip_address_pool" "n328" {
  name = local.m_328["name"]
}

output "n328_data_aci_ip_address_pool_id" {
  value = data.aci_ip_address_pool.n328.id
}
