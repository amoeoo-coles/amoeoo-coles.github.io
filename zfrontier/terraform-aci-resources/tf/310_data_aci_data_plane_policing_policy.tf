# 310 · data source aci_data_plane_policing_policy · 3. Tenant and networking
# Data source for ACI Data Plane Policing Policy
# APIC class: qosDppPol · DN: uni/infra/qosdpppol-{name} | uni/tn-{name}/qosdpppol-{name}
# Reads models/data_aci_data_plane_policing_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_310 = yamldecode(file("${path.module}/../models/data_aci_data_plane_policing_policy.yml"))["data_aci_data_plane_policing_policy"]
}

data "aci_data_plane_policing_policy" "n310" {
  name      = local.m_310["name"]
  parent_dn = local.m_310["parent_dn"]
}

output "n310_data_aci_data_plane_policing_policy_id" {
  value = data.aci_data_plane_policing_policy.n310.id
}
