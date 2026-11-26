# 440 · data source aci_external_epg · 3. Tenant and networking
# Data source for ACI External EPG
# APIC class: l3extInstP · DN: uni/tn-{name}/out-{name}/instP-{name}
# Reads models/data_aci_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_440 = yamldecode(file("${path.module}/../models/data_aci_external_epg.yml"))["data_aci_external_epg"]
}

data "aci_external_epg" "n440" {
  name      = local.m_440["name"]
  parent_dn = local.m_440["parent_dn"]
}

output "n440_data_aci_external_epg_id" {
  value = data.aci_external_epg.n440.id
}
