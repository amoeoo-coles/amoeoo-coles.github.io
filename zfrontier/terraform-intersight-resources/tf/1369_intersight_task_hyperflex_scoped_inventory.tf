# Sample resource intersight_task_hyperflex_scoped_inventory — reads ../models/intersight_task_hyperflex_scoped_inventory.yml
locals { m1369 = yamldecode(file("${path.module}/../models/intersight_task_hyperflex_scoped_inventory.yml"))["intersight_task_hyperflex_scoped_inventory"] }

resource "intersight_task_hyperflex_scoped_inventory" "n1369" {
  account_moid = try(local.m1369["account_moid"], null)
  additional_properties = try(local.m1369["additional_properties"], null)
  ancestors = try(local.m1369["ancestors"], null)
  class_id = try(local.m1369["class_id"], null)
  create_time = try(local.m1369["create_time"], null)
  domain_group_moid = try(local.m1369["domain_group_moid"], null)
  id = try(local.m1369["id"], null)
  immediate = try(local.m1369["immediate"], null)
  mod_time = try(local.m1369["mod_time"], null)
  moid = try(local.m1369["moid"], null)
  naming_property = try(local.m1369["naming_property"], null)
  object_type = try(local.m1369["object_type"], null)
  owners = try(local.m1369["owners"], null)
  parent = try(local.m1369["parent"], null)
  permission_resources = try(local.m1369["permission_resources"], null)
  queries = try(local.m1369["queries"], null)
  registered_device = try(local.m1369["registered_device"], null)
  shared_scope = try(local.m1369["shared_scope"], null)
  tags = try(local.m1369["tags"], null)
  type = try(local.m1369["type"], null)
  values = try(local.m1369["values"], null)
  version_context = try(local.m1369["version_context"], null)
}
