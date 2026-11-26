# Sample resource intersight_task_meraki_scoped_inventory — reads ../models/intersight_task_meraki_scoped_inventory.yml
locals { m1372 = yamldecode(file("${path.module}/../models/intersight_task_meraki_scoped_inventory.yml"))["intersight_task_meraki_scoped_inventory"] }

resource "intersight_task_meraki_scoped_inventory" "n1372" {
  account_moid = try(local.m1372["account_moid"], null)
  additional_properties = try(local.m1372["additional_properties"], null)
  ancestors = try(local.m1372["ancestors"], null)
  class_id = try(local.m1372["class_id"], null)
  create_time = try(local.m1372["create_time"], null)
  domain_group_moid = try(local.m1372["domain_group_moid"], null)
  id = try(local.m1372["id"], null)
  immediate = try(local.m1372["immediate"], null)
  mod_time = try(local.m1372["mod_time"], null)
  moid = try(local.m1372["moid"], null)
  naming_property = try(local.m1372["naming_property"], null)
  object_type = try(local.m1372["object_type"], null)
  owners = try(local.m1372["owners"], null)
  parent = try(local.m1372["parent"], null)
  permission_resources = try(local.m1372["permission_resources"], null)
  queries = try(local.m1372["queries"], null)
  registered_device = try(local.m1372["registered_device"], null)
  shared_scope = try(local.m1372["shared_scope"], null)
  tags = try(local.m1372["tags"], null)
  type = try(local.m1372["type"], null)
  values = try(local.m1372["values"], null)
  version_context = try(local.m1372["version_context"], null)
}
