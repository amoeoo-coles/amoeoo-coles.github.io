# Sample data source intersight_appliance_cluster_replace_node — reads ../models/data_intersight_appliance_cluster_replace_node.yml
locals { m043 = yamldecode(file("${path.module}/../models/data_intersight_appliance_cluster_replace_node.yml"))["data_intersight_appliance_cluster_replace_node"] }

data "intersight_appliance_cluster_replace_node" "n043" {
  account_moid = try(local.m043["account_moid"], null)
  additional_properties = try(local.m043["additional_properties"], null)
  class_id = try(local.m043["class_id"], null)
  create_time = try(local.m043["create_time"], null)
  domain_group_moid = try(local.m043["domain_group_moid"], null)
  elapsed_time = try(local.m043["elapsed_time"], null)
  end_time = try(local.m043["end_time"], null)
  error_code = try(local.m043["error_code"], null)
  hostname = try(local.m043["hostname"], null)
  id = try(local.m043["id"], null)
  messages = try(local.m043["messages"], null)
  mod_time = try(local.m043["mod_time"], null)
  moid = try(local.m043["moid"], null)
  node_id = try(local.m043["node_id"], null)
  node_ip_changed = try(local.m043["node_ip_changed"], null)
  object_type = try(local.m043["object_type"], null)
  owners = try(local.m043["owners"], null)
  remote_dns = try(local.m043["remote_dns"], null)
  results = try(local.m043["results"], null)
  shared_scope = try(local.m043["shared_scope"], null)
  start_time = try(local.m043["start_time"], null)
  status = try(local.m043["status"], null)
  total_nodes = try(local.m043["total_nodes"], null)
  total_phases = try(local.m043["total_phases"], null)
  dynamic "account" {
    for_each = try(local.m043["account"], null) == null ? [] : local.m043["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m043["ancestors"], null) == null ? [] : local.m043["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completed_phases" {
    for_each = try(local.m043["completed_phases"], null) == null ? [] : local.m043["completed_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_phase" {
    for_each = try(local.m043["current_phase"], null) == null ? [] : local.m043["current_phase"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_info" {
    for_each = try(local.m043["node_info"], null) == null ? [] : local.m043["node_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m043["parent"], null) == null ? [] : local.m043["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m043["permission_resources"], null) == null ? [] : local.m043["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m043["tags"], null) == null ? [] : local.m043["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m043["version_context"], null) == null ? [] : local.m043["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vip" {
    for_each = try(local.m043["vip"], null) == null ? [] : local.m043["vip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
