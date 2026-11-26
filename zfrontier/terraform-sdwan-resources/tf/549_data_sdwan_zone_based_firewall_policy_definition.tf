# 549 · data source sdwan_zone_based_firewall_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Zone Based Firewall Policy Definition .
# Reads models/data_sdwan_zone_based_firewall_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_549 = yamldecode(file("${path.module}/../models/data_sdwan_zone_based_firewall_policy_definition.yml"))["data_sdwan_zone_based_firewall_policy_definition"]
}

data "sdwan_zone_based_firewall_policy_definition" "n549" {
  id = local.m_549["id"]
}

output "n549_data_sdwan_zone_based_firewall_policy_definition_id" {
  value = data.sdwan_zone_based_firewall_policy_definition.n549.id
}
