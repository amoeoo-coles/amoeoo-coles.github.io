# Sample resource intersight_task_net_app_scoped_inventory — reads ../models/intersight_task_net_app_scoped_inventory.yml
locals { m1373 = yamldecode(file("${path.module}/../models/intersight_task_net_app_scoped_inventory.yml"))["intersight_task_net_app_scoped_inventory"] }

resource "intersight_task_net_app_scoped_inventory" "n1373" {
  account_moid = try(local.m1373["account_moid"], null)
  additional_properties = try(local.m1373["additional_properties"], null)
  ancestors = try(local.m1373["ancestors"], null)
  class_id = try(local.m1373["class_id"], null)
  create_time = try(local.m1373["create_time"], null)
  domain_group_moid = try(local.m1373["domain_group_moid"], null)
  id = try(local.m1373["id"], null)
  immediate = try(local.m1373["immediate"], null)
  mod_time = try(local.m1373["mod_time"], null)
  moid = try(local.m1373["moid"], null)
  naming_property = try(local.m1373["naming_property"], null)
  object_type = try(local.m1373["object_type"], null)
  owners = try(local.m1373["owners"], null)
  parent = try(local.m1373["parent"], null)
  permission_resources = try(local.m1373["permission_resources"], null)
  queries = try(local.m1373["queries"], null)
  registered_device = try(local.m1373["registered_device"], null)
  shared_scope = try(local.m1373["shared_scope"], null)
  tags = try(local.m1373["tags"], null)
  type = try(local.m1373["type"], null)
  values = try(local.m1373["values"], null)
  version_context = try(local.m1373["version_context"], null)
}
