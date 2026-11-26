# Sample data source intersight_appliance_device_state — reads ../models/data_intersight_appliance_device_state.yml
locals { m050 = yamldecode(file("${path.module}/../models/data_intersight_appliance_device_state.yml"))["data_intersight_appliance_device_state"] }

data "intersight_appliance_device_state" "n050" {
  account_moid = try(local.m050["account_moid"], null)
  additional_properties = try(local.m050["additional_properties"], null)
  block_reasons = try(local.m050["block_reasons"], null)
  blocked_version = try(local.m050["blocked_version"], null)
  certificate = try(local.m050["certificate"], null)
  certificate_not_after = try(local.m050["certificate_not_after"], null)
  class_id = try(local.m050["class_id"], null)
  connection_status = try(local.m050["connection_status"], null)
  create_time = try(local.m050["create_time"], null)
  current_fingerprint = try(local.m050["current_fingerprint"], null)
  current_version = try(local.m050["current_version"], null)
  dc_version = try(local.m050["dc_version"], null)
  desired_version = try(local.m050["desired_version"], null)
  domain_group_moid = try(local.m050["domain_group_moid"], null)
  downloaded_fingerprint = try(local.m050["downloaded_fingerprint"], null)
  downloaded_version = try(local.m050["downloaded_version"], null)
  hostname = try(local.m050["hostname"], null)
  id = try(local.m050["id"], null)
  mod_time = try(local.m050["mod_time"], null)
  moid = try(local.m050["moid"], null)
  object_type = try(local.m050["object_type"], null)
  owners = try(local.m050["owners"], null)
  pending_fingerprint = try(local.m050["pending_fingerprint"], null)
  pending_version = try(local.m050["pending_version"], null)
  results = try(local.m050["results"], null)
  serial_id = try(local.m050["serial_id"], null)
  shared_scope = try(local.m050["shared_scope"], null)
  upgrade_blocked = try(local.m050["upgrade_blocked"], null)
  dynamic "ancestors" {
    for_each = try(local.m050["ancestors"], null) == null ? [] : local.m050["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m050["capabilities"], null) == null ? [] : local.m050["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_info" {
    for_each = try(local.m050["cluster_info"], null) == null ? [] : local.m050["cluster_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "downloaded_metadata_version" {
    for_each = try(local.m050["downloaded_metadata_version"], null) == null ? [] : local.m050["downloaded_metadata_version"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m050["parent"], null) == null ? [] : local.m050["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m050["permission_resources"], null) == null ? [] : local.m050["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m050["registered_device"], null) == null ? [] : local.m050["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m050["tags"], null) == null ? [] : local.m050["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_policy" {
    for_each = try(local.m050["upgrade_policy"], null) == null ? [] : local.m050["upgrade_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m050["version_context"], null) == null ? [] : local.m050["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
