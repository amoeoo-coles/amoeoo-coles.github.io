# 510 · data source aci_endpoint_security_group · 4. Application
# Data source for ACI Endpoint Security Group
# APIC class: fvESg · DN: uni/tn-{name}/ap-{name}/esg-{name}
# Reads models/data_aci_endpoint_security_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_510 = yamldecode(file("${path.module}/../models/data_aci_endpoint_security_group.yml"))["data_aci_endpoint_security_group"]
}

data "aci_endpoint_security_group" "n510" {
  name      = local.m_510["name"]
  parent_dn = local.m_510["parent_dn"]
  dynamic "relation_fv_rs_cons" {
    for_each = local.m_510["relation_fv_rs_cons"] == null ? [] : local.m_510["relation_fv_rs_cons"]
    content {
    }
  }
  dynamic "relation_fv_rs_cons_if" {
    for_each = local.m_510["relation_fv_rs_cons_if"] == null ? [] : local.m_510["relation_fv_rs_cons_if"]
    content {
    }
  }
  dynamic "relation_fv_rs_prov" {
    for_each = local.m_510["relation_fv_rs_prov"] == null ? [] : local.m_510["relation_fv_rs_prov"]
    content {
    }
  }
}

output "n510_data_aci_endpoint_security_group_id" {
  value = data.aci_endpoint_security_group.n510.id
}
