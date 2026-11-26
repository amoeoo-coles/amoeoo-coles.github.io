# 086 · resource ise_device_admin_policy_set_update_ranks · 6. Device administration
# This resource is used to bulk update rank field in device admin policy set. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and device_admin_policy_set resource, you can bypass the APIs lim
# Reads models/ise_device_admin_policy_set_update_ranks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_086 = yamldecode(file("${path.module}/../models/ise_device_admin_policy_set_update_ranks.yml"))["ise_device_admin_policy_set_update_ranks"]
}

resource "ise_device_admin_policy_set_update_ranks" "n086" {
  policies = local.m_086["policies"]
}
