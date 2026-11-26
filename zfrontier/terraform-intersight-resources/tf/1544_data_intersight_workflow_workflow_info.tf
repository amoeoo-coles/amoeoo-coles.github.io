# Sample data source intersight_workflow_workflow_info — reads ../models/data_intersight_workflow_workflow_info.yml
locals { m1544 = yamldecode(file("${path.module}/../models/data_intersight_workflow_workflow_info.yml"))["data_intersight_workflow_workflow_info"] }

data "intersight_workflow_workflow_info" "n1544" {
  account_moid = try(local.m1544["account_moid"], null)
  action = try(local.m1544["action"], null)
  additional_properties = try(local.m1544["additional_properties"], null)
  class_id = try(local.m1544["class_id"], null)
  cleanup_time = try(local.m1544["cleanup_time"], null)
  create_time = try(local.m1544["create_time"], null)
  domain_group_moid = try(local.m1544["domain_group_moid"], null)
  email = try(local.m1544["email"], null)
  end_time = try(local.m1544["end_time"], null)
  failed_workflow_cleanup_duration = try(local.m1544["failed_workflow_cleanup_duration"], null)
  id = try(local.m1544["id"], null)
  input = try(local.m1544["input"], null)
  inst_id = try(local.m1544["inst_id"], null)
  internal = try(local.m1544["internal"], null)
  last_action = try(local.m1544["last_action"], null)
  mod_time = try(local.m1544["mod_time"], null)
  moid = try(local.m1544["moid"], null)
  name = try(local.m1544["name"], null)
  object_type = try(local.m1544["object_type"], null)
  output = try(local.m1544["output"], null)
  owners = try(local.m1544["owners"], null)
  pause_reason = try(local.m1544["pause_reason"], null)
  progress = try(local.m1544["progress"], null)
  results = try(local.m1544["results"], null)
  retry_from_task_name = try(local.m1544["retry_from_task_name"], null)
  shared_scope = try(local.m1544["shared_scope"], null)
  src = try(local.m1544["src"], null)
  start_time = try(local.m1544["start_time"], null)
  status = try(local.m1544["status"], null)
  success_workflow_cleanup_duration = try(local.m1544["success_workflow_cleanup_duration"], null)
  trace_id = try(local.m1544["trace_id"], null)
  type = try(local.m1544["type"], null)
  user_action_required = try(local.m1544["user_action_required"], null)
  user_id = try(local.m1544["user_id"], null)
  variable = try(local.m1544["variable"], null)
  wait_reason = try(local.m1544["wait_reason"], null)
  workflow_status = try(local.m1544["workflow_status"], null)
  dynamic "account" {
    for_each = try(local.m1544["account"], null) == null ? [] : local.m1544["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1544["ancestors"], null) == null ? [] : local.m1544["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_object" {
    for_each = try(local.m1544["associated_object"], null) == null ? [] : local.m1544["associated_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "message" {
    for_each = try(local.m1544["message"], null) == null ? [] : local.m1544["message"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1544["organization"], null) == null ? [] : local.m1544["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1544["parent"], null) == null ? [] : local.m1544["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_task_info" {
    for_each = try(local.m1544["parent_task_info"], null) == null ? [] : local.m1544["parent_task_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_workflow_infos" {
    for_each = try(local.m1544["parent_workflow_infos"], null) == null ? [] : local.m1544["parent_workflow_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission" {
    for_each = try(local.m1544["permission"], null) == null ? [] : local.m1544["permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1544["permission_resources"], null) == null ? [] : local.m1544["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "properties" {
    for_each = try(local.m1544["properties"], null) == null ? [] : local.m1544["properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1544["tags"], null) == null ? [] : local.m1544["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_info_update" {
    for_each = try(local.m1544["task_info_update"], null) == null ? [] : local.m1544["task_info_update"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_infos" {
    for_each = try(local.m1544["task_infos"], null) == null ? [] : local.m1544["task_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1544["version_context"], null) == null ? [] : local.m1544["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_ctx" {
    for_each = try(local.m1544["workflow_ctx"], null) == null ? [] : local.m1544["workflow_ctx"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_definition" {
    for_each = try(local.m1544["workflow_definition"], null) == null ? [] : local.m1544["workflow_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
