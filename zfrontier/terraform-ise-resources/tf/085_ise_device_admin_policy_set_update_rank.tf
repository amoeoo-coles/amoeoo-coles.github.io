# 085 · resource ise_device_admin_policy_set_update_rank · 6. Device administration
# This resource is used to update rank field in device admin policy set. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and device_admin_policy_set resource, you can bypass the APIs limitati
# Reads models/ise_device_admin_policy_set_update_rank.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_085 = yamldecode(file("${path.module}/../models/ise_device_admin_policy_set_update_rank.yml"))["ise_device_admin_policy_set_update_rank"]
}

resource "ise_device_admin_policy_set_update_rank" "n085" {
  policy_set_id = local.m_085["policy_set_id"]
  rank          = local.m_085["rank"]
}
