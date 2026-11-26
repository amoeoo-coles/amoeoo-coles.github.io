# Sample data source intersight_fabric_san_pin_group — reads ../models/data_intersight_fabric_san_pin_group.yml
locals { m429 = yamldecode(file("${path.module}/../models/data_intersight_fabric_san_pin_group.yml"))["data_intersight_fabric_san_pin_group"] }

data "intersight_fabric_san_pin_group" "n429" {
  account_moid = try(local.m429["account_moid"], null)
  additional_properties = try(local.m429["additional_properties"], null)
  class_id = try(local.m429["class_id"], null)
  create_time = try(local.m429["create_time"], null)
  domain_group_moid = try(local.m429["domain_group_moid"], null)
  id = try(local.m429["id"], null)
  mod_time = try(local.m429["mod_time"], null)
  moid = try(local.m429["moid"], null)
  name = try(local.m429["name"], null)
  object_type = try(local.m429["object_type"], null)
  owners = try(local.m429["owners"], null)
  results = try(local.m429["results"], null)
  shared_scope = try(local.m429["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m429["ancestors"], null) == null ? [] : local.m429["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m429["parent"], null) == null ? [] : local.m429["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m429["permission_resources"], null) == null ? [] : local.m429["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pin_target_interface_role" {
    for_each = try(local.m429["pin_target_interface_role"], null) == null ? [] : local.m429["pin_target_interface_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m429["port_policy"], null) == null ? [] : local.m429["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m429["tags"], null) == null ? [] : local.m429["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m429["version_context"], null) == null ? [] : local.m429["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
