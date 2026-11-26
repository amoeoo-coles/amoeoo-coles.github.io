# Sample data source intersight_network_vethernet — reads ../models/data_intersight_network_vethernet.yml
locals { m874 = yamldecode(file("${path.module}/../models/data_intersight_network_vethernet.yml"))["data_intersight_network_vethernet"] }

data "intersight_network_vethernet" "n874" {
  account_moid = try(local.m874["account_moid"], null)
  additional_properties = try(local.m874["additional_properties"], null)
  bound_interface_dn = try(local.m874["bound_interface_dn"], null)
  burst = try(local.m874["burst"], null)
  class_id = try(local.m874["class_id"], null)
  create_time = try(local.m874["create_time"], null)
  description = try(local.m874["description"], null)
  device_mo_id = try(local.m874["device_mo_id"], null)
  dn = try(local.m874["dn"], null)
  domain_group_moid = try(local.m874["domain_group_moid"], null)
  id = try(local.m874["id"], null)
  mod_time = try(local.m874["mod_time"], null)
  moid = try(local.m874["moid"], null)
  object_type = try(local.m874["object_type"], null)
  oper_reason = try(local.m874["oper_reason"], null)
  oper_state = try(local.m874["oper_state"], null)
  owners = try(local.m874["owners"], null)
  pinned_interface_dn = try(local.m874["pinned_interface_dn"], null)
  ratelimit = try(local.m874["ratelimit"], null)
  results = try(local.m874["results"], null)
  rn = try(local.m874["rn"], null)
  shared_scope = try(local.m874["shared_scope"], null)
  veth_id = try(local.m874["veth_id"], null)
  dynamic "adapter_host_eth_interface" {
    for_each = try(local.m874["adapter_host_eth_interface"], null) == null ? [] : local.m874["adapter_host_eth_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m874["ancestors"], null) == null ? [] : local.m874["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bound_interface" {
    for_each = try(local.m874["bound_interface"], null) == null ? [] : local.m874["bound_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m874["network_element"], null) == null ? [] : local.m874["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m874["parent"], null) == null ? [] : local.m874["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m874["permission_resources"], null) == null ? [] : local.m874["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pinned_interface" {
    for_each = try(local.m874["pinned_interface"], null) == null ? [] : local.m874["pinned_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m874["registered_device"], null) == null ? [] : local.m874["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m874["tags"], null) == null ? [] : local.m874["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m874["version_context"], null) == null ? [] : local.m874["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
