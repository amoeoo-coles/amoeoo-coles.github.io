# Sample data source intersight_workflow_ansible_batch_executor — reads ../models/data_intersight_workflow_ansible_batch_executor.yml
locals { m1518 = yamldecode(file("${path.module}/../models/data_intersight_workflow_ansible_batch_executor.yml"))["data_intersight_workflow_ansible_batch_executor"] }

data "intersight_workflow_ansible_batch_executor" "n1518" {
  account_moid = try(local.m1518["account_moid"], null)
  additional_properties = try(local.m1518["additional_properties"], null)
  class_id = try(local.m1518["class_id"], null)
  create_time = try(local.m1518["create_time"], null)
  description = try(local.m1518["description"], null)
  domain_group_moid = try(local.m1518["domain_group_moid"], null)
  id = try(local.m1518["id"], null)
  mod_time = try(local.m1518["mod_time"], null)
  moid = try(local.m1518["moid"], null)
  name = try(local.m1518["name"], null)
  object_type = try(local.m1518["object_type"], null)
  outcomes = try(local.m1518["outcomes"], null)
  output = try(local.m1518["output"], null)
  owners = try(local.m1518["owners"], null)
  results = try(local.m1518["results"], null)
  retry_from_failed_api = try(local.m1518["retry_from_failed_api"], null)
  shared_scope = try(local.m1518["shared_scope"], null)
  skip_on_condition = try(local.m1518["skip_on_condition"], null)
  ui_rendering_data = try(local.m1518["ui_rendering_data"], null)
  dynamic "ancestors" {
    for_each = try(local.m1518["ancestors"], null) == null ? [] : local.m1518["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "batch" {
    for_each = try(local.m1518["batch"], null) == null ? [] : local.m1518["batch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cancel_action" {
    for_each = try(local.m1518["cancel_action"], null) == null ? [] : local.m1518["cancel_action"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "constraints" {
    for_each = try(local.m1518["constraints"], null) == null ? [] : local.m1518["constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1518["parent"], null) == null ? [] : local.m1518["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1518["permission_resources"], null) == null ? [] : local.m1518["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1518["tags"], null) == null ? [] : local.m1518["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_definition" {
    for_each = try(local.m1518["task_definition"], null) == null ? [] : local.m1518["task_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1518["version_context"], null) == null ? [] : local.m1518["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
