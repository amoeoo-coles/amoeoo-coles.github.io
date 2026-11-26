# 043 ndfc_policy — 7. Day 2 and operations
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/policy
# Reads ../models/ndfc_policy.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_policy = yamldecode(file("${path.module}/../models/ndfc_policy.yml"))["ndfc_policy"]
}

resource "ndfc_policy" "this" {
  deploy            = local.ndfc_policy.deploy
  description       = local.ndfc_policy.description
  entity_name       = local.ndfc_policy.entity_name
  entity_type       = local.ndfc_policy.entity_type
  is_policy_group   = local.ndfc_policy.is_policy_group
  policy_parameters = local.ndfc_policy.policy_parameters
  priority          = local.ndfc_policy.priority
  serial_numbers    = local.ndfc_policy.serial_numbers
  source            = local.ndfc_policy.source
  template_name     = local.ndfc_policy.template_name
}
