# Sample data source intersight_recovery_backup_profile — reads ../models/data_intersight_recovery_backup_profile.yml
locals { m1102 = yamldecode(file("${path.module}/../models/data_intersight_recovery_backup_profile.yml"))["data_intersight_recovery_backup_profile"] }

data "intersight_recovery_backup_profile" "n1102" {
  account_moid = try(local.m1102["account_moid"], null)
  action = try(local.m1102["action"], null)
  additional_properties = try(local.m1102["additional_properties"], null)
  class_id = try(local.m1102["class_id"], null)
  create_time = try(local.m1102["create_time"], null)
  deployed_policies = try(local.m1102["deployed_policies"], null)
  description = try(local.m1102["description"], null)
  domain_group_moid = try(local.m1102["domain_group_moid"], null)
  enabled = try(local.m1102["enabled"], null)
  id = try(local.m1102["id"], null)
  mod_time = try(local.m1102["mod_time"], null)
  moid = try(local.m1102["moid"], null)
  name = try(local.m1102["name"], null)
  object_type = try(local.m1102["object_type"], null)
  owners = try(local.m1102["owners"], null)
  removed_policies = try(local.m1102["removed_policies"], null)
  results = try(local.m1102["results"], null)
  shared_scope = try(local.m1102["shared_scope"], null)
  type = try(local.m1102["type"], null)
  dynamic "action_params" {
    for_each = try(local.m1102["action_params"], null) == null ? [] : local.m1102["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1102["ancestors"], null) == null ? [] : local.m1102["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_config" {
    for_each = try(local.m1102["backup_config"], null) == null ? [] : local.m1102["backup_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m1102["config_context"], null) == null ? [] : local.m1102["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m1102["config_result"], null) == null ? [] : local.m1102["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_id" {
    for_each = try(local.m1102["device_id"], null) == null ? [] : local.m1102["device_id"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m1102["incomplete_policies"], null) == null ? [] : local.m1102["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1102["organization"], null) == null ? [] : local.m1102["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1102["parent"], null) == null ? [] : local.m1102["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m1102["partially_deployed_policies"], null) == null ? [] : local.m1102["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1102["permission_resources"], null) == null ? [] : local.m1102["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m1102["policy_bucket"], null) == null ? [] : local.m1102["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m1102["policy_change_details"], null) == null ? [] : local.m1102["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m1102["reported_policy_changes"], null) == null ? [] : local.m1102["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule_config" {
    for_each = try(local.m1102["schedule_config"], null) == null ? [] : local.m1102["schedule_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m1102["scheduled_actions"], null) == null ? [] : local.m1102["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m1102["src_template"], null) == null ? [] : local.m1102["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1102["tags"], null) == null ? [] : local.m1102["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1102["version_context"], null) == null ? [] : local.m1102["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
