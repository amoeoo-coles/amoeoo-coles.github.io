# Sample resource intersight_task_hitachi_scoped_inventory — reads ../models/intersight_task_hitachi_scoped_inventory.yml
locals { m1367 = yamldecode(file("${path.module}/../models/intersight_task_hitachi_scoped_inventory.yml"))["intersight_task_hitachi_scoped_inventory"] }

resource "intersight_task_hitachi_scoped_inventory" "n1367" {
  account_moid = try(local.m1367["account_moid"], null)
  additional_properties = try(local.m1367["additional_properties"], null)
  ancestors = try(local.m1367["ancestors"], null)
  class_id = try(local.m1367["class_id"], null)
  create_time = try(local.m1367["create_time"], null)
  domain_group_moid = try(local.m1367["domain_group_moid"], null)
  id = try(local.m1367["id"], null)
  immediate = try(local.m1367["immediate"], null)
  mod_time = try(local.m1367["mod_time"], null)
  moid = try(local.m1367["moid"], null)
  naming_property = try(local.m1367["naming_property"], null)
  object_type = try(local.m1367["object_type"], null)
  owners = try(local.m1367["owners"], null)
  parent = try(local.m1367["parent"], null)
  permission_resources = try(local.m1367["permission_resources"], null)
  queries = try(local.m1367["queries"], null)
  registered_device = try(local.m1367["registered_device"], null)
  shared_scope = try(local.m1367["shared_scope"], null)
  tags = try(local.m1367["tags"], null)
  type = try(local.m1367["type"], null)
  values = try(local.m1367["values"], null)
  version_context = try(local.m1367["version_context"], null)
}
