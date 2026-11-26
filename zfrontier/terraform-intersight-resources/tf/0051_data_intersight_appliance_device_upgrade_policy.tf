# Sample data source intersight_appliance_device_upgrade_policy — reads ../models/data_intersight_appliance_device_upgrade_policy.yml
locals { m051 = yamldecode(file("${path.module}/../models/data_intersight_appliance_device_upgrade_policy.yml"))["data_intersight_appliance_device_upgrade_policy"] }

data "intersight_appliance_device_upgrade_policy" "n051" {
  account_moid = try(local.m051["account_moid"], null)
  additional_properties = try(local.m051["additional_properties"], null)
  auto_upgrade = try(local.m051["auto_upgrade"], null)
  blackout_dates_enabled = try(local.m051["blackout_dates_enabled"], null)
  blackout_end_date = try(local.m051["blackout_end_date"], null)
  blackout_start_date = try(local.m051["blackout_start_date"], null)
  class_id = try(local.m051["class_id"], null)
  create_time = try(local.m051["create_time"], null)
  disruptive_grace_period_week = try(local.m051["disruptive_grace_period_week"], null)
  domain_group_moid = try(local.m051["domain_group_moid"], null)
  enable_meta_data_sync = try(local.m051["enable_meta_data_sync"], null)
  id = try(local.m051["id"], null)
  is_custom_grace_period_enabled = try(local.m051["is_custom_grace_period_enabled"], null)
  mod_time = try(local.m051["mod_time"], null)
  moid = try(local.m051["moid"], null)
  nondisruptive_grace_period_week = try(local.m051["nondisruptive_grace_period_week"], null)
  object_type = try(local.m051["object_type"], null)
  owners = try(local.m051["owners"], null)
  results = try(local.m051["results"], null)
  serial_id = try(local.m051["serial_id"], null)
  shared_scope = try(local.m051["shared_scope"], null)
  software_download_type = try(local.m051["software_download_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m051["ancestors"], null) == null ? [] : local.m051["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m051["parent"], null) == null ? [] : local.m051["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m051["permission_resources"], null) == null ? [] : local.m051["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m051["registered_device"], null) == null ? [] : local.m051["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule" {
    for_each = try(local.m051["schedule"], null) == null ? [] : local.m051["schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m051["tags"], null) == null ? [] : local.m051["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m051["version_context"], null) == null ? [] : local.m051["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
