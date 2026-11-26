# Sample data source intersight_niatelemetry_switch_interface — reads ../models/data_intersight_niatelemetry_switch_interface.yml
locals { m999 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_switch_interface.yml"))["data_intersight_niatelemetry_switch_interface"] }

data "intersight_niatelemetry_switch_interface" "n999" {
  account_moid = try(local.m999["account_moid"], null)
  additional_properties = try(local.m999["additional_properties"], null)
  admin_status = try(local.m999["admin_status"], null)
  class_id = try(local.m999["class_id"], null)
  create_time = try(local.m999["create_time"], null)
  discovered = try(local.m999["discovered"], null)
  discovered_config_mode = try(local.m999["discovered_config_mode"], null)
  display_name = try(local.m999["display_name"], null)
  domain_group_moid = try(local.m999["domain_group_moid"], null)
  external_fabric = try(local.m999["external_fabric"], null)
  fabric_name = try(local.m999["fabric_name"], null)
  id = try(local.m999["id"], null)
  interface_name = try(local.m999["interface_name"], null)
  interface_type = try(local.m999["interface_type"], null)
  ip = try(local.m999["ip"], null)
  mod_time = try(local.m999["mod_time"], null)
  moid = try(local.m999["moid"], null)
  object_type = try(local.m999["object_type"], null)
  oper_mode = try(local.m999["oper_mode"], null)
  operational_status = try(local.m999["operational_status"], null)
  owners = try(local.m999["owners"], null)
  platform = try(local.m999["platform"], null)
  port_channel_id = try(local.m999["port_channel_id"], null)
  results = try(local.m999["results"], null)
  shared_scope = try(local.m999["shared_scope"], null)
  speed = try(local.m999["speed"], null)
  switch_id = try(local.m999["switch_id"], null)
  switch_name = try(local.m999["switch_name"], null)
  vlan_id = try(local.m999["vlan_id"], null)
  vpc_id = try(local.m999["vpc_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m999["ancestors"], null) == null ? [] : local.m999["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m999["parent"], null) == null ? [] : local.m999["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m999["permission_resources"], null) == null ? [] : local.m999["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch" {
    for_each = try(local.m999["switch"], null) == null ? [] : local.m999["switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m999["tags"], null) == null ? [] : local.m999["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m999["version_context"], null) == null ? [] : local.m999["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
