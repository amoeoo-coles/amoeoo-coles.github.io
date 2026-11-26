# Sample data source intersight_recovery_backup_config_policy — reads ../models/data_intersight_recovery_backup_config_policy.yml
locals { m1101 = yamldecode(file("${path.module}/../models/data_intersight_recovery_backup_config_policy.yml"))["data_intersight_recovery_backup_config_policy"] }

data "intersight_recovery_backup_config_policy" "n1101" {
  account_moid = try(local.m1101["account_moid"], null)
  additional_properties = try(local.m1101["additional_properties"], null)
  class_id = try(local.m1101["class_id"], null)
  create_time = try(local.m1101["create_time"], null)
  description = try(local.m1101["description"], null)
  domain_group_moid = try(local.m1101["domain_group_moid"], null)
  file_name_prefix = try(local.m1101["file_name_prefix"], null)
  id = try(local.m1101["id"], null)
  is_password_set = try(var.secrets["data_intersight_recovery_backup_config_policy.is_password_set"], local.m1101["is_password_set"])
  location_type = try(local.m1101["location_type"], null)
  mod_time = try(local.m1101["mod_time"], null)
  moid = try(local.m1101["moid"], null)
  name = try(local.m1101["name"], null)
  object_type = try(local.m1101["object_type"], null)
  owners = try(local.m1101["owners"], null)
  password = try(var.secrets["data_intersight_recovery_backup_config_policy.password"], local.m1101["password"])
  path = try(local.m1101["path"], null)
  protocol = try(local.m1101["protocol"], null)
  results = try(local.m1101["results"], null)
  retention_count = try(local.m1101["retention_count"], null)
  shared_scope = try(local.m1101["shared_scope"], null)
  user_name = try(local.m1101["user_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1101["ancestors"], null) == null ? [] : local.m1101["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_profiles" {
    for_each = try(local.m1101["backup_profiles"], null) == null ? [] : local.m1101["backup_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1101["organization"], null) == null ? [] : local.m1101["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1101["parent"], null) == null ? [] : local.m1101["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1101["permission_resources"], null) == null ? [] : local.m1101["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1101["tags"], null) == null ? [] : local.m1101["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1101["version_context"], null) == null ? [] : local.m1101["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
