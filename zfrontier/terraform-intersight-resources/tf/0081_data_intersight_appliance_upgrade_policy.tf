# Sample data source intersight_appliance_upgrade_policy — reads ../models/data_intersight_appliance_upgrade_policy.yml
locals { m081 = yamldecode(file("${path.module}/../models/data_intersight_appliance_upgrade_policy.yml"))["data_intersight_appliance_upgrade_policy"] }

data "intersight_appliance_upgrade_policy" "n081" {
  account_moid = try(local.m081["account_moid"], null)
  additional_properties = try(local.m081["additional_properties"], null)
  auto_upgrade = try(local.m081["auto_upgrade"], null)
  blackout_dates_enabled = try(local.m081["blackout_dates_enabled"], null)
  blackout_end_date = try(local.m081["blackout_end_date"], null)
  blackout_start_date = try(local.m081["blackout_start_date"], null)
  class_id = try(local.m081["class_id"], null)
  create_time = try(local.m081["create_time"], null)
  disruptive_grace_period_week = try(local.m081["disruptive_grace_period_week"], null)
  domain_group_moid = try(local.m081["domain_group_moid"], null)
  enable_meta_data_sync = try(local.m081["enable_meta_data_sync"], null)
  id = try(local.m081["id"], null)
  is_custom_grace_period_enabled = try(local.m081["is_custom_grace_period_enabled"], null)
  is_synced = try(local.m081["is_synced"], null)
  manual_installation_start_time = try(local.m081["manual_installation_start_time"], null)
  mod_time = try(local.m081["mod_time"], null)
  moid = try(local.m081["moid"], null)
  nondisruptive_grace_period_week = try(local.m081["nondisruptive_grace_period_week"], null)
  object_type = try(local.m081["object_type"], null)
  owners = try(local.m081["owners"], null)
  results = try(local.m081["results"], null)
  shared_scope = try(local.m081["shared_scope"], null)
  software_download_type = try(local.m081["software_download_type"], null)
  dynamic "account" {
    for_each = try(local.m081["account"], null) == null ? [] : local.m081["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m081["ancestors"], null) == null ? [] : local.m081["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m081["parent"], null) == null ? [] : local.m081["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m081["permission_resources"], null) == null ? [] : local.m081["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule" {
    for_each = try(local.m081["schedule"], null) == null ? [] : local.m081["schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m081["tags"], null) == null ? [] : local.m081["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m081["version_context"], null) == null ? [] : local.m081["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
