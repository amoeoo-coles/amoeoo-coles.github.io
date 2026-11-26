# Sample data source intersight_appliance_node_status — reads ../models/data_intersight_appliance_node_status.yml
locals { m071 = yamldecode(file("${path.module}/../models/data_intersight_appliance_node_status.yml"))["data_intersight_appliance_node_status"] }

data "intersight_appliance_node_status" "n071" {
  account_moid = try(local.m071["account_moid"], null)
  additional_properties = try(local.m071["additional_properties"], null)
  class_id = try(local.m071["class_id"], null)
  cpu_usage = try(local.m071["cpu_usage"], null)
  create_time = try(local.m071["create_time"], null)
  domain_group_moid = try(local.m071["domain_group_moid"], null)
  id = try(local.m071["id"], null)
  mem_usage = try(local.m071["mem_usage"], null)
  mod_time = try(local.m071["mod_time"], null)
  moid = try(local.m071["moid"], null)
  node_id = try(local.m071["node_id"], null)
  node_state = try(local.m071["node_state"], null)
  object_type = try(local.m071["object_type"], null)
  operational_status = try(local.m071["operational_status"], null)
  owners = try(local.m071["owners"], null)
  results = try(local.m071["results"], null)
  shared_scope = try(local.m071["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m071["ancestors"], null) == null ? [] : local.m071["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_system_statuses" {
    for_each = try(local.m071["file_system_statuses"], null) == null ? [] : local.m071["file_system_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_info" {
    for_each = try(local.m071["node_info"], null) == null ? [] : local.m071["node_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m071["parent"], null) == null ? [] : local.m071["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m071["permission_resources"], null) == null ? [] : local.m071["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "status_checks" {
    for_each = try(local.m071["status_checks"], null) == null ? [] : local.m071["status_checks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_status" {
    for_each = try(local.m071["system_status"], null) == null ? [] : local.m071["system_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m071["tags"], null) == null ? [] : local.m071["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m071["version_context"], null) == null ? [] : local.m071["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
