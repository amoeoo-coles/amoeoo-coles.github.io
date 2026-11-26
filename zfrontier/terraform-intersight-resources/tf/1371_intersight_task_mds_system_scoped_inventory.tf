# Sample resource intersight_task_mds_system_scoped_inventory — reads ../models/intersight_task_mds_system_scoped_inventory.yml
locals { m1371 = yamldecode(file("${path.module}/../models/intersight_task_mds_system_scoped_inventory.yml"))["intersight_task_mds_system_scoped_inventory"] }

resource "intersight_task_mds_system_scoped_inventory" "n1371" {
  account_moid = try(local.m1371["account_moid"], null)
  additional_properties = try(local.m1371["additional_properties"], null)
  ancestors = try(local.m1371["ancestors"], null)
  class_id = try(local.m1371["class_id"], null)
  create_time = try(local.m1371["create_time"], null)
  domain_group_moid = try(local.m1371["domain_group_moid"], null)
  id = try(local.m1371["id"], null)
  immediate = try(local.m1371["immediate"], null)
  mod_time = try(local.m1371["mod_time"], null)
  moid = try(local.m1371["moid"], null)
  naming_property = try(local.m1371["naming_property"], null)
  object_type = try(local.m1371["object_type"], null)
  owners = try(local.m1371["owners"], null)
  parent = try(local.m1371["parent"], null)
  permission_resources = try(local.m1371["permission_resources"], null)
  queries = try(local.m1371["queries"], null)
  registered_device = try(local.m1371["registered_device"], null)
  shared_scope = try(local.m1371["shared_scope"], null)
  tags = try(local.m1371["tags"], null)
  type = try(local.m1371["type"], null)
  values = try(local.m1371["values"], null)
  version_context = try(local.m1371["version_context"], null)
}
