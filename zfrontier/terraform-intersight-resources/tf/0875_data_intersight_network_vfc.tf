# Sample data source intersight_network_vfc — reads ../models/data_intersight_network_vfc.yml
locals { m875 = yamldecode(file("${path.module}/../models/data_intersight_network_vfc.yml"))["data_intersight_network_vfc"] }

data "intersight_network_vfc" "n875" {
  account_moid = try(local.m875["account_moid"], null)
  additional_properties = try(local.m875["additional_properties"], null)
  bound_interface_dn = try(local.m875["bound_interface_dn"], null)
  burst = try(local.m875["burst"], null)
  class_id = try(local.m875["class_id"], null)
  create_time = try(local.m875["create_time"], null)
  description = try(local.m875["description"], null)
  device_mo_id = try(local.m875["device_mo_id"], null)
  dn = try(local.m875["dn"], null)
  domain_group_moid = try(local.m875["domain_group_moid"], null)
  id = try(local.m875["id"], null)
  mod_time = try(local.m875["mod_time"], null)
  moid = try(local.m875["moid"], null)
  object_type = try(local.m875["object_type"], null)
  oper_reason = try(local.m875["oper_reason"], null)
  oper_state = try(local.m875["oper_state"], null)
  owners = try(local.m875["owners"], null)
  pinned_interface_dn = try(local.m875["pinned_interface_dn"], null)
  ratelimit = try(local.m875["ratelimit"], null)
  results = try(local.m875["results"], null)
  rn = try(local.m875["rn"], null)
  shared_scope = try(local.m875["shared_scope"], null)
  vfc_id = try(local.m875["vfc_id"], null)
  dynamic "adapter_host_fc_interface" {
    for_each = try(local.m875["adapter_host_fc_interface"], null) == null ? [] : local.m875["adapter_host_fc_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m875["ancestors"], null) == null ? [] : local.m875["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bound_interface" {
    for_each = try(local.m875["bound_interface"], null) == null ? [] : local.m875["bound_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m875["network_element"], null) == null ? [] : local.m875["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m875["parent"], null) == null ? [] : local.m875["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m875["permission_resources"], null) == null ? [] : local.m875["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pinned_interface" {
    for_each = try(local.m875["pinned_interface"], null) == null ? [] : local.m875["pinned_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m875["registered_device"], null) == null ? [] : local.m875["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m875["tags"], null) == null ? [] : local.m875["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m875["version_context"], null) == null ? [] : local.m875["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
