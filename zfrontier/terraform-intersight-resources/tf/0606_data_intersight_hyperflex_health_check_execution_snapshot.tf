# Sample data source intersight_hyperflex_health_check_execution_snapshot — reads ../models/data_intersight_hyperflex_health_check_execution_snapshot.yml
locals { m606 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_health_check_execution_snapshot.yml"))["data_intersight_hyperflex_health_check_execution_snapshot"] }

data "intersight_hyperflex_health_check_execution_snapshot" "n606" {
  account_moid = try(local.m606["account_moid"], null)
  additional_properties = try(local.m606["additional_properties"], null)
  category = try(local.m606["category"], null)
  cause = try(local.m606["cause"], null)
  class_id = try(local.m606["class_id"], null)
  completion_time = try(local.m606["completion_time"], null)
  create_time = try(local.m606["create_time"], null)
  domain_group_moid = try(local.m606["domain_group_moid"], null)
  health_check_details = try(local.m606["health_check_details"], null)
  health_check_execution_error_details = try(local.m606["health_check_execution_error_details"], null)
  health_check_execution_error_summary = try(local.m606["health_check_execution_error_summary"], null)
  health_check_execution_status = try(local.m606["health_check_execution_status"], null)
  health_check_result = try(local.m606["health_check_result"], null)
  health_check_summary = try(local.m606["health_check_summary"], null)
  health_check_vcenter_ip = try(local.m606["health_check_vcenter_ip"], null)
  hx_device_name = try(local.m606["hx_device_name"], null)
  id = try(local.m606["id"], null)
  mod_time = try(local.m606["mod_time"], null)
  moid = try(local.m606["moid"], null)
  object_type = try(local.m606["object_type"], null)
  owners = try(local.m606["owners"], null)
  results = try(local.m606["results"], null)
  shared_scope = try(local.m606["shared_scope"], null)
  suggested_resolution = try(local.m606["suggested_resolution"], null)
  dynamic "ancestors" {
    for_each = try(local.m606["ancestors"], null) == null ? [] : local.m606["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "health_check_definition" {
    for_each = try(local.m606["health_check_definition"], null) == null ? [] : local.m606["health_check_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hx_cluster" {
    for_each = try(local.m606["hx_cluster"], null) == null ? [] : local.m606["hx_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_level_info" {
    for_each = try(local.m606["node_level_info"], null) == null ? [] : local.m606["node_level_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m606["parent"], null) == null ? [] : local.m606["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m606["permission_resources"], null) == null ? [] : local.m606["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m606["registered_device"], null) == null ? [] : local.m606["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m606["tags"], null) == null ? [] : local.m606["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m606["version_context"], null) == null ? [] : local.m606["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m606["workflow"], null) == null ? [] : local.m606["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
