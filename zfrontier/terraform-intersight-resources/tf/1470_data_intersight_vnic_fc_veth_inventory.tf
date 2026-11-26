# Sample data source intersight_vnic_fc_veth_inventory — reads ../models/data_intersight_vnic_fc_veth_inventory.yml
locals { m1470 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_veth_inventory.yml"))["data_intersight_vnic_fc_veth_inventory"] }

data "intersight_vnic_fc_veth_inventory" "n1470" {
  account_moid = try(local.m1470["account_moid"], null)
  additional_properties = try(local.m1470["additional_properties"], null)
  burst = try(local.m1470["burst"], null)
  class_id = try(local.m1470["class_id"], null)
  create_time = try(local.m1470["create_time"], null)
  description = try(local.m1470["description"], null)
  device_mo_id = try(local.m1470["device_mo_id"], null)
  domain_group_moid = try(local.m1470["domain_group_moid"], null)
  id = try(local.m1470["id"], null)
  mod_time = try(local.m1470["mod_time"], null)
  moid = try(local.m1470["moid"], null)
  name = try(local.m1470["name"], null)
  object_type = try(local.m1470["object_type"], null)
  owners = try(local.m1470["owners"], null)
  rate_limit = try(local.m1470["rate_limit"], null)
  results = try(local.m1470["results"], null)
  shared_scope = try(local.m1470["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1470["ancestors"], null) == null ? [] : local.m1470["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1470["parent"], null) == null ? [] : local.m1470["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1470["permission_resources"], null) == null ? [] : local.m1470["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1470["tags"], null) == null ? [] : local.m1470["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1470["target_mo"], null) == null ? [] : local.m1470["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1470["version_context"], null) == null ? [] : local.m1470["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
