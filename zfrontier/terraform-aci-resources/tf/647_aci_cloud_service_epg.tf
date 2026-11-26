# 647 · resource aci_cloud_service_epg · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Cloud Service EPG
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_service_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_647 = yamldecode(file("${path.module}/../models/aci_cloud_service_epg.yml"))["aci_cloud_service_epg"]
}

resource "aci_cloud_service_epg" "n647" {
  access_type                     = local.m_647["access_type"]
  annotation                      = local.m_647["annotation"]
  azure_private_endpoint          = local.m_647["azure_private_endpoint"]
  cloud_application_container_dn  = local.m_647["cloud_application_container_dn"]
  cloud_service_epg_type          = local.m_647["cloud_service_epg_type"]
  custom_service_type             = local.m_647["custom_service_type"]
  deployment_type                 = local.m_647["deployment_type"]
  description                     = local.m_647["description"]
  flood_on_encap                  = local.m_647["flood_on_encap"]
  label_match_criteria            = local.m_647["label_match_criteria"]
  name                            = local.m_647["name"]
  name_alias                      = local.m_647["name_alias"]
  preferred_group_member          = local.m_647["preferred_group_member"]
  prio                            = local.m_647["prio"]
  relation_cloud_rs_cloud_epg_ctx = local.m_647["relation_cloud_rs_cloud_epg_ctx"]
  relation_fv_rs_cust_qos_pol     = local.m_647["relation_fv_rs_cust_qos_pol"]
  relation_fv_rs_graph_def        = local.m_647["relation_fv_rs_graph_def"]
  relation_fv_rs_intra_epg        = local.m_647["relation_fv_rs_intra_epg"]
  relation_fv_rs_prot_by          = local.m_647["relation_fv_rs_prot_by"]
  relation_fv_rs_prov_def         = local.m_647["relation_fv_rs_prov_def"]
  relation_fv_rs_sec_inherited    = local.m_647["relation_fv_rs_sec_inherited"]
  dynamic "relation_fv_rs_cons" {
    for_each = local.m_647["relation_fv_rs_cons"] == null ? [] : local.m_647["relation_fv_rs_cons"]
    content {
      prio      = lookup(relation_fv_rs_cons.value, "prio", null)
      target_dn = lookup(relation_fv_rs_cons.value, "target_dn", null)
    }
  }
  dynamic "relation_fv_rs_cons_if" {
    for_each = local.m_647["relation_fv_rs_cons_if"] == null ? [] : local.m_647["relation_fv_rs_cons_if"]
    content {
      prio      = lookup(relation_fv_rs_cons_if.value, "prio", null)
      target_dn = lookup(relation_fv_rs_cons_if.value, "target_dn", null)
    }
  }
  dynamic "relation_fv_rs_prov" {
    for_each = local.m_647["relation_fv_rs_prov"] == null ? [] : local.m_647["relation_fv_rs_prov"]
    content {
      label_match_criteria = lookup(relation_fv_rs_prov.value, "label_match_criteria", null)
      prio                 = lookup(relation_fv_rs_prov.value, "prio", null)
      target_dn            = lookup(relation_fv_rs_prov.value, "target_dn", null)
    }
  }
}
