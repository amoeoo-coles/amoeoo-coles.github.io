# Sample data source intersight_vnic_lan_connectivity_policy_inventory — reads ../models/data_intersight_vnic_lan_connectivity_policy_inventory.yml
locals { m1479 = yamldecode(file("${path.module}/../models/data_intersight_vnic_lan_connectivity_policy_inventory.yml"))["data_intersight_vnic_lan_connectivity_policy_inventory"] }

data "intersight_vnic_lan_connectivity_policy_inventory" "n1479" {
  account_moid = try(local.m1479["account_moid"], null)
  additional_properties = try(local.m1479["additional_properties"], null)
  azure_qos_enabled = try(local.m1479["azure_qos_enabled"], null)
  class_id = try(local.m1479["class_id"], null)
  create_time = try(local.m1479["create_time"], null)
  description = try(local.m1479["description"], null)
  device_mo_id = try(local.m1479["device_mo_id"], null)
  domain_group_moid = try(local.m1479["domain_group_moid"], null)
  id = try(local.m1479["id"], null)
  iqn_allocation_type = try(local.m1479["iqn_allocation_type"], null)
  mod_time = try(local.m1479["mod_time"], null)
  moid = try(local.m1479["moid"], null)
  name = try(local.m1479["name"], null)
  object_type = try(local.m1479["object_type"], null)
  owners = try(local.m1479["owners"], null)
  placement_mode = try(local.m1479["placement_mode"], null)
  results = try(local.m1479["results"], null)
  shared_scope = try(local.m1479["shared_scope"], null)
  static_iqn_name = try(local.m1479["static_iqn_name"], null)
  target_platform = try(local.m1479["target_platform"], null)
  dynamic "ancestors" {
    for_each = try(local.m1479["ancestors"], null) == null ? [] : local.m1479["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_ifs" {
    for_each = try(local.m1479["eth_ifs"], null) == null ? [] : local.m1479["eth_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iqn_pool" {
    for_each = try(local.m1479["iqn_pool"], null) == null ? [] : local.m1479["iqn_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1479["parent"], null) == null ? [] : local.m1479["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1479["permission_resources"], null) == null ? [] : local.m1479["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1479["tags"], null) == null ? [] : local.m1479["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1479["target_mo"], null) == null ? [] : local.m1479["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1479["version_context"], null) == null ? [] : local.m1479["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
