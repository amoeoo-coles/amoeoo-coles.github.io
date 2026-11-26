# Sample resource intersight_task_catalyst_sdwan_scoped_inventory — reads ../models/intersight_task_catalyst_sdwan_scoped_inventory.yml
locals { m1364 = yamldecode(file("${path.module}/../models/intersight_task_catalyst_sdwan_scoped_inventory.yml"))["intersight_task_catalyst_sdwan_scoped_inventory"] }

resource "intersight_task_catalyst_sdwan_scoped_inventory" "n1364" {
  account_moid = try(local.m1364["account_moid"], null)
  additional_properties = try(local.m1364["additional_properties"], null)
  ancestors = try(local.m1364["ancestors"], null)
  class_id = try(local.m1364["class_id"], null)
  create_time = try(local.m1364["create_time"], null)
  domain_group_moid = try(local.m1364["domain_group_moid"], null)
  id = try(local.m1364["id"], null)
  immediate = try(local.m1364["immediate"], null)
  mod_time = try(local.m1364["mod_time"], null)
  moid = try(local.m1364["moid"], null)
  naming_property = try(local.m1364["naming_property"], null)
  object_type = try(local.m1364["object_type"], null)
  owners = try(local.m1364["owners"], null)
  parent = try(local.m1364["parent"], null)
  permission_resources = try(local.m1364["permission_resources"], null)
  queries = try(local.m1364["queries"], null)
  registered_device = try(local.m1364["registered_device"], null)
  shared_scope = try(local.m1364["shared_scope"], null)
  tags = try(local.m1364["tags"], null)
  type = try(local.m1364["type"], null)
  values = try(local.m1364["values"], null)
  version_context = try(local.m1364["version_context"], null)
}
