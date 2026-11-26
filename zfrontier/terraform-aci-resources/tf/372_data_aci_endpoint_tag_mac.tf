# 372 · data source aci_endpoint_tag_mac · 3. Tenant and networking
# Data source for ACI Endpoint Tag MAC
# APIC class: fvEpMacTag · DN: uni/tn-{name}/eptags/epmactag-{mac}-[{bdName}]
# Reads models/data_aci_endpoint_tag_mac.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_372 = yamldecode(file("${path.module}/../models/data_aci_endpoint_tag_mac.yml"))["data_aci_endpoint_tag_mac"]
}

data "aci_endpoint_tag_mac" "n372" {
  bd_name   = local.m_372["bd_name"]
  mac       = local.m_372["mac"]
  parent_dn = local.m_372["parent_dn"]
}

output "n372_data_aci_endpoint_tag_mac_id" {
  value = data.aci_endpoint_tag_mac.n372.id
}
