# Sample data source intersight_appliance_cluster_install — reads ../models/data_intersight_appliance_cluster_install.yml
locals { m042 = yamldecode(file("${path.module}/../models/data_intersight_appliance_cluster_install.yml"))["data_intersight_appliance_cluster_install"] }

data "intersight_appliance_cluster_install" "n042" {
  account_moid = try(local.m042["account_moid"], null)
  additional_properties = try(local.m042["additional_properties"], null)
  class_id = try(local.m042["class_id"], null)
  create_time = try(local.m042["create_time"], null)
  domain_group_moid = try(local.m042["domain_group_moid"], null)
  elapsed_time = try(local.m042["elapsed_time"], null)
  end_time = try(local.m042["end_time"], null)
  error_code = try(local.m042["error_code"], null)
  id = try(local.m042["id"], null)
  messages = try(local.m042["messages"], null)
  mod_time = try(local.m042["mod_time"], null)
  moid = try(local.m042["moid"], null)
  object_type = try(local.m042["object_type"], null)
  owners = try(local.m042["owners"], null)
  remote_dns = try(local.m042["remote_dns"], null)
  results = try(local.m042["results"], null)
  shared_scope = try(local.m042["shared_scope"], null)
  start_time = try(local.m042["start_time"], null)
  status = try(local.m042["status"], null)
  total_nodes = try(local.m042["total_nodes"], null)
  total_phases = try(local.m042["total_phases"], null)
  dynamic "account" {
    for_each = try(local.m042["account"], null) == null ? [] : local.m042["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m042["ancestors"], null) == null ? [] : local.m042["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completed_phases" {
    for_each = try(local.m042["completed_phases"], null) == null ? [] : local.m042["completed_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_phase" {
    for_each = try(local.m042["current_phase"], null) == null ? [] : local.m042["current_phase"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_info" {
    for_each = try(local.m042["node_info"], null) == null ? [] : local.m042["node_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m042["parent"], null) == null ? [] : local.m042["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m042["permission_resources"], null) == null ? [] : local.m042["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m042["tags"], null) == null ? [] : local.m042["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m042["version_context"], null) == null ? [] : local.m042["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vip" {
    for_each = try(local.m042["vip"], null) == null ? [] : local.m042["vip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
