# Sample resource intersight_asset_pre_claim — reads ../models/intersight_asset_pre_claim.yml
locals { m087 = yamldecode(file("${path.module}/../models/intersight_asset_pre_claim.yml"))["intersight_asset_pre_claim"] }

resource "intersight_asset_pre_claim" "n087" {
  account_moid = try(local.m087["account_moid"], null)
  additional_properties = try(local.m087["additional_properties"], null)
  ancestors = try(local.m087["ancestors"], null)
  class_id = try(local.m087["class_id"], null)
  create_time = try(local.m087["create_time"], null)
  domain_group_moid = try(local.m087["domain_group_moid"], null)
  id = try(local.m087["id"], null)
  mod_time = try(local.m087["mod_time"], null)
  moid = try(local.m087["moid"], null)
  object_type = try(local.m087["object_type"], null)
  owners = try(local.m087["owners"], null)
  parent = try(local.m087["parent"], null)
  permission_resources = try(local.m087["permission_resources"], null)
  security_token = try(var.secrets["intersight_asset_pre_claim.security_token"], local.m087["security_token"])
  serial_number = try(local.m087["serial_number"], null)
  shared_scope = try(local.m087["shared_scope"], null)
  tags = try(local.m087["tags"], null)
  target = try(local.m087["target"], null)
  version_context = try(local.m087["version_context"], null)
}
