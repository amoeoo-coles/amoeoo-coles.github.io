# Sample data source intersight_workflow_power_shell_batch_api_executor — reads ../models/data_intersight_workflow_power_shell_batch_api_executor.yml
locals { m1525 = yamldecode(file("${path.module}/../models/data_intersight_workflow_power_shell_batch_api_executor.yml"))["data_intersight_workflow_power_shell_batch_api_executor"] }

data "intersight_workflow_power_shell_batch_api_executor" "n1525" {
  account_moid = try(local.m1525["account_moid"], null)
  additional_properties = try(local.m1525["additional_properties"], null)
  class_id = try(local.m1525["class_id"], null)
  create_time = try(local.m1525["create_time"], null)
  description = try(local.m1525["description"], null)
  domain_group_moid = try(local.m1525["domain_group_moid"], null)
  id = try(local.m1525["id"], null)
  mod_time = try(local.m1525["mod_time"], null)
  moid = try(local.m1525["moid"], null)
  name = try(local.m1525["name"], null)
  object_type = try(local.m1525["object_type"], null)
  outcomes = try(local.m1525["outcomes"], null)
  output = try(local.m1525["output"], null)
  owners = try(local.m1525["owners"], null)
  results = try(local.m1525["results"], null)
  retry_from_failed_api = try(local.m1525["retry_from_failed_api"], null)
  shared_scope = try(local.m1525["shared_scope"], null)
  skip_on_condition = try(local.m1525["skip_on_condition"], null)
  ui_rendering_data = try(local.m1525["ui_rendering_data"], null)
  dynamic "ancestors" {
    for_each = try(local.m1525["ancestors"], null) == null ? [] : local.m1525["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "batch" {
    for_each = try(local.m1525["batch"], null) == null ? [] : local.m1525["batch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cancel_action" {
    for_each = try(local.m1525["cancel_action"], null) == null ? [] : local.m1525["cancel_action"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "constraints" {
    for_each = try(local.m1525["constraints"], null) == null ? [] : local.m1525["constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "error_response_handler" {
    for_each = try(local.m1525["error_response_handler"], null) == null ? [] : local.m1525["error_response_handler"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1525["parent"], null) == null ? [] : local.m1525["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1525["permission_resources"], null) == null ? [] : local.m1525["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1525["tags"], null) == null ? [] : local.m1525["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_definition" {
    for_each = try(local.m1525["task_definition"], null) == null ? [] : local.m1525["task_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1525["version_context"], null) == null ? [] : local.m1525["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
