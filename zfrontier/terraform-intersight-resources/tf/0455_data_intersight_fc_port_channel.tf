# Sample data source intersight_fc_port_channel — reads ../models/data_intersight_fc_port_channel.yml
locals { m455 = yamldecode(file("${path.module}/../models/data_intersight_fc_port_channel.yml"))["data_intersight_fc_port_channel"] }

data "intersight_fc_port_channel" "n455" {
  account_moid = try(local.m455["account_moid"], null)
  additional_properties = try(local.m455["additional_properties"], null)
  admin_speed = try(local.m455["admin_speed"], null)
  admin_state = try(local.m455["admin_state"], null)
  class_id = try(local.m455["class_id"], null)
  create_time = try(local.m455["create_time"], null)
  device_mo_id = try(local.m455["device_mo_id"], null)
  dn = try(local.m455["dn"], null)
  domain_group_moid = try(local.m455["domain_group_moid"], null)
  id = try(local.m455["id"], null)
  mod_time = try(local.m455["mod_time"], null)
  mode = try(local.m455["mode"], null)
  moid = try(local.m455["moid"], null)
  name = try(local.m455["name"], null)
  object_type = try(local.m455["object_type"], null)
  oper_speed = try(local.m455["oper_speed"], null)
  oper_state = try(local.m455["oper_state"], null)
  oper_state_qual = try(local.m455["oper_state_qual"], null)
  owners = try(local.m455["owners"], null)
  port_channel_id = try(local.m455["port_channel_id"], null)
  results = try(local.m455["results"], null)
  rn = try(local.m455["rn"], null)
  role = try(local.m455["role"], null)
  shared_scope = try(local.m455["shared_scope"], null)
  switch_id = try(local.m455["switch_id"], null)
  user_label = try(local.m455["user_label"], null)
  vsan = try(local.m455["vsan"], null)
  wwn = try(local.m455["wwn"], null)
  dynamic "ancestors" {
    for_each = try(local.m455["ancestors"], null) == null ? [] : local.m455["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_switch_card" {
    for_each = try(local.m455["equipment_switch_card"], null) == null ? [] : local.m455["equipment_switch_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_neighbor" {
    for_each = try(local.m455["fc_neighbor"], null) == null ? [] : local.m455["fc_neighbor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m455["network_element"], null) == null ? [] : local.m455["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m455["parent"], null) == null ? [] : local.m455["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m455["permission_resources"], null) == null ? [] : local.m455["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m455["registered_device"], null) == null ? [] : local.m455["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m455["tags"], null) == null ? [] : local.m455["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m455["version_context"], null) == null ? [] : local.m455["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
