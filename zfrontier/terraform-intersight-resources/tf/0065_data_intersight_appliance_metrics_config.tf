# Sample data source intersight_appliance_metrics_config — reads ../models/data_intersight_appliance_metrics_config.yml
locals { m065 = yamldecode(file("${path.module}/../models/data_intersight_appliance_metrics_config.yml"))["data_intersight_appliance_metrics_config"] }

data "intersight_appliance_metrics_config" "n065" {
  account_moid = try(local.m065["account_moid"], null)
  additional_properties = try(local.m065["additional_properties"], null)
  class_id = try(local.m065["class_id"], null)
  create_time = try(local.m065["create_time"], null)
  current_endpoint_count = try(local.m065["current_endpoint_count"], null)
  disk_capacity = try(local.m065["disk_capacity"], null)
  disk_usage = try(local.m065["disk_usage"], null)
  domain_group_moid = try(local.m065["domain_group_moid"], null)
  endpoint_usage_percent = try(local.m065["endpoint_usage_percent"], null)
  id = try(local.m065["id"], null)
  last_disabled_date = try(local.m065["last_disabled_date"], null)
  last_enabled_date = try(local.m065["last_enabled_date"], null)
  max_endpoint_count = try(local.m065["max_endpoint_count"], null)
  mod_time = try(local.m065["mod_time"], null)
  moid = try(local.m065["moid"], null)
  object_type = try(local.m065["object_type"], null)
  owners = try(local.m065["owners"], null)
  results = try(local.m065["results"], null)
  shared_scope = try(local.m065["shared_scope"], null)
  status_message = try(local.m065["status_message"], null)
  system_enabled = try(local.m065["system_enabled"], null)
  user_enabled = try(local.m065["user_enabled"], null)
  utilization = try(local.m065["utilization"], null)
  dynamic "account" {
    for_each = try(local.m065["account"], null) == null ? [] : local.m065["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m065["ancestors"], null) == null ? [] : local.m065["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m065["parent"], null) == null ? [] : local.m065["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m065["permission_resources"], null) == null ? [] : local.m065["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m065["tags"], null) == null ? [] : local.m065["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m065["version_context"], null) == null ? [] : local.m065["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
