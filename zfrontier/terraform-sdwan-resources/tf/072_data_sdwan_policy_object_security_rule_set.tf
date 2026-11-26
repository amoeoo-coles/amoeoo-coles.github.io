# 072 · data source sdwan_policy_object_security_rule_set · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Rule Set Policy_object.
# Reads models/data_sdwan_policy_object_security_rule_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_072 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_rule_set.yml"))["data_sdwan_policy_object_security_rule_set"]
}

data "sdwan_policy_object_security_rule_set" "n072" {
  feature_profile_id = local.m_072["feature_profile_id"]
  id                 = local.m_072["id"]
  name               = local.m_072["name"]
}

output "n072_data_sdwan_policy_object_security_rule_set_id" {
  value = data.sdwan_policy_object_security_rule_set.n072.id
}
