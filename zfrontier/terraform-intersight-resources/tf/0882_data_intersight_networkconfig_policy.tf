# Sample data source intersight_networkconfig_policy — reads ../models/data_intersight_networkconfig_policy.yml
locals { m882 = yamldecode(file("${path.module}/../models/data_intersight_networkconfig_policy.yml"))["data_intersight_networkconfig_policy"] }

data "intersight_networkconfig_policy" "n882" {
  account_moid = try(local.m882["account_moid"], null)
  additional_properties = try(local.m882["additional_properties"], null)
  alternate_ipv4dns_server = try(local.m882["alternate_ipv4dns_server"], null)
  alternate_ipv6dns_server = try(local.m882["alternate_ipv6dns_server"], null)
  class_id = try(local.m882["class_id"], null)
  create_time = try(local.m882["create_time"], null)
  description = try(local.m882["description"], null)
  domain_group_moid = try(local.m882["domain_group_moid"], null)
  dynamic_dns_domain = try(local.m882["dynamic_dns_domain"], null)
  enable_dynamic_dns = try(local.m882["enable_dynamic_dns"], null)
  enable_ipv4dns_from_dhcp = try(local.m882["enable_ipv4dns_from_dhcp"], null)
  enable_ipv6 = try(local.m882["enable_ipv6"], null)
  enable_ipv6dns_from_dhcp = try(local.m882["enable_ipv6dns_from_dhcp"], null)
  id = try(local.m882["id"], null)
  mod_time = try(local.m882["mod_time"], null)
  moid = try(local.m882["moid"], null)
  name = try(local.m882["name"], null)
  object_type = try(local.m882["object_type"], null)
  owners = try(local.m882["owners"], null)
  preferred_ipv4dns_server = try(local.m882["preferred_ipv4dns_server"], null)
  preferred_ipv6dns_server = try(local.m882["preferred_ipv6dns_server"], null)
  results = try(local.m882["results"], null)
  shared_scope = try(local.m882["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m882["ancestors"], null) == null ? [] : local.m882["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "appliance_account" {
    for_each = try(local.m882["appliance_account"], null) == null ? [] : local.m882["appliance_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m882["organization"], null) == null ? [] : local.m882["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m882["parent"], null) == null ? [] : local.m882["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m882["permission_resources"], null) == null ? [] : local.m882["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m882["profiles"], null) == null ? [] : local.m882["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m882["tags"], null) == null ? [] : local.m882["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m882["version_context"], null) == null ? [] : local.m882["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
