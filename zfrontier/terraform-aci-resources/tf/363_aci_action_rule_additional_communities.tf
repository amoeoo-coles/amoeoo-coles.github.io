# 363 · resource aci_action_rule_additional_communities · 3. Tenant and networking
# Manages ACI Action Rule Profile Set Additional Communities
# APIC class: not collected · DN: not collected
# Reads models/aci_action_rule_additional_communities.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_363 = yamldecode(file("${path.module}/../models/aci_action_rule_additional_communities.yml"))["aci_action_rule_additional_communities"]
}

resource "aci_action_rule_additional_communities" "n363" {
  action_rule_profile_dn = local.m_363["action_rule_profile_dn"]
  annotation             = local.m_363["annotation"]
  community              = local.m_363["community"]
  description            = local.m_363["description"]
  name_alias             = local.m_363["name_alias"]
  set_criteria           = local.m_363["set_criteria"]
}
