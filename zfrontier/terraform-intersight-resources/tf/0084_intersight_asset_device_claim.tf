# Sample resource intersight_asset_device_claim — reads ../models/intersight_asset_device_claim.yml
locals { m084 = yamldecode(file("${path.module}/../models/intersight_asset_device_claim.yml"))["intersight_asset_device_claim"] }

resource "intersight_asset_device_claim" "n084" {
  account = try(local.m084["account"], null)
  account_moid = try(local.m084["account_moid"], null)
  additional_properties = try(local.m084["additional_properties"], null)
  ancestors = try(local.m084["ancestors"], null)
  class_id = try(local.m084["class_id"], null)
  create_time = try(local.m084["create_time"], null)
  custom_permission_resources = try(local.m084["custom_permission_resources"], null)
  device = try(local.m084["device"], null)
  domain_group_moid = try(local.m084["domain_group_moid"], null)
  id = try(local.m084["id"], null)
  mod_time = try(local.m084["mod_time"], null)
  moid = try(local.m084["moid"], null)
  object_type = try(local.m084["object_type"], null)
  owners = try(local.m084["owners"], null)
  parent = try(local.m084["parent"], null)
  permission_resources = try(local.m084["permission_resources"], null)
  reservation = try(local.m084["reservation"], null)
  security_token = try(var.secrets["intersight_asset_device_claim.security_token"], local.m084["security_token"])
  serial_number = try(local.m084["serial_number"], null)
  shared_scope = try(local.m084["shared_scope"], null)
  tags = try(local.m084["tags"], null)
  version_context = try(local.m084["version_context"], null)
}
