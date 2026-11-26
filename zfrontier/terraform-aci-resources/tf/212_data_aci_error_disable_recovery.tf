# 212 · data source aci_error_disable_recovery · 2. Access policies
# Data source for ACI Error Disable Recovery
# APIC class: not collected · DN: not collected
# Reads models/data_aci_error_disable_recovery.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_212 = yamldecode(file("${path.module}/../models/data_aci_error_disable_recovery.yml"))["data_aci_error_disable_recovery"]
}

data "aci_error_disable_recovery" "n212" {
  annotation          = local.m_212["annotation"]
  description         = local.m_212["description"]
  err_dis_recov_intvl = local.m_212["err_dis_recov_intvl"]
  name_alias          = local.m_212["name_alias"]
  dynamic "edr_event" {
    for_each = local.m_212["edr_event"] == null ? [] : local.m_212["edr_event"]
    content {
      annotation  = lookup(edr_event.value, "annotation", null)
      description = lookup(edr_event.value, "description", null)
      event       = lookup(edr_event.value, "event", null)
      name        = lookup(edr_event.value, "name", null)
      name_alias  = lookup(edr_event.value, "name_alias", null)
      recover     = lookup(edr_event.value, "recover", null)
    }
  }
}

output "n212_data_aci_error_disable_recovery_id" {
  value = data.aci_error_disable_recovery.n212.id
}
