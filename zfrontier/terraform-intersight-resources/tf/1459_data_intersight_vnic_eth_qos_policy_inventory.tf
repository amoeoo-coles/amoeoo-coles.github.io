# Sample data source intersight_vnic_eth_qos_policy_inventory — reads ../models/data_intersight_vnic_eth_qos_policy_inventory.yml
locals { m1459 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_qos_policy_inventory.yml"))["data_intersight_vnic_eth_qos_policy_inventory"] }

data "intersight_vnic_eth_qos_policy_inventory" "n1459" {
  account_moid = try(local.m1459["account_moid"], null)
  additional_properties = try(local.m1459["additional_properties"], null)
  burst = try(local.m1459["burst"], null)
  class_id = try(local.m1459["class_id"], null)
  cos = try(local.m1459["cos"], null)
  create_time = try(local.m1459["create_time"], null)
  description = try(local.m1459["description"], null)
  device_mo_id = try(local.m1459["device_mo_id"], null)
  domain_group_moid = try(local.m1459["domain_group_moid"], null)
  id = try(local.m1459["id"], null)
  mod_time = try(local.m1459["mod_time"], null)
  moid = try(local.m1459["moid"], null)
  mtu = try(local.m1459["mtu"], null)
  name = try(local.m1459["name"], null)
  object_type = try(local.m1459["object_type"], null)
  owners = try(local.m1459["owners"], null)
  priority = try(local.m1459["priority"], null)
  rate_limit = try(local.m1459["rate_limit"], null)
  results = try(local.m1459["results"], null)
  shared_scope = try(local.m1459["shared_scope"], null)
  trust_host_cos = try(local.m1459["trust_host_cos"], null)
  dynamic "ancestors" {
    for_each = try(local.m1459["ancestors"], null) == null ? [] : local.m1459["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1459["parent"], null) == null ? [] : local.m1459["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1459["permission_resources"], null) == null ? [] : local.m1459["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1459["tags"], null) == null ? [] : local.m1459["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1459["target_mo"], null) == null ? [] : local.m1459["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1459["version_context"], null) == null ? [] : local.m1459["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
