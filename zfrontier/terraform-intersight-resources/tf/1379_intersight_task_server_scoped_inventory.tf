# Sample resource intersight_task_server_scoped_inventory — reads ../models/intersight_task_server_scoped_inventory.yml
locals { m1379 = yamldecode(file("${path.module}/../models/intersight_task_server_scoped_inventory.yml"))["intersight_task_server_scoped_inventory"] }

resource "intersight_task_server_scoped_inventory" "n1379" {
  account_moid = try(local.m1379["account_moid"], null)
  additional_properties = try(local.m1379["additional_properties"], null)
  ancestors = try(local.m1379["ancestors"], null)
  class_id = try(local.m1379["class_id"], null)
  create_time = try(local.m1379["create_time"], null)
  domain_group_moid = try(local.m1379["domain_group_moid"], null)
  id = try(local.m1379["id"], null)
  immediate = try(local.m1379["immediate"], null)
  mod_time = try(local.m1379["mod_time"], null)
  moid = try(local.m1379["moid"], null)
  naming_property = try(local.m1379["naming_property"], null)
  object_type = try(local.m1379["object_type"], null)
  owners = try(local.m1379["owners"], null)
  parent = try(local.m1379["parent"], null)
  permission_resources = try(local.m1379["permission_resources"], null)
  queries = try(local.m1379["queries"], null)
  registered_device = try(local.m1379["registered_device"], null)
  shared_scope = try(local.m1379["shared_scope"], null)
  tags = try(local.m1379["tags"], null)
  type = try(local.m1379["type"], null)
  values = try(local.m1379["values"], null)
  version_context = try(local.m1379["version_context"], null)
}
