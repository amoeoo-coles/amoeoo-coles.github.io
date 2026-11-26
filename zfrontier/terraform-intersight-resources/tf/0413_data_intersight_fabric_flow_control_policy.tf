# Sample data source intersight_fabric_flow_control_policy — reads ../models/data_intersight_fabric_flow_control_policy.yml
locals { m413 = yamldecode(file("${path.module}/../models/data_intersight_fabric_flow_control_policy.yml"))["data_intersight_fabric_flow_control_policy"] }

data "intersight_fabric_flow_control_policy" "n413" {
  account_moid = try(local.m413["account_moid"], null)
  additional_properties = try(local.m413["additional_properties"], null)
  class_id = try(local.m413["class_id"], null)
  create_time = try(local.m413["create_time"], null)
  description = try(local.m413["description"], null)
  domain_group_moid = try(local.m413["domain_group_moid"], null)
  id = try(local.m413["id"], null)
  mod_time = try(local.m413["mod_time"], null)
  moid = try(local.m413["moid"], null)
  name = try(local.m413["name"], null)
  object_type = try(local.m413["object_type"], null)
  owners = try(local.m413["owners"], null)
  priority_flow_control_mode = try(local.m413["priority_flow_control_mode"], null)
  receive_direction = try(local.m413["receive_direction"], null)
  results = try(local.m413["results"], null)
  send_direction = try(local.m413["send_direction"], null)
  shared_scope = try(local.m413["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m413["ancestors"], null) == null ? [] : local.m413["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m413["organization"], null) == null ? [] : local.m413["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m413["parent"], null) == null ? [] : local.m413["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m413["permission_resources"], null) == null ? [] : local.m413["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m413["tags"], null) == null ? [] : local.m413["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m413["version_context"], null) == null ? [] : local.m413["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
