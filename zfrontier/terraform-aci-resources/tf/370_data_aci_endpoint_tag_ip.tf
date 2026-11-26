# 370 · data source aci_endpoint_tag_ip · 3. Tenant and networking
# Data source for ACI Endpoint Tag IP
# APIC class: fvEpIpTag · DN: uni/tn-{name}/eptags/epiptag-[{ip}]-{ctxName}
# Reads models/data_aci_endpoint_tag_ip.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_370 = yamldecode(file("${path.module}/../models/data_aci_endpoint_tag_ip.yml"))["data_aci_endpoint_tag_ip"]
}

data "aci_endpoint_tag_ip" "n370" {
  ip        = local.m_370["ip"]
  parent_dn = local.m_370["parent_dn"]
  vrf_name  = local.m_370["vrf_name"]
}

output "n370_data_aci_endpoint_tag_ip_id" {
  value = data.aci_endpoint_tag_ip.n370.id
}
