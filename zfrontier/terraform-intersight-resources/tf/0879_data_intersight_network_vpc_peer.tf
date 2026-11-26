# Sample data source intersight_network_vpc_peer — reads ../models/data_intersight_network_vpc_peer.yml
locals { m879 = yamldecode(file("${path.module}/../models/data_intersight_network_vpc_peer.yml"))["data_intersight_network_vpc_peer"] }

data "intersight_network_vpc_peer" "n879" {
  account_moid = try(local.m879["account_moid"], null)
  additional_properties = try(local.m879["additional_properties"], null)
  class_id = try(local.m879["class_id"], null)
  create_time = try(local.m879["create_time"], null)
  device_mo_id = try(local.m879["device_mo_id"], null)
  dn = try(local.m879["dn"], null)
  domain_group_moid = try(local.m879["domain_group_moid"], null)
  id = try(local.m879["id"], null)
  mod_time = try(local.m879["mod_time"], null)
  moid = try(local.m879["moid"], null)
  object_type = try(local.m879["object_type"], null)
  operational_state = try(local.m879["operational_state"], null)
  owners = try(local.m879["owners"], null)
  port_channel = try(local.m879["port_channel"], null)
  port_channel_id = try(local.m879["port_channel_id"], null)
  results = try(local.m879["results"], null)
  rn = try(local.m879["rn"], null)
  shared_scope = try(local.m879["shared_scope"], null)
  vpc_domain_id = try(local.m879["vpc_domain_id"], null)
  vpc_peer_id = try(local.m879["vpc_peer_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m879["ancestors"], null) == null ? [] : local.m879["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ether_port_channel" {
    for_each = try(local.m879["ether_port_channel"], null) == null ? [] : local.m879["ether_port_channel"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m879["network_element"], null) == null ? [] : local.m879["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m879["parent"], null) == null ? [] : local.m879["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m879["permission_resources"], null) == null ? [] : local.m879["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m879["registered_device"], null) == null ? [] : local.m879["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m879["tags"], null) == null ? [] : local.m879["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m879["version_context"], null) == null ? [] : local.m879["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
