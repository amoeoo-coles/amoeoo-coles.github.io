# 393 · data source aci_bridge_domain · 3. Tenant and networking
# Data source for ACI Bridge Domain
# APIC class: fvBD · DN: uni/tn-{name}/BD-{name}
# Reads models/data_aci_bridge_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_393 = yamldecode(file("${path.module}/../models/data_aci_bridge_domain.yml"))["data_aci_bridge_domain"]
}

data "aci_bridge_domain" "n393" {
  name      = local.m_393["name"]
  parent_dn = local.m_393["parent_dn"]
  dynamic "relation_fv_rs_bd_to_netflow_monitor_pol" {
    for_each = local.m_393["relation_fv_rs_bd_to_netflow_monitor_pol"] == null ? [] : local.m_393["relation_fv_rs_bd_to_netflow_monitor_pol"]
    content {
    }
  }
}

output "n393_data_aci_bridge_domain_id" {
  value = data.aci_bridge_domain.n393.id
}
