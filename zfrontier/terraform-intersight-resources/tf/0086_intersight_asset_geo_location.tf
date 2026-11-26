# Sample resource intersight_asset_geo_location — reads ../models/intersight_asset_geo_location.yml
locals { m086 = yamldecode(file("${path.module}/../models/intersight_asset_geo_location.yml"))["intersight_asset_geo_location"] }

resource "intersight_asset_geo_location" "n086" {
  account = try(local.m086["account"], null)
  account_moid = try(local.m086["account_moid"], null)
  additional_properties = try(local.m086["additional_properties"], null)
  address = try(local.m086["address"], null)
  ancestors = try(local.m086["ancestors"], null)
  class_id = try(local.m086["class_id"], null)
  coordinates = try(local.m086["coordinates"], null)
  create_time = try(local.m086["create_time"], null)
  domain_group_moid = try(local.m086["domain_group_moid"], null)
  id = try(local.m086["id"], null)
  mod_time = try(local.m086["mod_time"], null)
  moid = try(local.m086["moid"], null)
  name = try(local.m086["name"], null)
  object_type = try(local.m086["object_type"], null)
  owners = try(local.m086["owners"], null)
  parent = try(local.m086["parent"], null)
  permission_resources = try(local.m086["permission_resources"], null)
  shared_scope = try(local.m086["shared_scope"], null)
  tags = try(local.m086["tags"], null)
  version_context = try(local.m086["version_context"], null)
}
