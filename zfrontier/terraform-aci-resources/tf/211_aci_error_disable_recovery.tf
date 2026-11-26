# 211 · resource aci_error_disable_recovery · 2. Access policies
# Manages ACI Error Disable Recovery
# APIC class: not collected · DN: not collected
# Reads models/aci_error_disable_recovery.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_211 = yamldecode(file("${path.module}/../models/aci_error_disable_recovery.yml"))["aci_error_disable_recovery"]
}

resource "aci_error_disable_recovery" "n211" {
  annotation          = local.m_211["annotation"]
  description         = local.m_211["description"]
  edr_event_ids       = local.m_211["edr_event_ids"]
  err_dis_recov_intvl = local.m_211["err_dis_recov_intvl"]
  name_alias          = local.m_211["name_alias"]
  dynamic "edr_event" {
    for_each = local.m_211["edr_event"] == null ? [] : local.m_211["edr_event"]
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
