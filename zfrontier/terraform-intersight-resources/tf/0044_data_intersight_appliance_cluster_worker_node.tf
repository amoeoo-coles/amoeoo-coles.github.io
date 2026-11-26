# Sample data source intersight_appliance_cluster_worker_node — reads ../models/data_intersight_appliance_cluster_worker_node.yml
locals { m044 = yamldecode(file("${path.module}/../models/data_intersight_appliance_cluster_worker_node.yml"))["data_intersight_appliance_cluster_worker_node"] }

data "intersight_appliance_cluster_worker_node" "n044" {
  account_moid = try(local.m044["account_moid"], null)
  additional_properties = try(local.m044["additional_properties"], null)
  class_id = try(local.m044["class_id"], null)
  create_time = try(local.m044["create_time"], null)
  domain_group_moid = try(local.m044["domain_group_moid"], null)
  elapsed_time = try(local.m044["elapsed_time"], null)
  end_time = try(local.m044["end_time"], null)
  error_code = try(local.m044["error_code"], null)
  hostname = try(local.m044["hostname"], null)
  id = try(local.m044["id"], null)
  messages = try(local.m044["messages"], null)
  mod_time = try(local.m044["mod_time"], null)
  moid = try(local.m044["moid"], null)
  object_type = try(local.m044["object_type"], null)
  owners = try(local.m044["owners"], null)
  remote_dns = try(local.m044["remote_dns"], null)
  results = try(local.m044["results"], null)
  reuse_node = try(local.m044["reuse_node"], null)
  session_id = try(local.m044["session_id"], null)
  shared_scope = try(local.m044["shared_scope"], null)
  start_time = try(local.m044["start_time"], null)
  status = try(local.m044["status"], null)
  total_nodes = try(local.m044["total_nodes"], null)
  total_phases = try(local.m044["total_phases"], null)
  dynamic "account" {
    for_each = try(local.m044["account"], null) == null ? [] : local.m044["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m044["ancestors"], null) == null ? [] : local.m044["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completed_phases" {
    for_each = try(local.m044["completed_phases"], null) == null ? [] : local.m044["completed_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_phase" {
    for_each = try(local.m044["current_phase"], null) == null ? [] : local.m044["current_phase"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_info" {
    for_each = try(local.m044["node_info"], null) == null ? [] : local.m044["node_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m044["parent"], null) == null ? [] : local.m044["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m044["permission_resources"], null) == null ? [] : local.m044["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m044["tags"], null) == null ? [] : local.m044["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m044["version_context"], null) == null ? [] : local.m044["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vip" {
    for_each = try(local.m044["vip"], null) == null ? [] : local.m044["vip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
