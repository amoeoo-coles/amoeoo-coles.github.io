# 361 · data source sdwan_data_fqdn_prefix_list_policy_object · 10. (Classic) policy objects
# This data source can read the Data FQDN Prefix List Policy Object .
# Reads models/data_sdwan_data_fqdn_prefix_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_361 = yamldecode(file("${path.module}/../models/data_sdwan_data_fqdn_prefix_list_policy_object.yml"))["data_sdwan_data_fqdn_prefix_list_policy_object"]
}

data "sdwan_data_fqdn_prefix_list_policy_object" "n361" {
  id = local.m_361["id"]
}

output "n361_data_sdwan_data_fqdn_prefix_list_policy_object_id" {
  value = data.sdwan_data_fqdn_prefix_list_policy_object.n361.id
}
