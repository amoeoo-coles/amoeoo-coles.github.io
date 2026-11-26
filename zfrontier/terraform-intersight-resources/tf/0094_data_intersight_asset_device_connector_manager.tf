# Sample data source intersight_asset_device_connector_manager — reads ../models/data_intersight_asset_device_connector_manager.yml
locals { m094 = yamldecode(file("${path.module}/../models/data_intersight_asset_device_connector_manager.yml"))["data_intersight_asset_device_connector_manager"] }

data "intersight_asset_device_connector_manager" "n094" {
  account_moid = try(local.m094["account_moid"], null)
  additional_properties = try(local.m094["additional_properties"], null)
  class_id = try(local.m094["class_id"], null)
  create_time = try(local.m094["create_time"], null)
  domain_group_moid = try(local.m094["domain_group_moid"], null)
  id = try(local.m094["id"], null)
  mod_time = try(local.m094["mod_time"], null)
  moid = try(local.m094["moid"], null)
  object_type = try(local.m094["object_type"], null)
  owners = try(local.m094["owners"], null)
  results = try(local.m094["results"], null)
  shared_scope = try(local.m094["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m094["ancestors"], null) == null ? [] : local.m094["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m094["parent"], null) == null ? [] : local.m094["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m094["permission_resources"], null) == null ? [] : local.m094["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m094["registered_device"], null) == null ? [] : local.m094["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m094["tags"], null) == null ? [] : local.m094["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m094["version_context"], null) == null ? [] : local.m094["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
