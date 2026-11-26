# Sample data source intersight_appliance_backup_policy — reads ../models/data_intersight_appliance_backup_policy.yml
locals { m038 = yamldecode(file("${path.module}/../models/data_intersight_appliance_backup_policy.yml"))["data_intersight_appliance_backup_policy"] }

data "intersight_appliance_backup_policy" "n038" {
  account_moid = try(local.m038["account_moid"], null)
  additional_properties = try(local.m038["additional_properties"], null)
  backup_time = try(local.m038["backup_time"], null)
  class_id = try(local.m038["class_id"], null)
  create_time = try(local.m038["create_time"], null)
  domain_group_moid = try(local.m038["domain_group_moid"], null)
  filename = try(local.m038["filename"], null)
  id = try(local.m038["id"], null)
  is_password_set = try(var.secrets["data_intersight_appliance_backup_policy.is_password_set"], local.m038["is_password_set"])
  manual_backup = try(local.m038["manual_backup"], null)
  mod_time = try(local.m038["mod_time"], null)
  moid = try(local.m038["moid"], null)
  object_type = try(local.m038["object_type"], null)
  owners = try(local.m038["owners"], null)
  password = try(var.secrets["data_intersight_appliance_backup_policy.password"], local.m038["password"])
  protocol = try(local.m038["protocol"], null)
  remote_host = try(local.m038["remote_host"], null)
  remote_path = try(local.m038["remote_path"], null)
  remote_port = try(local.m038["remote_port"], null)
  results = try(local.m038["results"], null)
  retention_count = try(local.m038["retention_count"], null)
  retention_policy_enabled = try(local.m038["retention_policy_enabled"], null)
  shared_scope = try(local.m038["shared_scope"], null)
  username = try(local.m038["username"], null)
  dynamic "account" {
    for_each = try(local.m038["account"], null) == null ? [] : local.m038["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m038["ancestors"], null) == null ? [] : local.m038["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m038["parent"], null) == null ? [] : local.m038["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m038["permission_resources"], null) == null ? [] : local.m038["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule" {
    for_each = try(local.m038["schedule"], null) == null ? [] : local.m038["schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m038["tags"], null) == null ? [] : local.m038["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m038["version_context"], null) == null ? [] : local.m038["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
