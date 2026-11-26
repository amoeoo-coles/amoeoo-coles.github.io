# Sample data source intersight_catalystsdwan_port_channel — reads ../models/data_intersight_catalystsdwan_port_channel.yml
locals { m203 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_port_channel.yml"))["data_intersight_catalystsdwan_port_channel"] }

data "intersight_catalystsdwan_port_channel" "n203" {
  account_moid = try(local.m203["account_moid"], null)
  additional_properties = try(local.m203["additional_properties"], null)
  admin_state = try(local.m203["admin_state"], null)
  allowed_vlan_ids = try(local.m203["allowed_vlan_ids"], null)
  class_id = try(local.m203["class_id"], null)
  create_time = try(local.m203["create_time"], null)
  default_vlan_id = try(local.m203["default_vlan_id"], null)
  dn = try(local.m203["dn"], null)
  domain_group_moid = try(local.m203["domain_group_moid"], null)
  id = try(local.m203["id"], null)
  local_system_ip = try(local.m203["local_system_ip"], null)
  mod_time = try(local.m203["mod_time"], null)
  mode = try(local.m203["mode"], null)
  moid = try(local.m203["moid"], null)
  mtu = try(local.m203["mtu"], null)
  object_type = try(local.m203["object_type"], null)
  oper_speed = try(local.m203["oper_speed"], null)
  oper_state = try(local.m203["oper_state"], null)
  owners = try(local.m203["owners"], null)
  port_channel_name = try(local.m203["port_channel_name"], null)
  results = try(local.m203["results"], null)
  shared_scope = try(local.m203["shared_scope"], null)
  system_ip = try(local.m203["system_ip"], null)
  uuid = try(local.m203["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m203["ancestors"], null) == null ? [] : local.m203["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m203["parent"], null) == null ? [] : local.m203["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m203["permission_resources"], null) == null ? [] : local.m203["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m203["registered_device"], null) == null ? [] : local.m203["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m203["tags"], null) == null ? [] : local.m203["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m203["version_context"], null) == null ? [] : local.m203["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wan_edge_device" {
    for_each = try(local.m203["wan_edge_device"], null) == null ? [] : local.m203["wan_edge_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
