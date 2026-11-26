# Sample data source intersight_dnac_external_border_node_interface — reads ../models/data_intersight_dnac_external_border_node_interface.yml
locals { m291 = yamldecode(file("${path.module}/../models/data_intersight_dnac_external_border_node_interface.yml"))["data_intersight_dnac_external_border_node_interface"] }

data "intersight_dnac_external_border_node_interface" "n291" {
  account_moid = try(local.m291["account_moid"], null)
  additional_properties = try(local.m291["additional_properties"], null)
  admin_status = try(local.m291["admin_status"], null)
  class_id = try(local.m291["class_id"], null)
  create_time = try(local.m291["create_time"], null)
  domain_group_moid = try(local.m291["domain_group_moid"], null)
  external_border_node_id = try(local.m291["external_border_node_id"], null)
  id = try(local.m291["id"], null)
  interface_id = try(local.m291["interface_id"], null)
  interface_name = try(local.m291["interface_name"], null)
  interface_type = try(local.m291["interface_type"], null)
  mod_time = try(local.m291["mod_time"], null)
  moid = try(local.m291["moid"], null)
  object_type = try(local.m291["object_type"], null)
  owners = try(local.m291["owners"], null)
  port_type = try(local.m291["port_type"], null)
  results = try(local.m291["results"], null)
  shared_scope = try(local.m291["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m291["ancestors"], null) == null ? [] : local.m291["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m291["parent"], null) == null ? [] : local.m291["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m291["permission_resources"], null) == null ? [] : local.m291["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m291["registered_device"], null) == null ? [] : local.m291["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m291["tags"], null) == null ? [] : local.m291["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m291["version_context"], null) == null ? [] : local.m291["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
