# Sample data source intersight_network_ip_address_info — reads ../models/data_intersight_network_ip_address_info.yml
locals { m868 = yamldecode(file("${path.module}/../models/data_intersight_network_ip_address_info.yml"))["data_intersight_network_ip_address_info"] }

data "intersight_network_ip_address_info" "n868" {
  account_moid = try(local.m868["account_moid"], null)
  additional_properties = try(local.m868["additional_properties"], null)
  address = try(local.m868["address"], null)
  address_family = try(local.m868["address_family"], null)
  address_origin = try(local.m868["address_origin"], null)
  address_state = try(local.m868["address_state"], null)
  class_id = try(local.m868["class_id"], null)
  create_time = try(local.m868["create_time"], null)
  device_mo_id = try(local.m868["device_mo_id"], null)
  dn = try(local.m868["dn"], null)
  domain_group_moid = try(local.m868["domain_group_moid"], null)
  id = try(local.m868["id"], null)
  interface_type = try(local.m868["interface_type"], null)
  ip_address_error = try(local.m868["ip_address_error"], null)
  mod_time = try(local.m868["mod_time"], null)
  moid = try(local.m868["moid"], null)
  object_type = try(local.m868["object_type"], null)
  owners = try(local.m868["owners"], null)
  prefix_length = try(local.m868["prefix_length"], null)
  results = try(local.m868["results"], null)
  rn = try(local.m868["rn"], null)
  shared_scope = try(local.m868["shared_scope"], null)
  subnet_mask = try(local.m868["subnet_mask"], null)
  dynamic "ancestors" {
    for_each = try(local.m868["ancestors"], null) == null ? [] : local.m868["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m868["network_element"], null) == null ? [] : local.m868["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m868["parent"], null) == null ? [] : local.m868["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m868["permission_resources"], null) == null ? [] : local.m868["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m868["registered_device"], null) == null ? [] : local.m868["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m868["tags"], null) == null ? [] : local.m868["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m868["version_context"], null) == null ? [] : local.m868["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
