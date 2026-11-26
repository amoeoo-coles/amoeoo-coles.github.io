# Sample data source intersight_mgmt_config_backup_operation — reads ../models/data_intersight_mgmt_config_backup_operation.yml
locals { m852 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_config_backup_operation.yml"))["data_intersight_mgmt_config_backup_operation"] }

data "intersight_mgmt_config_backup_operation" "n852" {
  account_moid = try(local.m852["account_moid"], null)
  additional_properties = try(local.m852["additional_properties"], null)
  backup_account = try(local.m852["backup_account"], null)
  backup_account_domain_group_moid = try(local.m852["backup_account_domain_group_moid"], null)
  class_id = try(local.m852["class_id"], null)
  create_time = try(local.m852["create_time"], null)
  description = try(local.m852["description"], null)
  destination = try(local.m852["destination"], null)
  domain_group_moid = try(local.m852["domain_group_moid"], null)
  end_time = try(local.m852["end_time"], null)
  id = try(local.m852["id"], null)
  is_aes_key_set = try(local.m852["is_aes_key_set"], null)
  is_user_password_set = try(var.secrets["data_intersight_mgmt_config_backup_operation.is_user_password_set"], local.m852["is_user_password_set"])
  mod_time = try(local.m852["mod_time"], null)
  moid = try(local.m852["moid"], null)
  name = try(local.m852["name"], null)
  object_type = try(local.m852["object_type"], null)
  owners = try(local.m852["owners"], null)
  results = try(local.m852["results"], null)
  retention_lock = try(local.m852["retention_lock"], null)
  rollover_initiated = try(local.m852["rollover_initiated"], null)
  shared_scope = try(local.m852["shared_scope"], null)
  start_time = try(local.m852["start_time"], null)
  status = try(local.m852["status"], null)
  system_admin_triggered = try(local.m852["system_admin_triggered"], null)
  user_password = try(var.secrets["data_intersight_mgmt_config_backup_operation.user_password"], local.m852["user_password"])
  dynamic "account" {
    for_each = try(local.m852["account"], null) == null ? [] : local.m852["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m852["ancestors"], null) == null ? [] : local.m852["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_instance" {
    for_each = try(local.m852["backup_instance"], null) == null ? [] : local.m852["backup_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "category_export_data" {
    for_each = try(local.m852["category_export_data"], null) == null ? [] : local.m852["category_export_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "options" {
    for_each = try(local.m852["options"], null) == null ? [] : local.m852["options"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "org_backups" {
    for_each = try(local.m852["org_backups"], null) == null ? [] : local.m852["org_backups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m852["parent"], null) == null ? [] : local.m852["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m852["permission_resources"], null) == null ? [] : local.m852["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m852["tags"], null) == null ? [] : local.m852["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_backup_file" {
    for_each = try(local.m852["user_backup_file"], null) == null ? [] : local.m852["user_backup_file"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m852["version_context"], null) == null ? [] : local.m852["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m852["workflow_info"], null) == null ? [] : local.m852["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
