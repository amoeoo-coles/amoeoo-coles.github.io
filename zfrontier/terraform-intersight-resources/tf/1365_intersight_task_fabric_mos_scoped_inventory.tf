# Sample resource intersight_task_fabric_mos_scoped_inventory — reads ../models/intersight_task_fabric_mos_scoped_inventory.yml
locals { m1365 = yamldecode(file("${path.module}/../models/intersight_task_fabric_mos_scoped_inventory.yml"))["intersight_task_fabric_mos_scoped_inventory"] }

resource "intersight_task_fabric_mos_scoped_inventory" "n1365" {
  account_moid = try(local.m1365["account_moid"], null)
  additional_properties = try(local.m1365["additional_properties"], null)
  ancestors = try(local.m1365["ancestors"], null)
  class_id = try(local.m1365["class_id"], null)
  create_time = try(local.m1365["create_time"], null)
  domain_group_moid = try(local.m1365["domain_group_moid"], null)
  id = try(local.m1365["id"], null)
  immediate = try(local.m1365["immediate"], null)
  mod_time = try(local.m1365["mod_time"], null)
  moid = try(local.m1365["moid"], null)
  naming_property = try(local.m1365["naming_property"], null)
  object_type = try(local.m1365["object_type"], null)
  owners = try(local.m1365["owners"], null)
  parent = try(local.m1365["parent"], null)
  permission_resources = try(local.m1365["permission_resources"], null)
  queries = try(local.m1365["queries"], null)
  registered_device = try(local.m1365["registered_device"], null)
  shared_scope = try(local.m1365["shared_scope"], null)
  tags = try(local.m1365["tags"], null)
  type = try(local.m1365["type"], null)
  values = try(local.m1365["values"], null)
  version_context = try(local.m1365["version_context"], null)
}
