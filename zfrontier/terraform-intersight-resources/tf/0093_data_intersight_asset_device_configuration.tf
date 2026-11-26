# Sample data source intersight_asset_device_configuration — reads ../models/data_intersight_asset_device_configuration.yml
locals { m093 = yamldecode(file("${path.module}/../models/data_intersight_asset_device_configuration.yml"))["data_intersight_asset_device_configuration"] }

data "intersight_asset_device_configuration" "n093" {
  account_moid = try(local.m093["account_moid"], null)
  additional_properties = try(local.m093["additional_properties"], null)
  class_id = try(local.m093["class_id"], null)
  create_time = try(local.m093["create_time"], null)
  domain_group_moid = try(local.m093["domain_group_moid"], null)
  id = try(local.m093["id"], null)
  local_configuration_locked = try(local.m093["local_configuration_locked"], null)
  log_level = try(local.m093["log_level"], null)
  mod_time = try(local.m093["mod_time"], null)
  moid = try(local.m093["moid"], null)
  object_type = try(local.m093["object_type"], null)
  owners = try(local.m093["owners"], null)
  results = try(local.m093["results"], null)
  shared_scope = try(local.m093["shared_scope"], null)
  tunneled_kvm = try(local.m093["tunneled_kvm"], null)
  dynamic "ancestors" {
    for_each = try(local.m093["ancestors"], null) == null ? [] : local.m093["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m093["device"], null) == null ? [] : local.m093["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m093["parent"], null) == null ? [] : local.m093["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m093["permission_resources"], null) == null ? [] : local.m093["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m093["tags"], null) == null ? [] : local.m093["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m093["version_context"], null) == null ? [] : local.m093["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
