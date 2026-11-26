# 364 · data source aci_action_rule_additional_communities · 3. Tenant and networking
# Data source for ACI Action Rule Profile Set Additional Communities
# APIC class: not collected · DN: not collected
# Reads models/data_aci_action_rule_additional_communities.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_364 = yamldecode(file("${path.module}/../models/data_aci_action_rule_additional_communities.yml"))["data_aci_action_rule_additional_communities"]
}

data "aci_action_rule_additional_communities" "n364" {
  action_rule_profile_dn = local.m_364["action_rule_profile_dn"]
  annotation             = local.m_364["annotation"]
  community              = local.m_364["community"]
  description            = local.m_364["description"]
  name_alias             = local.m_364["name_alias"]
  set_criteria           = local.m_364["set_criteria"]
}

output "n364_data_aci_action_rule_additional_communities_id" {
  value = data.aci_action_rule_additional_communities.n364.id
}
