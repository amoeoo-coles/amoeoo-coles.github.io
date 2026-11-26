# Sample data source intersight_dnac_device_interface — reads ../models/data_intersight_dnac_device_interface.yml
locals { m289 = yamldecode(file("${path.module}/../models/data_intersight_dnac_device_interface.yml"))["data_intersight_dnac_device_interface"] }

data "intersight_dnac_device_interface" "n289" {
  account_moid = try(local.m289["account_moid"], null)
  additional_properties = try(local.m289["additional_properties"], null)
  admin_status = try(local.m289["admin_status"], null)
  class_id = try(local.m289["class_id"], null)
  create_time = try(local.m289["create_time"], null)
  device_id = try(local.m289["device_id"], null)
  domain_group_moid = try(local.m289["domain_group_moid"], null)
  id = try(local.m289["id"], null)
  interface_id = try(local.m289["interface_id"], null)
  interface_name = try(local.m289["interface_name"], null)
  interface_type = try(local.m289["interface_type"], null)
  mod_time = try(local.m289["mod_time"], null)
  moid = try(local.m289["moid"], null)
  object_type = try(local.m289["object_type"], null)
  owners = try(local.m289["owners"], null)
  port_type = try(local.m289["port_type"], null)
  results = try(local.m289["results"], null)
  shared_scope = try(local.m289["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m289["ancestors"], null) == null ? [] : local.m289["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m289["parent"], null) == null ? [] : local.m289["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m289["permission_resources"], null) == null ? [] : local.m289["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m289["registered_device"], null) == null ? [] : local.m289["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m289["tags"], null) == null ? [] : local.m289["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m289["version_context"], null) == null ? [] : local.m289["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
