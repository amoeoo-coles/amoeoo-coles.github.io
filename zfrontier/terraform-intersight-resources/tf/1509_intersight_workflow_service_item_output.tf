# Sample resource intersight_workflow_service_item_output — reads ../models/intersight_workflow_service_item_output.yml
locals { m1509 = yamldecode(file("${path.module}/../models/intersight_workflow_service_item_output.yml"))["intersight_workflow_service_item_output"] }

resource "intersight_workflow_service_item_output" "n1509" {
  account_moid = try(local.m1509["account_moid"], null)
  additional_properties = try(local.m1509["additional_properties"], null)
  ancestors = try(local.m1509["ancestors"], null)
  class_id = try(local.m1509["class_id"], null)
  create_time = try(local.m1509["create_time"], null)
  domain_group_moid = try(local.m1509["domain_group_moid"], null)
  id = try(local.m1509["id"], null)
  mod_time = try(local.m1509["mod_time"], null)
  moid = try(local.m1509["moid"], null)
  name = try(local.m1509["name"], null)
  object_type = try(local.m1509["object_type"], null)
  output = try(local.m1509["output"], null)
  owners = try(local.m1509["owners"], null)
  parent = try(local.m1509["parent"], null)
  permission_resources = try(local.m1509["permission_resources"], null)
  service_item_instance = try(local.m1509["service_item_instance"], null)
  shared_scope = try(local.m1509["shared_scope"], null)
  tags = try(local.m1509["tags"], null)
  version_context = try(local.m1509["version_context"], null)
}
