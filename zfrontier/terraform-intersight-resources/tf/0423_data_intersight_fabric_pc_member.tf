# Sample data source intersight_fabric_pc_member — reads ../models/data_intersight_fabric_pc_member.yml
locals { m423 = yamldecode(file("${path.module}/../models/data_intersight_fabric_pc_member.yml"))["data_intersight_fabric_pc_member"] }

data "intersight_fabric_pc_member" "n423" {
  account_moid = try(local.m423["account_moid"], null)
  additional_properties = try(local.m423["additional_properties"], null)
  aggregate_port_id = try(local.m423["aggregate_port_id"], null)
  class_id = try(local.m423["class_id"], null)
  create_time = try(local.m423["create_time"], null)
  domain_group_moid = try(local.m423["domain_group_moid"], null)
  id = try(local.m423["id"], null)
  mod_time = try(local.m423["mod_time"], null)
  moid = try(local.m423["moid"], null)
  object_type = try(local.m423["object_type"], null)
  owners = try(local.m423["owners"], null)
  pc_id = try(local.m423["pc_id"], null)
  port_id = try(local.m423["port_id"], null)
  results = try(local.m423["results"], null)
  shared_scope = try(local.m423["shared_scope"], null)
  slot_id = try(local.m423["slot_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m423["ancestors"], null) == null ? [] : local.m423["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m423["parent"], null) == null ? [] : local.m423["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m423["permission_resources"], null) == null ? [] : local.m423["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m423["port_policy"], null) == null ? [] : local.m423["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m423["tags"], null) == null ? [] : local.m423["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m423["version_context"], null) == null ? [] : local.m423["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
