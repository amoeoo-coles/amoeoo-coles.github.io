# Sample resource intersight_cloud_collect_inventory — reads ../models/intersight_cloud_collect_inventory.yml
locals { m224 = yamldecode(file("${path.module}/../models/intersight_cloud_collect_inventory.yml"))["intersight_cloud_collect_inventory"] }

resource "intersight_cloud_collect_inventory" "n224" {
  account_moid = try(local.m224["account_moid"], null)
  additional_properties = try(local.m224["additional_properties"], null)
  ancestors = try(local.m224["ancestors"], null)
  class_id = try(local.m224["class_id"], null)
  create_time = try(local.m224["create_time"], null)
  domain_group_moid = try(local.m224["domain_group_moid"], null)
  id = try(local.m224["id"], null)
  mod_time = try(local.m224["mod_time"], null)
  moid = try(local.m224["moid"], null)
  object_type = try(local.m224["object_type"], null)
  owners = try(local.m224["owners"], null)
  parent = try(local.m224["parent"], null)
  permission_resources = try(local.m224["permission_resources"], null)
  shared_scope = try(local.m224["shared_scope"], null)
  tags = try(local.m224["tags"], null)
  target = try(local.m224["target"], null)
  target_id = try(local.m224["target_id"], null)
  version_context = try(local.m224["version_context"], null)
}
