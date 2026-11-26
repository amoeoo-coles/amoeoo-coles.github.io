# Sample data source intersight_appliance_device_cluster_install — reads ../models/data_intersight_appliance_device_cluster_install.yml
locals { m049 = yamldecode(file("${path.module}/../models/data_intersight_appliance_device_cluster_install.yml"))["data_intersight_appliance_device_cluster_install"] }

data "intersight_appliance_device_cluster_install" "n049" {
  account_moid = try(local.m049["account_moid"], null)
  additional_properties = try(local.m049["additional_properties"], null)
  class_id = try(local.m049["class_id"], null)
  create_time = try(local.m049["create_time"], null)
  domain_group_moid = try(local.m049["domain_group_moid"], null)
  elapsed_time = try(local.m049["elapsed_time"], null)
  end_time = try(local.m049["end_time"], null)
  error_code = try(local.m049["error_code"], null)
  id = try(local.m049["id"], null)
  messages = try(local.m049["messages"], null)
  mod_time = try(local.m049["mod_time"], null)
  moid = try(local.m049["moid"], null)
  object_type = try(local.m049["object_type"], null)
  owners = try(local.m049["owners"], null)
  results = try(local.m049["results"], null)
  shared_scope = try(local.m049["shared_scope"], null)
  start_time = try(local.m049["start_time"], null)
  status = try(local.m049["status"], null)
  total_nodes = try(local.m049["total_nodes"], null)
  total_phases = try(local.m049["total_phases"], null)
  dynamic "ancestors" {
    for_each = try(local.m049["ancestors"], null) == null ? [] : local.m049["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completed_phases" {
    for_each = try(local.m049["completed_phases"], null) == null ? [] : local.m049["completed_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_phase" {
    for_each = try(local.m049["current_phase"], null) == null ? [] : local.m049["current_phase"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_info" {
    for_each = try(local.m049["node_info"], null) == null ? [] : local.m049["node_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m049["parent"], null) == null ? [] : local.m049["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m049["permission_resources"], null) == null ? [] : local.m049["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m049["registered_device"], null) == null ? [] : local.m049["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m049["tags"], null) == null ? [] : local.m049["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m049["version_context"], null) == null ? [] : local.m049["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
