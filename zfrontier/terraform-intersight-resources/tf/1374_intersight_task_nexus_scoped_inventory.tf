# Sample resource intersight_task_nexus_scoped_inventory — reads ../models/intersight_task_nexus_scoped_inventory.yml
locals { m1374 = yamldecode(file("${path.module}/../models/intersight_task_nexus_scoped_inventory.yml"))["intersight_task_nexus_scoped_inventory"] }

resource "intersight_task_nexus_scoped_inventory" "n1374" {
  account_moid = try(local.m1374["account_moid"], null)
  additional_properties = try(local.m1374["additional_properties"], null)
  ancestors = try(local.m1374["ancestors"], null)
  class_id = try(local.m1374["class_id"], null)
  create_time = try(local.m1374["create_time"], null)
  domain_group_moid = try(local.m1374["domain_group_moid"], null)
  id = try(local.m1374["id"], null)
  immediate = try(local.m1374["immediate"], null)
  mod_time = try(local.m1374["mod_time"], null)
  moid = try(local.m1374["moid"], null)
  naming_property = try(local.m1374["naming_property"], null)
  object_type = try(local.m1374["object_type"], null)
  owners = try(local.m1374["owners"], null)
  parent = try(local.m1374["parent"], null)
  permission_resources = try(local.m1374["permission_resources"], null)
  queries = try(local.m1374["queries"], null)
  registered_device = try(local.m1374["registered_device"], null)
  shared_scope = try(local.m1374["shared_scope"], null)
  tags = try(local.m1374["tags"], null)
  type = try(local.m1374["type"], null)
  values = try(local.m1374["values"], null)
  version_context = try(local.m1374["version_context"], null)
}
