# Sample data source intersight_workflow_batch_api_executor — reads ../models/data_intersight_workflow_batch_api_executor.yml
locals { m1519 = yamldecode(file("${path.module}/../models/data_intersight_workflow_batch_api_executor.yml"))["data_intersight_workflow_batch_api_executor"] }

data "intersight_workflow_batch_api_executor" "n1519" {
  account_moid = try(local.m1519["account_moid"], null)
  additional_properties = try(local.m1519["additional_properties"], null)
  class_id = try(local.m1519["class_id"], null)
  create_time = try(local.m1519["create_time"], null)
  description = try(local.m1519["description"], null)
  domain_group_moid = try(local.m1519["domain_group_moid"], null)
  id = try(local.m1519["id"], null)
  mod_time = try(local.m1519["mod_time"], null)
  moid = try(local.m1519["moid"], null)
  name = try(local.m1519["name"], null)
  object_type = try(local.m1519["object_type"], null)
  outcomes = try(local.m1519["outcomes"], null)
  output = try(local.m1519["output"], null)
  owners = try(local.m1519["owners"], null)
  results = try(local.m1519["results"], null)
  retry_from_failed_api = try(local.m1519["retry_from_failed_api"], null)
  shared_scope = try(local.m1519["shared_scope"], null)
  skip_on_condition = try(local.m1519["skip_on_condition"], null)
  ui_rendering_data = try(local.m1519["ui_rendering_data"], null)
  dynamic "ancestors" {
    for_each = try(local.m1519["ancestors"], null) == null ? [] : local.m1519["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "batch" {
    for_each = try(local.m1519["batch"], null) == null ? [] : local.m1519["batch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cancel_action" {
    for_each = try(local.m1519["cancel_action"], null) == null ? [] : local.m1519["cancel_action"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "constraints" {
    for_each = try(local.m1519["constraints"], null) == null ? [] : local.m1519["constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "error_response_handler" {
    for_each = try(local.m1519["error_response_handler"], null) == null ? [] : local.m1519["error_response_handler"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1519["parent"], null) == null ? [] : local.m1519["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1519["permission_resources"], null) == null ? [] : local.m1519["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1519["tags"], null) == null ? [] : local.m1519["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_definition" {
    for_each = try(local.m1519["task_definition"], null) == null ? [] : local.m1519["task_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1519["version_context"], null) == null ? [] : local.m1519["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
