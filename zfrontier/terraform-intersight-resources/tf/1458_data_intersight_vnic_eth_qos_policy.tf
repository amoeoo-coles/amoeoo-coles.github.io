# Sample data source intersight_vnic_eth_qos_policy — reads ../models/data_intersight_vnic_eth_qos_policy.yml
locals { m1458 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_qos_policy.yml"))["data_intersight_vnic_eth_qos_policy"] }

data "intersight_vnic_eth_qos_policy" "n1458" {
  account_moid = try(local.m1458["account_moid"], null)
  additional_properties = try(local.m1458["additional_properties"], null)
  burst = try(local.m1458["burst"], null)
  class_id = try(local.m1458["class_id"], null)
  cos = try(local.m1458["cos"], null)
  create_time = try(local.m1458["create_time"], null)
  description = try(local.m1458["description"], null)
  domain_group_moid = try(local.m1458["domain_group_moid"], null)
  id = try(local.m1458["id"], null)
  mod_time = try(local.m1458["mod_time"], null)
  moid = try(local.m1458["moid"], null)
  mtu = try(local.m1458["mtu"], null)
  name = try(local.m1458["name"], null)
  object_type = try(local.m1458["object_type"], null)
  owners = try(local.m1458["owners"], null)
  priority = try(local.m1458["priority"], null)
  rate_limit = try(local.m1458["rate_limit"], null)
  results = try(local.m1458["results"], null)
  shared_scope = try(local.m1458["shared_scope"], null)
  trust_host_cos = try(local.m1458["trust_host_cos"], null)
  dynamic "ancestors" {
    for_each = try(local.m1458["ancestors"], null) == null ? [] : local.m1458["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1458["organization"], null) == null ? [] : local.m1458["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1458["parent"], null) == null ? [] : local.m1458["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1458["permission_resources"], null) == null ? [] : local.m1458["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1458["tags"], null) == null ? [] : local.m1458["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1458["version_context"], null) == null ? [] : local.m1458["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
