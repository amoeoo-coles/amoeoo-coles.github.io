# Sample data source intersight_fabric_vlan_inventory — reads ../models/data_intersight_fabric_vlan_inventory.yml
locals { m448 = yamldecode(file("${path.module}/../models/data_intersight_fabric_vlan_inventory.yml"))["data_intersight_fabric_vlan_inventory"] }

data "intersight_fabric_vlan_inventory" "n448" {
  account_moid = try(local.m448["account_moid"], null)
  additional_properties = try(local.m448["additional_properties"], null)
  admin_state = try(local.m448["admin_state"], null)
  class_id = try(local.m448["class_id"], null)
  create_time = try(local.m448["create_time"], null)
  domain_group_moid = try(local.m448["domain_group_moid"], null)
  id = try(local.m448["id"], null)
  mod_time = try(local.m448["mod_time"], null)
  moid = try(local.m448["moid"], null)
  name = try(local.m448["name"], null)
  object_type = try(local.m448["object_type"], null)
  owners = try(local.m448["owners"], null)
  port = try(local.m448["port"], null)
  results = try(local.m448["results"], null)
  shared_scope = try(local.m448["shared_scope"], null)
  status = try(local.m448["status"], null)
  vlan_id = try(local.m448["vlan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m448["ancestors"], null) == null ? [] : local.m448["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m448["network_element"], null) == null ? [] : local.m448["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m448["parent"], null) == null ? [] : local.m448["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m448["permission_resources"], null) == null ? [] : local.m448["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m448["registered_device"], null) == null ? [] : local.m448["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m448["tags"], null) == null ? [] : local.m448["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m448["version_context"], null) == null ? [] : local.m448["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
