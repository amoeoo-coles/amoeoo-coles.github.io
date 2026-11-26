# Sample resource intersight_task_nexus_system_scoped_inventory — reads ../models/intersight_task_nexus_system_scoped_inventory.yml
locals { m1375 = yamldecode(file("${path.module}/../models/intersight_task_nexus_system_scoped_inventory.yml"))["intersight_task_nexus_system_scoped_inventory"] }

resource "intersight_task_nexus_system_scoped_inventory" "n1375" {
  account_moid = try(local.m1375["account_moid"], null)
  additional_properties = try(local.m1375["additional_properties"], null)
  ancestors = try(local.m1375["ancestors"], null)
  class_id = try(local.m1375["class_id"], null)
  create_time = try(local.m1375["create_time"], null)
  domain_group_moid = try(local.m1375["domain_group_moid"], null)
  id = try(local.m1375["id"], null)
  immediate = try(local.m1375["immediate"], null)
  mod_time = try(local.m1375["mod_time"], null)
  moid = try(local.m1375["moid"], null)
  naming_property = try(local.m1375["naming_property"], null)
  object_type = try(local.m1375["object_type"], null)
  owners = try(local.m1375["owners"], null)
  parent = try(local.m1375["parent"], null)
  permission_resources = try(local.m1375["permission_resources"], null)
  queries = try(local.m1375["queries"], null)
  registered_device = try(local.m1375["registered_device"], null)
  shared_scope = try(local.m1375["shared_scope"], null)
  tags = try(local.m1375["tags"], null)
  type = try(local.m1375["type"], null)
  values = try(local.m1375["values"], null)
  version_context = try(local.m1375["version_context"], null)
}
