# 064 · data source sdwan_policy_object_security_local_domain_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Local Domain List Policy_object.
# Reads models/data_sdwan_policy_object_security_local_domain_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_064 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_local_domain_list.yml"))["data_sdwan_policy_object_security_local_domain_list"]
}

data "sdwan_policy_object_security_local_domain_list" "n064" {
  feature_profile_id = local.m_064["feature_profile_id"]
  id                 = local.m_064["id"]
  name               = local.m_064["name"]
}

output "n064_data_sdwan_policy_object_security_local_domain_list_id" {
  value = data.sdwan_policy_object_security_local_domain_list.n064.id
}
