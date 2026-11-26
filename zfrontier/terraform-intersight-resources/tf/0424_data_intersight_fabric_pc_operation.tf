# Sample data source intersight_fabric_pc_operation — reads ../models/data_intersight_fabric_pc_operation.yml
locals { m424 = yamldecode(file("${path.module}/../models/data_intersight_fabric_pc_operation.yml"))["data_intersight_fabric_pc_operation"] }

data "intersight_fabric_pc_operation" "n424" {
  account_moid = try(local.m424["account_moid"], null)
  additional_properties = try(local.m424["additional_properties"], null)
  admin_action = try(local.m424["admin_action"], null)
  admin_state = try(local.m424["admin_state"], null)
  class_id = try(local.m424["class_id"], null)
  config_state = try(local.m424["config_state"], null)
  create_time = try(local.m424["create_time"], null)
  domain_group_moid = try(local.m424["domain_group_moid"], null)
  id = try(local.m424["id"], null)
  mod_time = try(local.m424["mod_time"], null)
  moid = try(local.m424["moid"], null)
  object_type = try(local.m424["object_type"], null)
  owners = try(local.m424["owners"], null)
  pc_id = try(local.m424["pc_id"], null)
  results = try(local.m424["results"], null)
  shared_scope = try(local.m424["shared_scope"], null)
  user_label = try(local.m424["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m424["ancestors"], null) == null ? [] : local.m424["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m424["network_element"], null) == null ? [] : local.m424["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m424["parent"], null) == null ? [] : local.m424["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m424["permission_resources"], null) == null ? [] : local.m424["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m424["tags"], null) == null ? [] : local.m424["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m424["version_context"], null) == null ? [] : local.m424["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
