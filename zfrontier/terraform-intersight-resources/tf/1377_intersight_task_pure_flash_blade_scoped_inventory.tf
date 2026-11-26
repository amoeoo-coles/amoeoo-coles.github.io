# Sample resource intersight_task_pure_flash_blade_scoped_inventory — reads ../models/intersight_task_pure_flash_blade_scoped_inventory.yml
locals { m1377 = yamldecode(file("${path.module}/../models/intersight_task_pure_flash_blade_scoped_inventory.yml"))["intersight_task_pure_flash_blade_scoped_inventory"] }

resource "intersight_task_pure_flash_blade_scoped_inventory" "n1377" {
  account_moid = try(local.m1377["account_moid"], null)
  additional_properties = try(local.m1377["additional_properties"], null)
  ancestors = try(local.m1377["ancestors"], null)
  class_id = try(local.m1377["class_id"], null)
  create_time = try(local.m1377["create_time"], null)
  domain_group_moid = try(local.m1377["domain_group_moid"], null)
  id = try(local.m1377["id"], null)
  immediate = try(local.m1377["immediate"], null)
  mod_time = try(local.m1377["mod_time"], null)
  moid = try(local.m1377["moid"], null)
  naming_property = try(local.m1377["naming_property"], null)
  object_type = try(local.m1377["object_type"], null)
  owners = try(local.m1377["owners"], null)
  parent = try(local.m1377["parent"], null)
  permission_resources = try(local.m1377["permission_resources"], null)
  queries = try(local.m1377["queries"], null)
  registered_device = try(local.m1377["registered_device"], null)
  shared_scope = try(local.m1377["shared_scope"], null)
  tags = try(local.m1377["tags"], null)
  type = try(local.m1377["type"], null)
  values = try(local.m1377["values"], null)
  version_context = try(local.m1377["version_context"], null)
}
