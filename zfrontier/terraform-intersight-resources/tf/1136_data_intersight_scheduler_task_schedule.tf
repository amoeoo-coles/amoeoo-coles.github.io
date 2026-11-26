# Sample data source intersight_scheduler_task_schedule — reads ../models/data_intersight_scheduler_task_schedule.yml
locals { m1136 = yamldecode(file("${path.module}/../models/data_intersight_scheduler_task_schedule.yml"))["data_intersight_scheduler_task_schedule"] }

data "intersight_scheduler_task_schedule" "n1136" {
  account_moid = try(local.m1136["account_moid"], null)
  action = try(local.m1136["action"], null)
  additional_properties = try(local.m1136["additional_properties"], null)
  class_id = try(local.m1136["class_id"], null)
  create_time = try(local.m1136["create_time"], null)
  description = try(local.m1136["description"], null)
  domain_group_moid = try(local.m1136["domain_group_moid"], null)
  id = try(local.m1136["id"], null)
  last_action = try(local.m1136["last_action"], null)
  mod_time = try(local.m1136["mod_time"], null)
  moid = try(local.m1136["moid"], null)
  name = try(local.m1136["name"], null)
  object_type = try(local.m1136["object_type"], null)
  owners = try(local.m1136["owners"], null)
  results = try(local.m1136["results"], null)
  shared_scope = try(local.m1136["shared_scope"], null)
  submitted_by = try(local.m1136["submitted_by"], null)
  suspend_end_time = try(local.m1136["suspend_end_time"], null)
  type = try(local.m1136["type"], null)
  use_policy = try(local.m1136["use_policy"], null)
  dynamic "ancestors" {
    for_each = try(local.m1136["ancestors"], null) == null ? [] : local.m1136["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_object" {
    for_each = try(local.m1136["associated_object"], null) == null ? [] : local.m1136["associated_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "execution_statuses" {
    for_each = try(local.m1136["execution_statuses"], null) == null ? [] : local.m1136["execution_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1136["parent"], null) == null ? [] : local.m1136["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1136["permission_resources"], null) == null ? [] : local.m1136["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1136["policy"], null) == null ? [] : local.m1136["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule_params" {
    for_each = try(local.m1136["schedule_params"], null) == null ? [] : local.m1136["schedule_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "status" {
    for_each = try(local.m1136["status"], null) == null ? [] : local.m1136["status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1136["tags"], null) == null ? [] : local.m1136["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_request" {
    for_each = try(local.m1136["task_request"], null) == null ? [] : local.m1136["task_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1136["version_context"], null) == null ? [] : local.m1136["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_definition" {
    for_each = try(local.m1136["workflow_definition"], null) == null ? [] : local.m1136["workflow_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
