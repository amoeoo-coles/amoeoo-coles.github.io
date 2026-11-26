# 449 · resource aci_l3out_provider_label · 3. Tenant and networking
# Manages ACI L3Out Provider Label
# APIC class: l3extProvLbl · DN: uni/tn-{name}/out-{name}/provlbl-{name}
# Reads models/aci_l3out_provider_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_449 = yamldecode(file("${path.module}/../models/aci_l3out_provider_label.yml"))["aci_l3out_provider_label"]
}

resource "aci_l3out_provider_label" "n449" {
  annotation  = local.m_449["annotation"]
  annotations = local.m_449["annotations"]
  description = local.m_449["description"]
  name        = local.m_449["name"]
  name_alias  = local.m_449["name_alias"]
  owner_key   = local.m_449["owner_key"]
  owner_tag   = local.m_449["owner_tag"]
  parent_dn   = local.m_449["parent_dn"]
  tag         = local.m_449["tag"]
  tags        = local.m_449["tags"]
}
