# Sample data source intersight_workflow_service_item_health_check_execution — reads ../models/data_intersight_workflow_service_item_health_check_execution.yml
locals { m1532 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_health_check_execution.yml"))["data_intersight_workflow_service_item_health_check_execution"] }

data "intersight_workflow_service_item_health_check_execution" "n1532" {
  account_moid = try(local.m1532["account_moid"], null)
  additional_properties = try(local.m1532["additional_properties"], null)
  class_id = try(local.m1532["class_id"], null)
  create_time = try(local.m1532["create_time"], null)
  domain_group_moid = try(local.m1532["domain_group_moid"], null)
  error_summary = try(local.m1532["error_summary"], null)
  id = try(local.m1532["id"], null)
  last_passed_timestamp = try(local.m1532["last_passed_timestamp"], null)
  mod_time = try(local.m1532["mod_time"], null)
  moid = try(local.m1532["moid"], null)
  object_type = try(local.m1532["object_type"], null)
  owners = try(local.m1532["owners"], null)
  result = try(local.m1532["result"], null)
  results = try(local.m1532["results"], null)
  shared_scope = try(local.m1532["shared_scope"], null)
  summary = try(local.m1532["summary"], null)
  workflow_status = try(local.m1532["workflow_status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1532["ancestors"], null) == null ? [] : local.m1532["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "error_elements" {
    for_each = try(local.m1532["error_elements"], null) == null ? [] : local.m1532["error_elements"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "health_check_definition" {
    for_each = try(local.m1532["health_check_definition"], null) == null ? [] : local.m1532["health_check_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1532["parent"], null) == null ? [] : local.m1532["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1532["permission_resources"], null) == null ? [] : local.m1532["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_instance" {
    for_each = try(local.m1532["service_item_instance"], null) == null ? [] : local.m1532["service_item_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1532["tags"], null) == null ? [] : local.m1532["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1532["version_context"], null) == null ? [] : local.m1532["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m1532["workflow_info"], null) == null ? [] : local.m1532["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
