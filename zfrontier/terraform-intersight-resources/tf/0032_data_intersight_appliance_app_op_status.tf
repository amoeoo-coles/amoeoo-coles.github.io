# Sample data source intersight_appliance_app_op_status — reads ../models/data_intersight_appliance_app_op_status.yml
locals { m032 = yamldecode(file("${path.module}/../models/data_intersight_appliance_app_op_status.yml"))["data_intersight_appliance_app_op_status"] }

data "intersight_appliance_app_op_status" "n032" {
  account_moid = try(local.m032["account_moid"], null)
  additional_properties = try(local.m032["additional_properties"], null)
  app_label = try(local.m032["app_label"], null)
  class_id = try(local.m032["class_id"], null)
  create_time = try(local.m032["create_time"], null)
  domain_group_moid = try(local.m032["domain_group_moid"], null)
  id = try(local.m032["id"], null)
  mod_time = try(local.m032["mod_time"], null)
  moid = try(local.m032["moid"], null)
  object_type = try(local.m032["object_type"], null)
  operational_status = try(local.m032["operational_status"], null)
  owners = try(local.m032["owners"], null)
  ready_count = try(local.m032["ready_count"], null)
  replica_count = try(local.m032["replica_count"], null)
  restart_count1_hour = try(local.m032["restart_count1_hour"], null)
  restart_count24_hours = try(local.m032["restart_count24_hours"], null)
  restart_count5_mins = try(local.m032["restart_count5_mins"], null)
  restart_count_total = try(local.m032["restart_count_total"], null)
  results = try(local.m032["results"], null)
  running_count = try(local.m032["running_count"], null)
  shared_scope = try(local.m032["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m032["ancestors"], null) == null ? [] : local.m032["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "api_statuses" {
    for_each = try(local.m032["api_statuses"], null) == null ? [] : local.m032["api_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "group_op_status" {
    for_each = try(local.m032["group_op_status"], null) == null ? [] : local.m032["group_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m032["parent"], null) == null ? [] : local.m032["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m032["permission_resources"], null) == null ? [] : local.m032["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_op_status" {
    for_each = try(local.m032["system_op_status"], null) == null ? [] : local.m032["system_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m032["tags"], null) == null ? [] : local.m032["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m032["version_context"], null) == null ? [] : local.m032["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
