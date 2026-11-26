# Sample data source intersight_workflow_task_debug_log — reads ../models/data_intersight_workflow_task_debug_log.yml
locals { m1536 = yamldecode(file("${path.module}/../models/data_intersight_workflow_task_debug_log.yml"))["data_intersight_workflow_task_debug_log"] }

data "intersight_workflow_task_debug_log" "n1536" {
  account_moid = try(local.m1536["account_moid"], null)
  additional_properties = try(local.m1536["additional_properties"], null)
  class_id = try(local.m1536["class_id"], null)
  create_time = try(local.m1536["create_time"], null)
  domain_group_moid = try(local.m1536["domain_group_moid"], null)
  id = try(local.m1536["id"], null)
  mod_time = try(local.m1536["mod_time"], null)
  moid = try(local.m1536["moid"], null)
  object_type = try(local.m1536["object_type"], null)
  owners = try(local.m1536["owners"], null)
  results = try(local.m1536["results"], null)
  retry_count = try(local.m1536["retry_count"], null)
  shared_scope = try(local.m1536["shared_scope"], null)
  task_debug_log_entries = try(local.m1536["task_debug_log_entries"], null)
  task_inst_id = try(local.m1536["task_inst_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1536["ancestors"], null) == null ? [] : local.m1536["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1536["parent"], null) == null ? [] : local.m1536["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1536["permission_resources"], null) == null ? [] : local.m1536["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1536["tags"], null) == null ? [] : local.m1536["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_info" {
    for_each = try(local.m1536["task_info"], null) == null ? [] : local.m1536["task_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1536["version_context"], null) == null ? [] : local.m1536["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m1536["workflow_info"], null) == null ? [] : local.m1536["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
