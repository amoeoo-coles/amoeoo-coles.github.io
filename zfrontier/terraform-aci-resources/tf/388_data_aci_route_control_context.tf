# 388 · data source aci_route_control_context · 3. Tenant and networking
# Data source for ACI Route Control Context
# APIC class: not collected · DN: not collected
# Reads models/data_aci_route_control_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_388 = yamldecode(file("${path.module}/../models/data_aci_route_control_context.yml"))["data_aci_route_control_context"]
}

data "aci_route_control_context" "n388" {
  action                   = local.m_388["action"]
  annotation               = local.m_388["annotation"]
  description              = local.m_388["description"]
  name                     = local.m_388["name"]
  name_alias               = local.m_388["name_alias"]
  order                    = local.m_388["order"]
  route_control_profile_dn = local.m_388["route_control_profile_dn"]
  set_rule                 = local.m_388["set_rule"]
}

output "n388_data_aci_route_control_context_id" {
  value = data.aci_route_control_context.n388.id
}
