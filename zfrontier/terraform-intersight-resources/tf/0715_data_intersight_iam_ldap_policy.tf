# Sample data source intersight_iam_ldap_policy — reads ../models/data_intersight_iam_ldap_policy.yml
locals { m715 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_policy.yml"))["data_intersight_iam_ldap_policy"] }

data "intersight_iam_ldap_policy" "n715" {
  account_moid = try(local.m715["account_moid"], null)
  additional_properties = try(local.m715["additional_properties"], null)
  class_id = try(local.m715["class_id"], null)
  create_time = try(local.m715["create_time"], null)
  description = try(local.m715["description"], null)
  domain_group_moid = try(local.m715["domain_group_moid"], null)
  enable_dns = try(local.m715["enable_dns"], null)
  enabled = try(local.m715["enabled"], null)
  id = try(local.m715["id"], null)
  mod_time = try(local.m715["mod_time"], null)
  moid = try(local.m715["moid"], null)
  name = try(local.m715["name"], null)
  object_type = try(local.m715["object_type"], null)
  owners = try(local.m715["owners"], null)
  results = try(local.m715["results"], null)
  shared_scope = try(local.m715["shared_scope"], null)
  user_search_precedence = try(local.m715["user_search_precedence"], null)
  dynamic "ancestors" {
    for_each = try(local.m715["ancestors"], null) == null ? [] : local.m715["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "appliance_account" {
    for_each = try(local.m715["appliance_account"], null) == null ? [] : local.m715["appliance_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "base_properties" {
    for_each = try(local.m715["base_properties"], null) == null ? [] : local.m715["base_properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dns_parameters" {
    for_each = try(local.m715["dns_parameters"], null) == null ? [] : local.m715["dns_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "groups" {
    for_each = try(local.m715["groups"], null) == null ? [] : local.m715["groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_providers" {
    for_each = try(local.m715["nr_providers"], null) == null ? [] : local.m715["nr_providers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m715["organization"], null) == null ? [] : local.m715["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m715["parent"], null) == null ? [] : local.m715["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m715["permission_resources"], null) == null ? [] : local.m715["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m715["profiles"], null) == null ? [] : local.m715["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m715["tags"], null) == null ? [] : local.m715["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m715["version_context"], null) == null ? [] : local.m715["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
