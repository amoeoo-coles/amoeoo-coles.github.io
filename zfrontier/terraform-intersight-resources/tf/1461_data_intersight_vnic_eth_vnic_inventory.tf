# Sample data source intersight_vnic_eth_vnic_inventory — reads ../models/data_intersight_vnic_eth_vnic_inventory.yml
locals { m1461 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_vnic_inventory.yml"))["data_intersight_vnic_eth_vnic_inventory"] }

data "intersight_vnic_eth_vnic_inventory" "n1461" {
  account_moid = try(local.m1461["account_moid"], null)
  additional_properties = try(local.m1461["additional_properties"], null)
  class_id = try(local.m1461["class_id"], null)
  cos = try(local.m1461["cos"], null)
  create_time = try(local.m1461["create_time"], null)
  device_mo_id = try(local.m1461["device_mo_id"], null)
  domain_group_moid = try(local.m1461["domain_group_moid"], null)
  id = try(local.m1461["id"], null)
  mod_time = try(local.m1461["mod_time"], null)
  moid = try(local.m1461["moid"], null)
  mtu = try(local.m1461["mtu"], null)
  name = try(local.m1461["name"], null)
  object_type = try(local.m1461["object_type"], null)
  owners = try(local.m1461["owners"], null)
  results = try(local.m1461["results"], null)
  shared_scope = try(local.m1461["shared_scope"], null)
  trust_host_cos = try(local.m1461["trust_host_cos"], null)
  dynamic "ancestors" {
    for_each = try(local.m1461["ancestors"], null) == null ? [] : local.m1461["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1461["parent"], null) == null ? [] : local.m1461["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1461["permission_resources"], null) == null ? [] : local.m1461["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1461["tags"], null) == null ? [] : local.m1461["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1461["target_mo"], null) == null ? [] : local.m1461["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1461["version_context"], null) == null ? [] : local.m1461["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
