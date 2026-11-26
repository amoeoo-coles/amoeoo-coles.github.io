# Sample data source intersight_hyperflex_device_package_download_state — reads ../models/data_intersight_hyperflex_device_package_download_state.yml
locals { m596 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_device_package_download_state.yml"))["data_intersight_hyperflex_device_package_download_state"] }

data "intersight_hyperflex_device_package_download_state" "n596" {
  account_moid = try(local.m596["account_moid"], null)
  additional_properties = try(local.m596["additional_properties"], null)
  checksum = try(local.m596["checksum"], null)
  class_id = try(local.m596["class_id"], null)
  create_time = try(local.m596["create_time"], null)
  domain_group_moid = try(local.m596["domain_group_moid"], null)
  hx_device_name = try(local.m596["hx_device_name"], null)
  hx_nodes = try(local.m596["hx_nodes"], null)
  id = try(local.m596["id"], null)
  mod_time = try(local.m596["mod_time"], null)
  moid = try(local.m596["moid"], null)
  object_type = try(local.m596["object_type"], null)
  owners = try(local.m596["owners"], null)
  results = try(local.m596["results"], null)
  shared_scope = try(local.m596["shared_scope"], null)
  timestamp = try(local.m596["timestamp"], null)
  dynamic "ancestors" {
    for_each = try(local.m596["ancestors"], null) == null ? [] : local.m596["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m596["parent"], null) == null ? [] : local.m596["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m596["permission_resources"], null) == null ? [] : local.m596["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m596["registered_device"], null) == null ? [] : local.m596["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m596["tags"], null) == null ? [] : local.m596["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m596["version_context"], null) == null ? [] : local.m596["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
