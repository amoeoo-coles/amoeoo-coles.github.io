# 399 · data source aci_vrf · 3. Tenant and networking
# Data source for ACI VRF
# APIC class: fvCtx · DN: uni/tn-{name}/ctx-{name}
# Reads models/data_aci_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_399 = yamldecode(file("${path.module}/../models/data_aci_vrf.yml"))["data_aci_vrf"]
}

data "aci_vrf" "n399" {
  name      = local.m_399["name"]
  parent_dn = local.m_399["parent_dn"]
  dynamic "relation_fv_rs_ctx_to_bgp_ctx_af_pol" {
    for_each = local.m_399["relation_fv_rs_ctx_to_bgp_ctx_af_pol"] == null ? [] : local.m_399["relation_fv_rs_ctx_to_bgp_ctx_af_pol"]
    content {
    }
  }
  dynamic "relation_fv_rs_ctx_to_eigrp_ctx_af_pol" {
    for_each = local.m_399["relation_fv_rs_ctx_to_eigrp_ctx_af_pol"] == null ? [] : local.m_399["relation_fv_rs_ctx_to_eigrp_ctx_af_pol"]
    content {
    }
  }
  dynamic "relation_fv_rs_ctx_to_ospf_ctx_pol" {
    for_each = local.m_399["relation_fv_rs_ctx_to_ospf_ctx_pol"] == null ? [] : local.m_399["relation_fv_rs_ctx_to_ospf_ctx_pol"]
    content {
    }
  }
}

output "n399_data_aci_vrf_id" {
  value = data.aci_vrf.n399.id
}
