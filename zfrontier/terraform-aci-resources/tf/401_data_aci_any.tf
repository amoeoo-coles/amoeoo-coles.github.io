# 401 · data source aci_any · 3. Tenant and networking
# Data source for ACI Any
# APIC class: vzAny · DN: uni/tn-{name}/ctx-{name}/any
# Reads models/data_aci_any.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_401 = yamldecode(file("${path.module}/../models/data_aci_any.yml"))["data_aci_any"]
}

data "aci_any" "n401" {
  parent_dn = local.m_401["parent_dn"]
}

output "n401_data_aci_any_id" {
  value = data.aci_any.n401.id
}
