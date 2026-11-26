# Sample data source intersight_vnic_eth_veth_inventory — reads ../models/data_intersight_vnic_eth_veth_inventory.yml
locals { m1460 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_veth_inventory.yml"))["data_intersight_vnic_eth_veth_inventory"] }

data "intersight_vnic_eth_veth_inventory" "n1460" {
  account_moid = try(local.m1460["account_moid"], null)
  additional_properties = try(local.m1460["additional_properties"], null)
  burst = try(local.m1460["burst"], null)
  class_id = try(local.m1460["class_id"], null)
  create_time = try(local.m1460["create_time"], null)
  description = try(local.m1460["description"], null)
  device_mo_id = try(local.m1460["device_mo_id"], null)
  domain_group_moid = try(local.m1460["domain_group_moid"], null)
  id = try(local.m1460["id"], null)
  mod_time = try(local.m1460["mod_time"], null)
  moid = try(local.m1460["moid"], null)
  name = try(local.m1460["name"], null)
  object_type = try(local.m1460["object_type"], null)
  owners = try(local.m1460["owners"], null)
  priority = try(local.m1460["priority"], null)
  rate_limit = try(local.m1460["rate_limit"], null)
  results = try(local.m1460["results"], null)
  shared_scope = try(local.m1460["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1460["ancestors"], null) == null ? [] : local.m1460["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1460["parent"], null) == null ? [] : local.m1460["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1460["permission_resources"], null) == null ? [] : local.m1460["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1460["tags"], null) == null ? [] : local.m1460["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1460["target_mo"], null) == null ? [] : local.m1460["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1460["version_context"], null) == null ? [] : local.m1460["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
