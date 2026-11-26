# 367 · data source sdwan_domain_list_policy_object · 10. (Classic) policy objects
# This data source can read the Domain List Policy Object .
# Reads models/data_sdwan_domain_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_367 = yamldecode(file("${path.module}/../models/data_sdwan_domain_list_policy_object.yml"))["data_sdwan_domain_list_policy_object"]
}

data "sdwan_domain_list_policy_object" "n367" {
  id = local.m_367["id"]
}

output "n367_data_sdwan_domain_list_policy_object_id" {
  value = data.sdwan_domain_list_policy_object.n367.id
}
