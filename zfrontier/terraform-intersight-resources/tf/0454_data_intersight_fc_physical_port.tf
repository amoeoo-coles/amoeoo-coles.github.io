# Sample data source intersight_fc_physical_port — reads ../models/data_intersight_fc_physical_port.yml
locals { m454 = yamldecode(file("${path.module}/../models/data_intersight_fc_physical_port.yml"))["data_intersight_fc_physical_port"] }

data "intersight_fc_physical_port" "n454" {
  account_moid = try(local.m454["account_moid"], null)
  additional_properties = try(local.m454["additional_properties"], null)
  admin_speed = try(local.m454["admin_speed"], null)
  admin_state = try(local.m454["admin_state"], null)
  aggregate_port_id = try(local.m454["aggregate_port_id"], null)
  b2b_credit = try(local.m454["b2b_credit"], null)
  class_id = try(local.m454["class_id"], null)
  create_time = try(local.m454["create_time"], null)
  device_mo_id = try(local.m454["device_mo_id"], null)
  dn = try(local.m454["dn"], null)
  domain_group_moid = try(local.m454["domain_group_moid"], null)
  id = try(local.m454["id"], null)
  max_speed = try(local.m454["max_speed"], null)
  mod_time = try(local.m454["mod_time"], null)
  mode = try(local.m454["mode"], null)
  moid = try(local.m454["moid"], null)
  name = try(local.m454["name"], null)
  object_type = try(local.m454["object_type"], null)
  oper_speed = try(local.m454["oper_speed"], null)
  oper_state = try(local.m454["oper_state"], null)
  oper_state_qual = try(local.m454["oper_state_qual"], null)
  owners = try(local.m454["owners"], null)
  peer_dn = try(local.m454["peer_dn"], null)
  port_channel_id = try(local.m454["port_channel_id"], null)
  port_id = try(local.m454["port_id"], null)
  results = try(local.m454["results"], null)
  rn = try(local.m454["rn"], null)
  role = try(local.m454["role"], null)
  shared_scope = try(local.m454["shared_scope"], null)
  slot_id = try(local.m454["slot_id"], null)
  switch_id = try(local.m454["switch_id"], null)
  transceiver_type = try(local.m454["transceiver_type"], null)
  user_label = try(local.m454["user_label"], null)
  vsan = try(local.m454["vsan"], null)
  wwn = try(local.m454["wwn"], null)
  dynamic "ancestors" {
    for_each = try(local.m454["ancestors"], null) == null ? [] : local.m454["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_switch_card" {
    for_each = try(local.m454["equipment_switch_card"], null) == null ? [] : local.m454["equipment_switch_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_neighbor" {
    for_each = try(local.m454["fc_neighbor"], null) == null ? [] : local.m454["fc_neighbor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m454["inventory_device_info"], null) == null ? [] : local.m454["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_supervisor_card" {
    for_each = try(local.m454["network_supervisor_card"], null) == null ? [] : local.m454["network_supervisor_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m454["parent"], null) == null ? [] : local.m454["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m454["permission_resources"], null) == null ? [] : local.m454["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_group" {
    for_each = try(local.m454["port_group"], null) == null ? [] : local.m454["port_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_sub_group" {
    for_each = try(local.m454["port_sub_group"], null) == null ? [] : local.m454["port_sub_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m454["registered_device"], null) == null ? [] : local.m454["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m454["tags"], null) == null ? [] : local.m454["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m454["version_context"], null) == null ? [] : local.m454["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
