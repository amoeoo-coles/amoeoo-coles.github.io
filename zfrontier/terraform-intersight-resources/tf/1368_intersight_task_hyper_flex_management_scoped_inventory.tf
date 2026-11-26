# Sample resource intersight_task_hyper_flex_management_scoped_inventory — reads ../models/intersight_task_hyper_flex_management_scoped_inventory.yml
locals { m1368 = yamldecode(file("${path.module}/../models/intersight_task_hyper_flex_management_scoped_inventory.yml"))["intersight_task_hyper_flex_management_scoped_inventory"] }

resource "intersight_task_hyper_flex_management_scoped_inventory" "n1368" {
  account_moid = try(local.m1368["account_moid"], null)
  additional_properties = try(local.m1368["additional_properties"], null)
  ancestors = try(local.m1368["ancestors"], null)
  class_id = try(local.m1368["class_id"], null)
  create_time = try(local.m1368["create_time"], null)
  domain_group_moid = try(local.m1368["domain_group_moid"], null)
  id = try(local.m1368["id"], null)
  immediate = try(local.m1368["immediate"], null)
  mod_time = try(local.m1368["mod_time"], null)
  moid = try(local.m1368["moid"], null)
  naming_property = try(local.m1368["naming_property"], null)
  object_type = try(local.m1368["object_type"], null)
  owners = try(local.m1368["owners"], null)
  parent = try(local.m1368["parent"], null)
  permission_resources = try(local.m1368["permission_resources"], null)
  queries = try(local.m1368["queries"], null)
  registered_device = try(local.m1368["registered_device"], null)
  shared_scope = try(local.m1368["shared_scope"], null)
  tags = try(local.m1368["tags"], null)
  type = try(local.m1368["type"], null)
  values = try(local.m1368["values"], null)
  version_context = try(local.m1368["version_context"], null)
}
