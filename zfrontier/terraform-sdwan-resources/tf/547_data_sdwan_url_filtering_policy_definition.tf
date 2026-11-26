# 547 · data source sdwan_url_filtering_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the URL Filtering Policy Definition .
# Reads models/data_sdwan_url_filtering_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_547 = yamldecode(file("${path.module}/../models/data_sdwan_url_filtering_policy_definition.yml"))["data_sdwan_url_filtering_policy_definition"]
}

data "sdwan_url_filtering_policy_definition" "n547" {
  id = local.m_547["id"]
}

output "n547_data_sdwan_url_filtering_policy_definition_id" {
  value = data.sdwan_url_filtering_policy_definition.n547.id
}
