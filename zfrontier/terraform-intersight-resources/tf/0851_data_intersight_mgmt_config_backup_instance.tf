# Sample data source intersight_mgmt_config_backup_instance — reads ../models/data_intersight_mgmt_config_backup_instance.yml
locals { m851 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_config_backup_instance.yml"))["data_intersight_mgmt_config_backup_instance"] }

data "intersight_mgmt_config_backup_instance" "n851" {
  account_moid = try(local.m851["account_moid"], null)
  additional_properties = try(local.m851["additional_properties"], null)
  admin_action = try(local.m851["admin_action"], null)
  backup_creation_time = try(local.m851["backup_creation_time"], null)
  backup_name = try(local.m851["backup_name"], null)
  backup_source = try(local.m851["backup_source"], null)
  checksum = try(local.m851["checksum"], null)
  class_id = try(local.m851["class_id"], null)
  create_time = try(local.m851["create_time"], null)
  description = try(local.m851["description"], null)
  domain_group_moid = try(local.m851["domain_group_moid"], null)
  download_url = try(local.m851["download_url"], null)
  id = try(local.m851["id"], null)
  is_user_password_set = try(var.secrets["data_intersight_mgmt_config_backup_instance.is_user_password_set"], local.m851["is_user_password_set"])
  mod_time = try(local.m851["mod_time"], null)
  moid = try(local.m851["moid"], null)
  object_type = try(local.m851["object_type"], null)
  owners = try(local.m851["owners"], null)
  path = try(local.m851["path"], null)
  preserve_identities = try(local.m851["preserve_identities"], null)
  results = try(local.m851["results"], null)
  retention_lock = try(local.m851["retention_lock"], null)
  shared_scope = try(local.m851["shared_scope"], null)
  size = try(local.m851["size"], null)
  source_account_moid = try(local.m851["source_account_moid"], null)
  source_name = try(local.m851["source_name"], null)
  status = try(local.m851["status"], null)
  system_admin_triggered = try(local.m851["system_admin_triggered"], null)
  user_password = try(var.secrets["data_intersight_mgmt_config_backup_instance.user_password"], local.m851["user_password"])
  user_public_key = try(var.secrets["data_intersight_mgmt_config_backup_instance.user_public_key"], local.m851["user_public_key"])
  dynamic "account" {
    for_each = try(local.m851["account"], null) == null ? [] : local.m851["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m851["ancestors"], null) == null ? [] : local.m851["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m851["parent"], null) == null ? [] : local.m851["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m851["permission_resources"], null) == null ? [] : local.m851["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m851["tags"], null) == null ? [] : local.m851["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m851["version_context"], null) == null ? [] : local.m851["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
