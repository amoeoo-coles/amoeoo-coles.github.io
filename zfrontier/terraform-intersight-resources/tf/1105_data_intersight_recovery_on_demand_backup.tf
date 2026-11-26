# Sample data source intersight_recovery_on_demand_backup — reads ../models/data_intersight_recovery_on_demand_backup.yml
locals { m1105 = yamldecode(file("${path.module}/../models/data_intersight_recovery_on_demand_backup.yml"))["data_intersight_recovery_on_demand_backup"] }

data "intersight_recovery_on_demand_backup" "n1105" {
  account_moid = try(local.m1105["account_moid"], null)
  additional_properties = try(local.m1105["additional_properties"], null)
  class_id = try(local.m1105["class_id"], null)
  create_time = try(local.m1105["create_time"], null)
  description = try(local.m1105["description"], null)
  domain_group_moid = try(local.m1105["domain_group_moid"], null)
  file_name_prefix = try(local.m1105["file_name_prefix"], null)
  id = try(local.m1105["id"], null)
  is_password_set = try(var.secrets["data_intersight_recovery_on_demand_backup.is_password_set"], local.m1105["is_password_set"])
  location_type = try(local.m1105["location_type"], null)
  mod_time = try(local.m1105["mod_time"], null)
  moid = try(local.m1105["moid"], null)
  name = try(local.m1105["name"], null)
  object_type = try(local.m1105["object_type"], null)
  owners = try(local.m1105["owners"], null)
  password = try(var.secrets["data_intersight_recovery_on_demand_backup.password"], local.m1105["password"])
  path = try(local.m1105["path"], null)
  protocol = try(local.m1105["protocol"], null)
  results = try(local.m1105["results"], null)
  retention_count = try(local.m1105["retention_count"], null)
  shared_scope = try(local.m1105["shared_scope"], null)
  user_name = try(local.m1105["user_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1105["ancestors"], null) == null ? [] : local.m1105["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m1105["config_result"], null) == null ? [] : local.m1105["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_id" {
    for_each = try(local.m1105["device_id"], null) == null ? [] : local.m1105["device_id"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1105["organization"], null) == null ? [] : local.m1105["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1105["parent"], null) == null ? [] : local.m1105["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1105["permission_resources"], null) == null ? [] : local.m1105["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1105["tags"], null) == null ? [] : local.m1105["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1105["version_context"], null) == null ? [] : local.m1105["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
