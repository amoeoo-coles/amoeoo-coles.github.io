# Sample data source intersight_vnic_san_connectivity_policy_inventory — reads ../models/data_intersight_vnic_san_connectivity_policy_inventory.yml
locals { m1483 = yamldecode(file("${path.module}/../models/data_intersight_vnic_san_connectivity_policy_inventory.yml"))["data_intersight_vnic_san_connectivity_policy_inventory"] }

data "intersight_vnic_san_connectivity_policy_inventory" "n1483" {
  account_moid = try(local.m1483["account_moid"], null)
  additional_properties = try(local.m1483["additional_properties"], null)
  class_id = try(local.m1483["class_id"], null)
  create_time = try(local.m1483["create_time"], null)
  description = try(local.m1483["description"], null)
  device_mo_id = try(local.m1483["device_mo_id"], null)
  domain_group_moid = try(local.m1483["domain_group_moid"], null)
  id = try(local.m1483["id"], null)
  mod_time = try(local.m1483["mod_time"], null)
  moid = try(local.m1483["moid"], null)
  name = try(local.m1483["name"], null)
  object_type = try(local.m1483["object_type"], null)
  owners = try(local.m1483["owners"], null)
  placement_mode = try(local.m1483["placement_mode"], null)
  results = try(local.m1483["results"], null)
  shared_scope = try(local.m1483["shared_scope"], null)
  static_wwnn_address = try(local.m1483["static_wwnn_address"], null)
  target_platform = try(local.m1483["target_platform"], null)
  wwnn_address_type = try(local.m1483["wwnn_address_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1483["ancestors"], null) == null ? [] : local.m1483["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_ifs" {
    for_each = try(local.m1483["fc_ifs"], null) == null ? [] : local.m1483["fc_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1483["parent"], null) == null ? [] : local.m1483["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1483["permission_resources"], null) == null ? [] : local.m1483["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1483["tags"], null) == null ? [] : local.m1483["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1483["target_mo"], null) == null ? [] : local.m1483["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1483["version_context"], null) == null ? [] : local.m1483["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wwnn_pool" {
    for_each = try(local.m1483["wwnn_pool"], null) == null ? [] : local.m1483["wwnn_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
