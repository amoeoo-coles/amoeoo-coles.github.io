# Sample data source intersight_hyperflex_health_check_execution — reads ../models/data_intersight_hyperflex_health_check_execution.yml
locals { m605 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_health_check_execution.yml"))["data_intersight_hyperflex_health_check_execution"] }

data "intersight_hyperflex_health_check_execution" "n605" {
  account_moid = try(local.m605["account_moid"], null)
  additional_properties = try(local.m605["additional_properties"], null)
  category = try(local.m605["category"], null)
  cause = try(local.m605["cause"], null)
  class_id = try(local.m605["class_id"], null)
  completion_time = try(local.m605["completion_time"], null)
  create_time = try(local.m605["create_time"], null)
  domain_group_moid = try(local.m605["domain_group_moid"], null)
  health_check_details = try(local.m605["health_check_details"], null)
  health_check_execution_error_details = try(local.m605["health_check_execution_error_details"], null)
  health_check_execution_error_summary = try(local.m605["health_check_execution_error_summary"], null)
  health_check_execution_status = try(local.m605["health_check_execution_status"], null)
  health_check_result = try(local.m605["health_check_result"], null)
  health_check_summary = try(local.m605["health_check_summary"], null)
  health_check_vcenter_ip = try(local.m605["health_check_vcenter_ip"], null)
  hx_device_name = try(local.m605["hx_device_name"], null)
  id = try(local.m605["id"], null)
  mod_time = try(local.m605["mod_time"], null)
  moid = try(local.m605["moid"], null)
  object_type = try(local.m605["object_type"], null)
  owners = try(local.m605["owners"], null)
  results = try(local.m605["results"], null)
  shared_scope = try(local.m605["shared_scope"], null)
  suggested_resolution = try(local.m605["suggested_resolution"], null)
  uuid = try(local.m605["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m605["ancestors"], null) == null ? [] : local.m605["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "health_check_definition" {
    for_each = try(local.m605["health_check_definition"], null) == null ? [] : local.m605["health_check_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hx_cluster" {
    for_each = try(local.m605["hx_cluster"], null) == null ? [] : local.m605["hx_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_level_info" {
    for_each = try(local.m605["node_level_info"], null) == null ? [] : local.m605["node_level_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m605["parent"], null) == null ? [] : local.m605["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m605["permission_resources"], null) == null ? [] : local.m605["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m605["registered_device"], null) == null ? [] : local.m605["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m605["tags"], null) == null ? [] : local.m605["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m605["version_context"], null) == null ? [] : local.m605["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
