# 007 ndfc_inventory_devices — 1. Global, fabric and features
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/inventory_devices
# Reads ../models/ndfc_inventory_devices.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_inventory_devices = yamldecode(file("${path.module}/../models/ndfc_inventory_devices.yml"))["ndfc_inventory_devices"]
}

resource "ndfc_inventory_devices" "this" {
  auth_protocol                             = local.ndfc_inventory_devices.auth_protocol
  deploy                                    = local.ndfc_inventory_devices.deploy
  devices                                   = local.ndfc_inventory_devices.devices
  fabric_name                               = local.ndfc_inventory_devices.fabric_name
  max_hops                                  = local.ndfc_inventory_devices.max_hops
  password                                  = var.ndfc_switch_password
  preserve_config                           = local.ndfc_inventory_devices.preserve_config
  retries                                   = local.ndfc_inventory_devices.retries
  retry_wait_timeout                        = local.ndfc_inventory_devices.retry_wait_timeout
  save                                      = local.ndfc_inventory_devices.save
  seed_ip                                   = local.ndfc_inventory_devices.seed_ip
  set_as_individual_device_write_credential = local.ndfc_inventory_devices.set_as_individual_device_write_credential
  username                                  = var.ndfc_switch_username
}
