# Sample data source intersight_cond_alarm_aggregation — reads ../models/data_intersight_cond_alarm_aggregation.yml
locals { m261 = yamldecode(file("${path.module}/../models/data_intersight_cond_alarm_aggregation.yml"))["data_intersight_cond_alarm_aggregation"] }

data "intersight_cond_alarm_aggregation" "n261" {
  account_moid = try(local.m261["account_moid"], null)
  additional_properties = try(local.m261["additional_properties"], null)
  class_id = try(local.m261["class_id"], null)
  create_time = try(local.m261["create_time"], null)
  critical_alarms_count = try(local.m261["critical_alarms_count"], null)
  domain_group_moid = try(local.m261["domain_group_moid"], null)
  health = try(local.m261["health"], null)
  id = try(local.m261["id"], null)
  info_alarms_count = try(local.m261["info_alarms_count"], null)
  mo_type = try(local.m261["mo_type"], null)
  mod_time = try(local.m261["mod_time"], null)
  moid = try(local.m261["moid"], null)
  object_type = try(local.m261["object_type"], null)
  owners = try(local.m261["owners"], null)
  results = try(local.m261["results"], null)
  shared_scope = try(local.m261["shared_scope"], null)
  warning_alarms_count = try(local.m261["warning_alarms_count"], null)
  dynamic "alarm_aggregation_source" {
    for_each = try(local.m261["alarm_aggregation_source"], null) == null ? [] : local.m261["alarm_aggregation_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "alarm_summary" {
    for_each = try(local.m261["alarm_summary"], null) == null ? [] : local.m261["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m261["ancestors"], null) == null ? [] : local.m261["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m261["parent"], null) == null ? [] : local.m261["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m261["permission_resources"], null) == null ? [] : local.m261["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m261["tags"], null) == null ? [] : local.m261["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m261["version_context"], null) == null ? [] : local.m261["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
