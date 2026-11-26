# Sample data source intersight_workflow_rollback_workflow — reads ../models/data_intersight_workflow_rollback_workflow.yml
locals { m1526 = yamldecode(file("${path.module}/../models/data_intersight_workflow_rollback_workflow.yml"))["data_intersight_workflow_rollback_workflow"] }

data "intersight_workflow_rollback_workflow" "n1526" {
  account_moid = try(local.m1526["account_moid"], null)
  action = try(local.m1526["action"], null)
  additional_properties = try(local.m1526["additional_properties"], null)
  class_id = try(local.m1526["class_id"], null)
  continue_on_task_failure = try(local.m1526["continue_on_task_failure"], null)
  create_time = try(local.m1526["create_time"], null)
  domain_group_moid = try(local.m1526["domain_group_moid"], null)
  id = try(local.m1526["id"], null)
  mod_time = try(local.m1526["mod_time"], null)
  moid = try(local.m1526["moid"], null)
  object_type = try(local.m1526["object_type"], null)
  owners = try(local.m1526["owners"], null)
  results = try(local.m1526["results"], null)
  shared_scope = try(local.m1526["shared_scope"], null)
  status = try(local.m1526["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1526["ancestors"], null) == null ? [] : local.m1526["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1526["parent"], null) == null ? [] : local.m1526["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1526["permission_resources"], null) == null ? [] : local.m1526["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "primary_workflow" {
    for_each = try(local.m1526["primary_workflow"], null) == null ? [] : local.m1526["primary_workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rollback_tasks" {
    for_each = try(local.m1526["rollback_tasks"], null) == null ? [] : local.m1526["rollback_tasks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rollback_workflows" {
    for_each = try(local.m1526["rollback_workflows"], null) == null ? [] : local.m1526["rollback_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selected_tasks" {
    for_each = try(local.m1526["selected_tasks"], null) == null ? [] : local.m1526["selected_tasks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1526["tags"], null) == null ? [] : local.m1526["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1526["version_context"], null) == null ? [] : local.m1526["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
