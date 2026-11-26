# Sample data source intersight_fabric_fc_uplink_pc_role — reads ../models/data_intersight_fabric_fc_uplink_pc_role.yml
locals { m408 = yamldecode(file("${path.module}/../models/data_intersight_fabric_fc_uplink_pc_role.yml"))["data_intersight_fabric_fc_uplink_pc_role"] }

data "intersight_fabric_fc_uplink_pc_role" "n408" {
  account_moid = try(local.m408["account_moid"], null)
  additional_properties = try(local.m408["additional_properties"], null)
  admin_speed = try(local.m408["admin_speed"], null)
  class_id = try(local.m408["class_id"], null)
  create_time = try(local.m408["create_time"], null)
  domain_group_moid = try(local.m408["domain_group_moid"], null)
  fill_pattern = try(local.m408["fill_pattern"], null)
  id = try(local.m408["id"], null)
  mod_time = try(local.m408["mod_time"], null)
  moid = try(local.m408["moid"], null)
  object_type = try(local.m408["object_type"], null)
  owners = try(local.m408["owners"], null)
  pc_id = try(local.m408["pc_id"], null)
  results = try(local.m408["results"], null)
  shared_scope = try(local.m408["shared_scope"], null)
  user_label = try(local.m408["user_label"], null)
  vsan_id = try(local.m408["vsan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m408["ancestors"], null) == null ? [] : local.m408["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m408["parent"], null) == null ? [] : local.m408["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m408["permission_resources"], null) == null ? [] : local.m408["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m408["port_policy"], null) == null ? [] : local.m408["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports" {
    for_each = try(local.m408["ports"], null) == null ? [] : local.m408["ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m408["tags"], null) == null ? [] : local.m408["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m408["version_context"], null) == null ? [] : local.m408["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
