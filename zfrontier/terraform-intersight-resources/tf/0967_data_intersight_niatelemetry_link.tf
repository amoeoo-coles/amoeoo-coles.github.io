# Sample data source intersight_niatelemetry_link — reads ../models/data_intersight_niatelemetry_link.yml
locals { m967 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_link.yml"))["data_intersight_niatelemetry_link"] }

data "intersight_niatelemetry_link" "n967" {
  account_moid = try(local.m967["account_moid"], null)
  additional_properties = try(local.m967["additional_properties"], null)
  class_id = try(local.m967["class_id"], null)
  create_time = try(local.m967["create_time"], null)
  domain_group_moid = try(local.m967["domain_group_moid"], null)
  dst_fabric_name = try(local.m967["dst_fabric_name"], null)
  dst_interface_name = try(local.m967["dst_interface_name"], null)
  dst_switch_id = try(local.m967["dst_switch_id"], null)
  dst_switch_model_name = try(local.m967["dst_switch_model_name"], null)
  dst_switch_name = try(local.m967["dst_switch_name"], null)
  dst_switch_role = try(local.m967["dst_switch_role"], null)
  id = try(local.m967["id"], null)
  link_discovered = try(local.m967["link_discovered"], null)
  link_id = try(local.m967["link_id"], null)
  link_planned = try(local.m967["link_planned"], null)
  link_present = try(local.m967["link_present"], null)
  link_type = try(local.m967["link_type"], null)
  mod_time = try(local.m967["mod_time"], null)
  moid = try(local.m967["moid"], null)
  object_type = try(local.m967["object_type"], null)
  owners = try(local.m967["owners"], null)
  port_channel = try(local.m967["port_channel"], null)
  results = try(local.m967["results"], null)
  shared_scope = try(local.m967["shared_scope"], null)
  src_fabric_name = try(local.m967["src_fabric_name"], null)
  src_interface_admin_status = try(local.m967["src_interface_admin_status"], null)
  src_interface_name = try(local.m967["src_interface_name"], null)
  src_interface_oper_status = try(local.m967["src_interface_oper_status"], null)
  src_switch_id = try(local.m967["src_switch_id"], null)
  src_switch_model_name = try(local.m967["src_switch_model_name"], null)
  src_switch_name = try(local.m967["src_switch_name"], null)
  src_switch_role = try(local.m967["src_switch_role"], null)
  dynamic "ancestors" {
    for_each = try(local.m967["ancestors"], null) == null ? [] : local.m967["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m967["fabric"], null) == null ? [] : local.m967["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m967["parent"], null) == null ? [] : local.m967["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m967["permission_resources"], null) == null ? [] : local.m967["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m967["tags"], null) == null ? [] : local.m967["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m967["version_context"], null) == null ? [] : local.m967["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
