# 677 · resource aci_span_destination_group · 7. Monitoring and BAU
# Manages ACI SPAN Destination Group
# APIC class: not collected · DN: not collected
# Reads models/aci_span_destination_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_677 = yamldecode(file("${path.module}/../models/aci_span_destination_group.yml"))["aci_span_destination_group"]
}

resource "aci_span_destination_group" "n677" {
  annotation  = local.m_677["annotation"]
  description = local.m_677["description"]
  name        = local.m_677["name"]
  name_alias  = local.m_677["name_alias"]
  tenant_dn   = local.m_677["tenant_dn"]
}
