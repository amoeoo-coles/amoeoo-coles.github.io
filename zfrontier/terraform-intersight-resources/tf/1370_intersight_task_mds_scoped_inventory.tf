# Sample resource intersight_task_mds_scoped_inventory — reads ../models/intersight_task_mds_scoped_inventory.yml
locals { m1370 = yamldecode(file("${path.module}/../models/intersight_task_mds_scoped_inventory.yml"))["intersight_task_mds_scoped_inventory"] }

resource "intersight_task_mds_scoped_inventory" "n1370" {
  account_moid = try(local.m1370["account_moid"], null)
  additional_properties = try(local.m1370["additional_properties"], null)
  ancestors = try(local.m1370["ancestors"], null)
  class_id = try(local.m1370["class_id"], null)
  create_time = try(local.m1370["create_time"], null)
  domain_group_moid = try(local.m1370["domain_group_moid"], null)
  id = try(local.m1370["id"], null)
  immediate = try(local.m1370["immediate"], null)
  mod_time = try(local.m1370["mod_time"], null)
  moid = try(local.m1370["moid"], null)
  naming_property = try(local.m1370["naming_property"], null)
  object_type = try(local.m1370["object_type"], null)
  owners = try(local.m1370["owners"], null)
  parent = try(local.m1370["parent"], null)
  permission_resources = try(local.m1370["permission_resources"], null)
  queries = try(local.m1370["queries"], null)
  registered_device = try(local.m1370["registered_device"], null)
  shared_scope = try(local.m1370["shared_scope"], null)
  tags = try(local.m1370["tags"], null)
  type = try(local.m1370["type"], null)
  values = try(local.m1370["values"], null)
  version_context = try(local.m1370["version_context"], null)
}
