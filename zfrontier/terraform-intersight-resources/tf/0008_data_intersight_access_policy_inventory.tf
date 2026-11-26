# Sample data source intersight_access_policy_inventory — reads ../models/data_intersight_access_policy_inventory.yml
locals { m008 = yamldecode(file("${path.module}/../models/data_intersight_access_policy_inventory.yml"))["data_intersight_access_policy_inventory"] }

data "intersight_access_policy_inventory" "n008" {
  account_moid = try(local.m008["account_moid"], null)
  additional_properties = try(local.m008["additional_properties"], null)
  class_id = try(local.m008["class_id"], null)
  create_time = try(local.m008["create_time"], null)
  description = try(local.m008["description"], null)
  device_mo_id = try(local.m008["device_mo_id"], null)
  domain_group_moid = try(local.m008["domain_group_moid"], null)
  id = try(local.m008["id"], null)
  inband_vlan = try(local.m008["inband_vlan"], null)
  mod_time = try(local.m008["mod_time"], null)
  moid = try(local.m008["moid"], null)
  name = try(local.m008["name"], null)
  object_type = try(local.m008["object_type"], null)
  owners = try(local.m008["owners"], null)
  results = try(local.m008["results"], null)
  shared_scope = try(local.m008["shared_scope"], null)
  dynamic "address_type" {
    for_each = try(local.m008["address_type"], null) == null ? [] : local.m008["address_type"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m008["ancestors"], null) == null ? [] : local.m008["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "configuration_type" {
    for_each = try(local.m008["configuration_type"], null) == null ? [] : local.m008["configuration_type"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inband_ip_pool" {
    for_each = try(local.m008["inband_ip_pool"], null) == null ? [] : local.m008["inband_ip_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inband_vrf" {
    for_each = try(local.m008["inband_vrf"], null) == null ? [] : local.m008["inband_vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "out_of_band_ip_pool" {
    for_each = try(local.m008["out_of_band_ip_pool"], null) == null ? [] : local.m008["out_of_band_ip_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "out_of_band_vrf" {
    for_each = try(local.m008["out_of_band_vrf"], null) == null ? [] : local.m008["out_of_band_vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m008["parent"], null) == null ? [] : local.m008["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m008["permission_resources"], null) == null ? [] : local.m008["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m008["tags"], null) == null ? [] : local.m008["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m008["target_mo"], null) == null ? [] : local.m008["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m008["version_context"], null) == null ? [] : local.m008["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
