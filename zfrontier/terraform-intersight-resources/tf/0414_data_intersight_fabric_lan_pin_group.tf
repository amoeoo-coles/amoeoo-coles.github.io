# Sample data source intersight_fabric_lan_pin_group — reads ../models/data_intersight_fabric_lan_pin_group.yml
locals { m414 = yamldecode(file("${path.module}/../models/data_intersight_fabric_lan_pin_group.yml"))["data_intersight_fabric_lan_pin_group"] }

data "intersight_fabric_lan_pin_group" "n414" {
  account_moid = try(local.m414["account_moid"], null)
  additional_properties = try(local.m414["additional_properties"], null)
  class_id = try(local.m414["class_id"], null)
  create_time = try(local.m414["create_time"], null)
  domain_group_moid = try(local.m414["domain_group_moid"], null)
  id = try(local.m414["id"], null)
  mod_time = try(local.m414["mod_time"], null)
  moid = try(local.m414["moid"], null)
  name = try(local.m414["name"], null)
  object_type = try(local.m414["object_type"], null)
  owners = try(local.m414["owners"], null)
  results = try(local.m414["results"], null)
  shared_scope = try(local.m414["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m414["ancestors"], null) == null ? [] : local.m414["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m414["parent"], null) == null ? [] : local.m414["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m414["permission_resources"], null) == null ? [] : local.m414["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pin_target_interface_role" {
    for_each = try(local.m414["pin_target_interface_role"], null) == null ? [] : local.m414["pin_target_interface_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m414["port_policy"], null) == null ? [] : local.m414["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m414["tags"], null) == null ? [] : local.m414["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m414["version_context"], null) == null ? [] : local.m414["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
