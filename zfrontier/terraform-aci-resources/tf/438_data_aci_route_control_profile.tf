# 438 · data source aci_route_control_profile · 3. Tenant and networking
# Data source for ACI Route Control Profile
# APIC class: rtctrlProfile · DN: uni/tn-{name}/out-{name}/prof-{name} | uni/tn-{name}/prof-{name}
# Reads models/data_aci_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_438 = yamldecode(file("${path.module}/../models/data_aci_route_control_profile.yml"))["data_aci_route_control_profile"]
}

data "aci_route_control_profile" "n438" {
  name      = local.m_438["name"]
  parent_dn = local.m_438["parent_dn"]
}

output "n438_data_aci_route_control_profile_id" {
  value = data.aci_route_control_profile.n438.id
}
