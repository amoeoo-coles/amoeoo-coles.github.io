# Sample resource intersight_inventory_request — reads ../models/intersight_inventory_request.yml
locals { m747 = yamldecode(file("${path.module}/../models/intersight_inventory_request.yml"))["intersight_inventory_request"] }

resource "intersight_inventory_request" "n747" {
  account_moid = try(local.m747["account_moid"], null)
  additional_properties = try(local.m747["additional_properties"], null)
  ancestors = try(local.m747["ancestors"], null)
  class_id = try(local.m747["class_id"], null)
  create_time = try(local.m747["create_time"], null)
  device = try(local.m747["device"], null)
  domain_group_moid = try(local.m747["domain_group_moid"], null)
  id = try(local.m747["id"], null)
  mod_time = try(local.m747["mod_time"], null)
  moid = try(local.m747["moid"], null)
  mos = try(local.m747["mos"], null)
  object_type = try(local.m747["object_type"], null)
  owners = try(local.m747["owners"], null)
  parent = try(local.m747["parent"], null)
  permission_resources = try(local.m747["permission_resources"], null)
  shared_scope = try(local.m747["shared_scope"], null)
  tags = try(local.m747["tags"], null)
  version_context = try(local.m747["version_context"], null)
}
