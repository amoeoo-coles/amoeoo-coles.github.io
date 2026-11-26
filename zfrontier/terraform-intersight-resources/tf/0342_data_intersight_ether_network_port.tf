# Sample data source intersight_ether_network_port — reads ../models/data_intersight_ether_network_port.yml
locals { m342 = yamldecode(file("${path.module}/../models/data_intersight_ether_network_port.yml"))["data_intersight_ether_network_port"] }

data "intersight_ether_network_port" "n342" {
  account_moid = try(local.m342["account_moid"], null)
  additional_properties = try(local.m342["additional_properties"], null)
  class_id = try(local.m342["class_id"], null)
  create_time = try(local.m342["create_time"], null)
  device_mo_id = try(local.m342["device_mo_id"], null)
  dn = try(local.m342["dn"], null)
  domain_group_moid = try(local.m342["domain_group_moid"], null)
  id = try(local.m342["id"], null)
  mod_time = try(local.m342["mod_time"], null)
  module_id = try(local.m342["module_id"], null)
  moid = try(local.m342["moid"], null)
  object_type = try(local.m342["object_type"], null)
  oper_reason = try(local.m342["oper_reason"], null)
  oper_state = try(local.m342["oper_state"], null)
  owners = try(local.m342["owners"], null)
  peer_dn = try(local.m342["peer_dn"], null)
  port_id = try(local.m342["port_id"], null)
  results = try(local.m342["results"], null)
  rn = try(local.m342["rn"], null)
  shared_scope = try(local.m342["shared_scope"], null)
  slot_id = try(local.m342["slot_id"], null)
  speed = try(local.m342["speed"], null)
  switch_id = try(local.m342["switch_id"], null)
  dynamic "acknowledged_peer_interface" {
    for_each = try(local.m342["acknowledged_peer_interface"], null) == null ? [] : local.m342["acknowledged_peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m342["ancestors"], null) == null ? [] : local.m342["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_io_card_base" {
    for_each = try(local.m342["equipment_io_card_base"], null) == null ? [] : local.m342["equipment_io_card_base"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m342["parent"], null) == null ? [] : local.m342["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface" {
    for_each = try(local.m342["peer_interface"], null) == null ? [] : local.m342["peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m342["permission_resources"], null) == null ? [] : local.m342["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m342["registered_device"], null) == null ? [] : local.m342["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m342["tags"], null) == null ? [] : local.m342["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m342["version_context"], null) == null ? [] : local.m342["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
