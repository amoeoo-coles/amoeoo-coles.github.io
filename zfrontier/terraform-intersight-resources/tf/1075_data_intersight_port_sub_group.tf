# Sample data source intersight_port_sub_group — reads ../models/data_intersight_port_sub_group.yml
locals { m1075 = yamldecode(file("${path.module}/../models/data_intersight_port_sub_group.yml"))["data_intersight_port_sub_group"] }

data "intersight_port_sub_group" "n1075" {
  account_moid = try(local.m1075["account_moid"], null)
  additional_properties = try(local.m1075["additional_properties"], null)
  aggregate_port_id = try(local.m1075["aggregate_port_id"], null)
  class_id = try(local.m1075["class_id"], null)
  create_time = try(local.m1075["create_time"], null)
  device_mo_id = try(local.m1075["device_mo_id"], null)
  dn = try(local.m1075["dn"], null)
  domain_group_moid = try(local.m1075["domain_group_moid"], null)
  id = try(local.m1075["id"], null)
  mod_time = try(local.m1075["mod_time"], null)
  moid = try(local.m1075["moid"], null)
  object_type = try(local.m1075["object_type"], null)
  owners = try(local.m1075["owners"], null)
  results = try(local.m1075["results"], null)
  rn = try(local.m1075["rn"], null)
  shared_scope = try(local.m1075["shared_scope"], null)
  slot_id = try(local.m1075["slot_id"], null)
  transport = try(local.m1075["transport"], null)
  dynamic "ancestors" {
    for_each = try(local.m1075["ancestors"], null) == null ? [] : local.m1075["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_io_card_base" {
    for_each = try(local.m1075["equipment_io_card_base"], null) == null ? [] : local.m1075["equipment_io_card_base"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ether_host_ports" {
    for_each = try(local.m1075["ether_host_ports"], null) == null ? [] : local.m1075["ether_host_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ethernet_ports" {
    for_each = try(local.m1075["ethernet_ports"], null) == null ? [] : local.m1075["ethernet_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_ports" {
    for_each = try(local.m1075["fc_ports"], null) == null ? [] : local.m1075["fc_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1075["inventory_device_info"], null) == null ? [] : local.m1075["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1075["parent"], null) == null ? [] : local.m1075["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1075["permission_resources"], null) == null ? [] : local.m1075["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_group" {
    for_each = try(local.m1075["port_group"], null) == null ? [] : local.m1075["port_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1075["registered_device"], null) == null ? [] : local.m1075["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1075["tags"], null) == null ? [] : local.m1075["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1075["version_context"], null) == null ? [] : local.m1075["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
