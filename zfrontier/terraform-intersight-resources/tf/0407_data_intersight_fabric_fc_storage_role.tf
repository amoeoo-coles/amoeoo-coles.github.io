# Sample data source intersight_fabric_fc_storage_role — reads ../models/data_intersight_fabric_fc_storage_role.yml
locals { m407 = yamldecode(file("${path.module}/../models/data_intersight_fabric_fc_storage_role.yml"))["data_intersight_fabric_fc_storage_role"] }

data "intersight_fabric_fc_storage_role" "n407" {
  account_moid = try(local.m407["account_moid"], null)
  additional_properties = try(local.m407["additional_properties"], null)
  admin_speed = try(local.m407["admin_speed"], null)
  aggregate_port_id = try(local.m407["aggregate_port_id"], null)
  class_id = try(local.m407["class_id"], null)
  create_time = try(local.m407["create_time"], null)
  domain_group_moid = try(local.m407["domain_group_moid"], null)
  id = try(local.m407["id"], null)
  mod_time = try(local.m407["mod_time"], null)
  moid = try(local.m407["moid"], null)
  object_type = try(local.m407["object_type"], null)
  owners = try(local.m407["owners"], null)
  port_id = try(local.m407["port_id"], null)
  results = try(local.m407["results"], null)
  shared_scope = try(local.m407["shared_scope"], null)
  slot_id = try(local.m407["slot_id"], null)
  user_label = try(local.m407["user_label"], null)
  vsan_id = try(local.m407["vsan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m407["ancestors"], null) == null ? [] : local.m407["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m407["parent"], null) == null ? [] : local.m407["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m407["permission_resources"], null) == null ? [] : local.m407["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m407["port_policy"], null) == null ? [] : local.m407["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m407["tags"], null) == null ? [] : local.m407["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m407["version_context"], null) == null ? [] : local.m407["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
