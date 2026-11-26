# Sample data source intersight_network_vpc_member — reads ../models/data_intersight_network_vpc_member.yml
locals { m878 = yamldecode(file("${path.module}/../models/data_intersight_network_vpc_member.yml"))["data_intersight_network_vpc_member"] }

data "intersight_network_vpc_member" "n878" {
  account_moid = try(local.m878["account_moid"], null)
  additional_properties = try(local.m878["additional_properties"], null)
  class_id = try(local.m878["class_id"], null)
  create_time = try(local.m878["create_time"], null)
  device_mo_id = try(local.m878["device_mo_id"], null)
  dn = try(local.m878["dn"], null)
  domain_group_moid = try(local.m878["domain_group_moid"], null)
  id = try(local.m878["id"], null)
  mod_time = try(local.m878["mod_time"], null)
  moid = try(local.m878["moid"], null)
  object_type = try(local.m878["object_type"], null)
  operational_state = try(local.m878["operational_state"], null)
  owners = try(local.m878["owners"], null)
  port_channel = try(local.m878["port_channel"], null)
  port_channel_id = try(local.m878["port_channel_id"], null)
  results = try(local.m878["results"], null)
  rn = try(local.m878["rn"], null)
  shared_scope = try(local.m878["shared_scope"], null)
  vpc_domain_id = try(local.m878["vpc_domain_id"], null)
  vpc_member_id = try(local.m878["vpc_member_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m878["ancestors"], null) == null ? [] : local.m878["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ether_port_channel" {
    for_each = try(local.m878["ether_port_channel"], null) == null ? [] : local.m878["ether_port_channel"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m878["network_element"], null) == null ? [] : local.m878["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m878["parent"], null) == null ? [] : local.m878["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m878["permission_resources"], null) == null ? [] : local.m878["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m878["registered_device"], null) == null ? [] : local.m878["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m878["tags"], null) == null ? [] : local.m878["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m878["version_context"], null) == null ? [] : local.m878["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
