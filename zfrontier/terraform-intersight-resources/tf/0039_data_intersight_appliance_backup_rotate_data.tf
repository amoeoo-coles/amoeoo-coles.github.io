# Sample data source intersight_appliance_backup_rotate_data — reads ../models/data_intersight_appliance_backup_rotate_data.yml
locals { m039 = yamldecode(file("${path.module}/../models/data_intersight_appliance_backup_rotate_data.yml"))["data_intersight_appliance_backup_rotate_data"] }

data "intersight_appliance_backup_rotate_data" "n039" {
  account_moid = try(local.m039["account_moid"], null)
  additional_properties = try(local.m039["additional_properties"], null)
  backup_time = try(local.m039["backup_time"], null)
  class_id = try(local.m039["class_id"], null)
  create_time = try(local.m039["create_time"], null)
  domain_group_moid = try(local.m039["domain_group_moid"], null)
  filename = try(local.m039["filename"], null)
  id = try(local.m039["id"], null)
  mod_time = try(local.m039["mod_time"], null)
  moid = try(local.m039["moid"], null)
  object_type = try(local.m039["object_type"], null)
  owners = try(local.m039["owners"], null)
  protocol = try(local.m039["protocol"], null)
  remote_host = try(local.m039["remote_host"], null)
  remote_path = try(local.m039["remote_path"], null)
  remote_port = try(local.m039["remote_port"], null)
  results = try(local.m039["results"], null)
  shared_scope = try(local.m039["shared_scope"], null)
  username = try(local.m039["username"], null)
  dynamic "account" {
    for_each = try(local.m039["account"], null) == null ? [] : local.m039["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m039["ancestors"], null) == null ? [] : local.m039["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m039["parent"], null) == null ? [] : local.m039["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m039["permission_resources"], null) == null ? [] : local.m039["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m039["tags"], null) == null ? [] : local.m039["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m039["version_context"], null) == null ? [] : local.m039["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
