# Sample data source intersight_workflow_task_info — reads ../models/data_intersight_workflow_task_info.yml
locals { m1538 = yamldecode(file("${path.module}/../models/data_intersight_workflow_task_info.yml"))["data_intersight_workflow_task_info"] }

data "intersight_workflow_task_info" "n1538" {
  account_moid = try(local.m1538["account_moid"], null)
  additional_properties = try(local.m1538["additional_properties"], null)
  class_id = try(local.m1538["class_id"], null)
  create_time = try(local.m1538["create_time"], null)
  description = try(local.m1538["description"], null)
  domain_group_moid = try(local.m1538["domain_group_moid"], null)
  end_time = try(local.m1538["end_time"], null)
  failure_reason = try(local.m1538["failure_reason"], null)
  id = try(local.m1538["id"], null)
  input = try(local.m1538["input"], null)
  inst_id = try(local.m1538["inst_id"], null)
  internal = try(local.m1538["internal"], null)
  label = try(local.m1538["label"], null)
  mod_time = try(local.m1538["mod_time"], null)
  moid = try(local.m1538["moid"], null)
  name = try(local.m1538["name"], null)
  object_type = try(local.m1538["object_type"], null)
  output = try(local.m1538["output"], null)
  owners = try(local.m1538["owners"], null)
  ref_name = try(local.m1538["ref_name"], null)
  results = try(local.m1538["results"], null)
  retry_count = try(local.m1538["retry_count"], null)
  rollback_disabled = try(local.m1538["rollback_disabled"], null)
  running_inst_id = try(local.m1538["running_inst_id"], null)
  shared_scope = try(local.m1538["shared_scope"], null)
  start_time = try(local.m1538["start_time"], null)
  status = try(local.m1538["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1538["ancestors"], null) == null ? [] : local.m1538["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "message" {
    for_each = try(local.m1538["message"], null) == null ? [] : local.m1538["message"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1538["parent"], null) == null ? [] : local.m1538["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_workflow_infos" {
    for_each = try(local.m1538["parent_workflow_infos"], null) == null ? [] : local.m1538["parent_workflow_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1538["permission_resources"], null) == null ? [] : local.m1538["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sub_workflow_info" {
    for_each = try(local.m1538["sub_workflow_info"], null) == null ? [] : local.m1538["sub_workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sub_workflow_retry_history" {
    for_each = try(local.m1538["sub_workflow_retry_history"], null) == null ? [] : local.m1538["sub_workflow_retry_history"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1538["tags"], null) == null ? [] : local.m1538["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_definition" {
    for_each = try(local.m1538["task_definition"], null) == null ? [] : local.m1538["task_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_inst_id_list" {
    for_each = try(local.m1538["task_inst_id_list"], null) == null ? [] : local.m1538["task_inst_id_list"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_loop_info" {
    for_each = try(local.m1538["task_loop_info"], null) == null ? [] : local.m1538["task_loop_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1538["version_context"], null) == null ? [] : local.m1538["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m1538["workflow_info"], null) == null ? [] : local.m1538["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
