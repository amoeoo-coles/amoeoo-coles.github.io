# Sample data source intersight_appliance_app_status — reads ../models/data_intersight_appliance_app_status.yml
locals { m033 = yamldecode(file("${path.module}/../models/data_intersight_appliance_app_status.yml"))["data_intersight_appliance_app_status"] }

data "intersight_appliance_app_status" "n033" {
  account_moid = try(local.m033["account_moid"], null)
  additional_properties = try(local.m033["additional_properties"], null)
  app_label = try(local.m033["app_label"], null)
  class_id = try(local.m033["class_id"], null)
  create_time = try(local.m033["create_time"], null)
  domain_group_moid = try(local.m033["domain_group_moid"], null)
  id = try(local.m033["id"], null)
  mod_time = try(local.m033["mod_time"], null)
  moid = try(local.m033["moid"], null)
  object_type = try(local.m033["object_type"], null)
  operational_status = try(local.m033["operational_status"], null)
  owners = try(local.m033["owners"], null)
  ready_count = try(local.m033["ready_count"], null)
  replica_count = try(local.m033["replica_count"], null)
  restart_count1_hour = try(local.m033["restart_count1_hour"], null)
  restart_count24_hours = try(local.m033["restart_count24_hours"], null)
  restart_count5_mins = try(local.m033["restart_count5_mins"], null)
  restart_count_total = try(local.m033["restart_count_total"], null)
  results = try(local.m033["results"], null)
  running_count = try(local.m033["running_count"], null)
  shared_scope = try(local.m033["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m033["ancestors"], null) == null ? [] : local.m033["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "api_statuses" {
    for_each = try(local.m033["api_statuses"], null) == null ? [] : local.m033["api_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "group_status" {
    for_each = try(local.m033["group_status"], null) == null ? [] : local.m033["group_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m033["parent"], null) == null ? [] : local.m033["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m033["permission_resources"], null) == null ? [] : local.m033["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "status_checks" {
    for_each = try(local.m033["status_checks"], null) == null ? [] : local.m033["status_checks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_status" {
    for_each = try(local.m033["system_status"], null) == null ? [] : local.m033["system_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m033["tags"], null) == null ? [] : local.m033["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m033["version_context"], null) == null ? [] : local.m033["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
