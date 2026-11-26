# 052 · data source sdwan_policy_object_security_fqdn_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security FQDN List Policy_object.
# Reads models/data_sdwan_policy_object_security_fqdn_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_052 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_fqdn_list.yml"))["data_sdwan_policy_object_security_fqdn_list"]
}

data "sdwan_policy_object_security_fqdn_list" "n052" {
  feature_profile_id = local.m_052["feature_profile_id"]
  id = local.m_052["id"]
  name = local.m_052["name"]
}

output "n052_data_sdwan_policy_object_security_fqdn_list_id" {
  value = data.sdwan_policy_object_security_fqdn_list.n052.id
}
