# Sample data source intersight_recovery_schedule_config_policy — reads ../models/data_intersight_recovery_schedule_config_policy.yml
locals { m1107 = yamldecode(file("${path.module}/../models/data_intersight_recovery_schedule_config_policy.yml"))["data_intersight_recovery_schedule_config_policy"] }

data "intersight_recovery_schedule_config_policy" "n1107" {
  account_moid = try(local.m1107["account_moid"], null)
  additional_properties = try(local.m1107["additional_properties"], null)
  class_id = try(local.m1107["class_id"], null)
  create_time = try(local.m1107["create_time"], null)
  description = try(local.m1107["description"], null)
  domain_group_moid = try(local.m1107["domain_group_moid"], null)
  id = try(local.m1107["id"], null)
  mod_time = try(local.m1107["mod_time"], null)
  moid = try(local.m1107["moid"], null)
  name = try(local.m1107["name"], null)
  object_type = try(local.m1107["object_type"], null)
  owners = try(local.m1107["owners"], null)
  results = try(local.m1107["results"], null)
  shared_scope = try(local.m1107["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1107["ancestors"], null) == null ? [] : local.m1107["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_profiles" {
    for_each = try(local.m1107["backup_profiles"], null) == null ? [] : local.m1107["backup_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1107["organization"], null) == null ? [] : local.m1107["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1107["parent"], null) == null ? [] : local.m1107["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1107["permission_resources"], null) == null ? [] : local.m1107["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule" {
    for_each = try(local.m1107["schedule"], null) == null ? [] : local.m1107["schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1107["tags"], null) == null ? [] : local.m1107["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1107["version_context"], null) == null ? [] : local.m1107["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
