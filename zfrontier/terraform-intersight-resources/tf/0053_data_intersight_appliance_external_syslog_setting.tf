# Sample data source intersight_appliance_external_syslog_setting — reads ../models/data_intersight_appliance_external_syslog_setting.yml
locals { m053 = yamldecode(file("${path.module}/../models/data_intersight_appliance_external_syslog_setting.yml"))["data_intersight_appliance_external_syslog_setting"] }

data "intersight_appliance_external_syslog_setting" "n053" {
  account_moid = try(local.m053["account_moid"], null)
  additional_properties = try(local.m053["additional_properties"], null)
  class_id = try(local.m053["class_id"], null)
  create_time = try(local.m053["create_time"], null)
  domain_group_moid = try(local.m053["domain_group_moid"], null)
  enabled = try(local.m053["enabled"], null)
  export_alarms = try(local.m053["export_alarms"], null)
  export_audit = try(local.m053["export_audit"], null)
  export_nginx = try(local.m053["export_nginx"], null)
  id = try(local.m053["id"], null)
  mod_time = try(local.m053["mod_time"], null)
  moid = try(local.m053["moid"], null)
  object_type = try(local.m053["object_type"], null)
  owners = try(local.m053["owners"], null)
  port = try(local.m053["port"], null)
  protocol = try(local.m053["protocol"], null)
  results = try(local.m053["results"], null)
  server = try(local.m053["server"], null)
  severity = try(local.m053["severity"], null)
  shared_scope = try(local.m053["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m053["account"], null) == null ? [] : local.m053["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m053["ancestors"], null) == null ? [] : local.m053["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m053["parent"], null) == null ? [] : local.m053["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m053["permission_resources"], null) == null ? [] : local.m053["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m053["tags"], null) == null ? [] : local.m053["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m053["version_context"], null) == null ? [] : local.m053["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
