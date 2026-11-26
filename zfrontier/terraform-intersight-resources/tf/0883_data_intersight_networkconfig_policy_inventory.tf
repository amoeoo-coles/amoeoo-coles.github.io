# Sample data source intersight_networkconfig_policy_inventory — reads ../models/data_intersight_networkconfig_policy_inventory.yml
locals { m883 = yamldecode(file("${path.module}/../models/data_intersight_networkconfig_policy_inventory.yml"))["data_intersight_networkconfig_policy_inventory"] }

data "intersight_networkconfig_policy_inventory" "n883" {
  account_moid = try(local.m883["account_moid"], null)
  additional_properties = try(local.m883["additional_properties"], null)
  alternate_ipv4dns_server = try(local.m883["alternate_ipv4dns_server"], null)
  alternate_ipv6dns_server = try(local.m883["alternate_ipv6dns_server"], null)
  class_id = try(local.m883["class_id"], null)
  create_time = try(local.m883["create_time"], null)
  description = try(local.m883["description"], null)
  device_mo_id = try(local.m883["device_mo_id"], null)
  domain_group_moid = try(local.m883["domain_group_moid"], null)
  dynamic_dns_domain = try(local.m883["dynamic_dns_domain"], null)
  enable_dynamic_dns = try(local.m883["enable_dynamic_dns"], null)
  enable_ipv4dns_from_dhcp = try(local.m883["enable_ipv4dns_from_dhcp"], null)
  enable_ipv6 = try(local.m883["enable_ipv6"], null)
  enable_ipv6dns_from_dhcp = try(local.m883["enable_ipv6dns_from_dhcp"], null)
  id = try(local.m883["id"], null)
  mod_time = try(local.m883["mod_time"], null)
  moid = try(local.m883["moid"], null)
  name = try(local.m883["name"], null)
  object_type = try(local.m883["object_type"], null)
  owners = try(local.m883["owners"], null)
  preferred_ipv4dns_server = try(local.m883["preferred_ipv4dns_server"], null)
  preferred_ipv6dns_server = try(local.m883["preferred_ipv6dns_server"], null)
  results = try(local.m883["results"], null)
  shared_scope = try(local.m883["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m883["ancestors"], null) == null ? [] : local.m883["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m883["parent"], null) == null ? [] : local.m883["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m883["permission_resources"], null) == null ? [] : local.m883["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m883["tags"], null) == null ? [] : local.m883["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m883["target_mo"], null) == null ? [] : local.m883["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m883["version_context"], null) == null ? [] : local.m883["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
