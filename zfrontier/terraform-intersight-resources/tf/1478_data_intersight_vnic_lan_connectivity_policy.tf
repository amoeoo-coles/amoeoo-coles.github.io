# Sample data source intersight_vnic_lan_connectivity_policy — reads ../models/data_intersight_vnic_lan_connectivity_policy.yml
locals { m1478 = yamldecode(file("${path.module}/../models/data_intersight_vnic_lan_connectivity_policy.yml"))["data_intersight_vnic_lan_connectivity_policy"] }

data "intersight_vnic_lan_connectivity_policy" "n1478" {
  account_moid = try(local.m1478["account_moid"], null)
  additional_properties = try(local.m1478["additional_properties"], null)
  azure_qos_enabled = try(local.m1478["azure_qos_enabled"], null)
  class_id = try(local.m1478["class_id"], null)
  create_time = try(local.m1478["create_time"], null)
  description = try(local.m1478["description"], null)
  domain_group_moid = try(local.m1478["domain_group_moid"], null)
  id = try(local.m1478["id"], null)
  iqn_allocation_type = try(local.m1478["iqn_allocation_type"], null)
  mod_time = try(local.m1478["mod_time"], null)
  moid = try(local.m1478["moid"], null)
  name = try(local.m1478["name"], null)
  object_type = try(local.m1478["object_type"], null)
  owners = try(local.m1478["owners"], null)
  placement_mode = try(local.m1478["placement_mode"], null)
  results = try(local.m1478["results"], null)
  shared_scope = try(local.m1478["shared_scope"], null)
  static_iqn_name = try(local.m1478["static_iqn_name"], null)
  target_platform = try(local.m1478["target_platform"], null)
  dynamic "ancestors" {
    for_each = try(local.m1478["ancestors"], null) == null ? [] : local.m1478["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_ifs" {
    for_each = try(local.m1478["eth_ifs"], null) == null ? [] : local.m1478["eth_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iqn_pool" {
    for_each = try(local.m1478["iqn_pool"], null) == null ? [] : local.m1478["iqn_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1478["organization"], null) == null ? [] : local.m1478["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1478["parent"], null) == null ? [] : local.m1478["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1478["permission_resources"], null) == null ? [] : local.m1478["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1478["profiles"], null) == null ? [] : local.m1478["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1478["tags"], null) == null ? [] : local.m1478["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1478["version_context"], null) == null ? [] : local.m1478["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
