# Sample resource intersight_fabric_flow_control_policy — reads ../models/intersight_fabric_flow_control_policy.yml
locals { m360 = yamldecode(file("${path.module}/../models/intersight_fabric_flow_control_policy.yml"))["intersight_fabric_flow_control_policy"] }

resource "intersight_fabric_flow_control_policy" "n360" {
  account_moid = try(local.m360["account_moid"], null)
  additional_properties = try(local.m360["additional_properties"], null)
  ancestors = try(local.m360["ancestors"], null)
  class_id = try(local.m360["class_id"], null)
  create_time = try(local.m360["create_time"], null)
  description = try(local.m360["description"], null)
  domain_group_moid = try(local.m360["domain_group_moid"], null)
  id = try(local.m360["id"], null)
  mod_time = try(local.m360["mod_time"], null)
  moid = try(local.m360["moid"], null)
  name = try(local.m360["name"], null)
  object_type = try(local.m360["object_type"], null)
  organization = try(local.m360["organization"], null)
  owners = try(local.m360["owners"], null)
  parent = try(local.m360["parent"], null)
  permission_resources = try(local.m360["permission_resources"], null)
  priority_flow_control_mode = try(local.m360["priority_flow_control_mode"], null)
  receive_direction = try(local.m360["receive_direction"], null)
  send_direction = try(local.m360["send_direction"], null)
  shared_scope = try(local.m360["shared_scope"], null)
  tags = try(local.m360["tags"], null)
  version_context = try(local.m360["version_context"], null)
}
