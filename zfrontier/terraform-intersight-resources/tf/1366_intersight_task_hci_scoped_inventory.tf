# Sample resource intersight_task_hci_scoped_inventory — reads ../models/intersight_task_hci_scoped_inventory.yml
locals { m1366 = yamldecode(file("${path.module}/../models/intersight_task_hci_scoped_inventory.yml"))["intersight_task_hci_scoped_inventory"] }

resource "intersight_task_hci_scoped_inventory" "n1366" {
  account_moid = try(local.m1366["account_moid"], null)
  additional_properties = try(local.m1366["additional_properties"], null)
  ancestors = try(local.m1366["ancestors"], null)
  class_id = try(local.m1366["class_id"], null)
  create_time = try(local.m1366["create_time"], null)
  domain_group_moid = try(local.m1366["domain_group_moid"], null)
  id = try(local.m1366["id"], null)
  immediate = try(local.m1366["immediate"], null)
  mod_time = try(local.m1366["mod_time"], null)
  moid = try(local.m1366["moid"], null)
  naming_property = try(local.m1366["naming_property"], null)
  object_type = try(local.m1366["object_type"], null)
  owners = try(local.m1366["owners"], null)
  parent = try(local.m1366["parent"], null)
  permission_resources = try(local.m1366["permission_resources"], null)
  queries = try(local.m1366["queries"], null)
  registered_device = try(local.m1366["registered_device"], null)
  shared_scope = try(local.m1366["shared_scope"], null)
  tags = try(local.m1366["tags"], null)
  type = try(local.m1366["type"], null)
  values = try(local.m1366["values"], null)
  version_context = try(local.m1366["version_context"], null)
}
