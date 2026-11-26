# 045 ndfc_configuration_deploy — 7. Day 2 and operations
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/configuration_deploy
# Reads ../models/ndfc_configuration_deploy.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_configuration_deploy = yamldecode(file("${path.module}/../models/ndfc_configuration_deploy.yml"))["ndfc_configuration_deploy"]
}

resource "ndfc_configuration_deploy" "this" {
  always_execute = local.ndfc_configuration_deploy.always_execute
  deploy         = local.ndfc_configuration_deploy.deploy
  fabric_name    = local.ndfc_configuration_deploy.fabric_name
  recalculate    = local.ndfc_configuration_deploy.recalculate
  serial_numbers = local.ndfc_configuration_deploy.serial_numbers
}
