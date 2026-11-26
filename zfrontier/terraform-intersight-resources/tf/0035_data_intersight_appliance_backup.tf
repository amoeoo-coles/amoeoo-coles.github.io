# Sample data source intersight_appliance_backup — reads ../models/data_intersight_appliance_backup.yml
locals { m035 = yamldecode(file("${path.module}/../models/data_intersight_appliance_backup.yml"))["data_intersight_appliance_backup"] }

data "intersight_appliance_backup" "n035" {
  account_moid = try(local.m035["account_moid"], null)
  additional_properties = try(local.m035["additional_properties"], null)
  backup_download_url = try(local.m035["backup_download_url"], null)
  class_id = try(local.m035["class_id"], null)
  create_time = try(local.m035["create_time"], null)
  domain_group_moid = try(local.m035["domain_group_moid"], null)
  elapsed_time = try(local.m035["elapsed_time"], null)
  end_time = try(local.m035["end_time"], null)
  filename = try(local.m035["filename"], null)
  force_delete = try(local.m035["force_delete"], null)
  id = try(local.m035["id"], null)
  is_manual = try(local.m035["is_manual"], null)
  is_password_set = try(var.secrets["data_intersight_appliance_backup.is_password_set"], local.m035["is_password_set"])
  messages = try(local.m035["messages"], null)
  mod_time = try(local.m035["mod_time"], null)
  moid = try(local.m035["moid"], null)
  object_type = try(local.m035["object_type"], null)
  owners = try(local.m035["owners"], null)
  password = try(var.secrets["data_intersight_appliance_backup.password"], local.m035["password"])
  protocol = try(local.m035["protocol"], null)
  remote_host = try(local.m035["remote_host"], null)
  remote_path = try(local.m035["remote_path"], null)
  remote_port = try(local.m035["remote_port"], null)
  results = try(local.m035["results"], null)
  shared_scope = try(local.m035["shared_scope"], null)
  start_time = try(local.m035["start_time"], null)
  status = try(local.m035["status"], null)
  use_policy_settings = try(local.m035["use_policy_settings"], null)
  username = try(local.m035["username"], null)
  dynamic "account" {
    for_each = try(local.m035["account"], null) == null ? [] : local.m035["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m035["ancestors"], null) == null ? [] : local.m035["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m035["parent"], null) == null ? [] : local.m035["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m035["permission_resources"], null) == null ? [] : local.m035["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m035["tags"], null) == null ? [] : local.m035["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m035["version_context"], null) == null ? [] : local.m035["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
