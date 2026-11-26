# Sample data source intersight_appliance_backup_monitor — reads ../models/data_intersight_appliance_backup_monitor.yml
locals { m037 = yamldecode(file("${path.module}/../models/data_intersight_appliance_backup_monitor.yml"))["data_intersight_appliance_backup_monitor"] }

data "intersight_appliance_backup_monitor" "n037" {
  account_moid = try(local.m037["account_moid"], null)
  additional_properties = try(local.m037["additional_properties"], null)
  class_id = try(local.m037["class_id"], null)
  create_time = try(local.m037["create_time"], null)
  domain_group_moid = try(local.m037["domain_group_moid"], null)
  filename = try(local.m037["filename"], null)
  id = try(local.m037["id"], null)
  last_backup_rotation_status = try(local.m037["last_backup_rotation_status"], null)
  last_backup_status = try(local.m037["last_backup_status"], null)
  mod_time = try(local.m037["mod_time"], null)
  moid = try(local.m037["moid"], null)
  object_type = try(local.m037["object_type"], null)
  owners = try(local.m037["owners"], null)
  results = try(local.m037["results"], null)
  shared_scope = try(local.m037["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m037["account"], null) == null ? [] : local.m037["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m037["ancestors"], null) == null ? [] : local.m037["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m037["parent"], null) == null ? [] : local.m037["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m037["permission_resources"], null) == null ? [] : local.m037["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m037["tags"], null) == null ? [] : local.m037["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m037["version_context"], null) == null ? [] : local.m037["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
