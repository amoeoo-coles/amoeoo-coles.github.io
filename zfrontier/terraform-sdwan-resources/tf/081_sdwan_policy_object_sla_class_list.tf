# 081 · resource sdwan_policy_object_sla_class_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object SLA Class List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_sla_class_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_081 = yamldecode(file("${path.module}/../models/sdwan_policy_object_sla_class_list.yml"))["sdwan_policy_object_sla_class_list"]
}

resource "sdwan_policy_object_sla_class_list" "n081" {
  description        = local.m_081["description"]
  entries            = local.m_081["entries"]
  feature_profile_id = local.m_081["feature_profile_id"]
  name               = local.m_081["name"]
}
