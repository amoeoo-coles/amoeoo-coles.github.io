# Sample data source intersight_iam_ldap_policy_inventory — reads ../models/data_intersight_iam_ldap_policy_inventory.yml
locals { m716 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_policy_inventory.yml"))["data_intersight_iam_ldap_policy_inventory"] }

data "intersight_iam_ldap_policy_inventory" "n716" {
  account_moid = try(local.m716["account_moid"], null)
  additional_properties = try(local.m716["additional_properties"], null)
  class_id = try(local.m716["class_id"], null)
  create_time = try(local.m716["create_time"], null)
  description = try(local.m716["description"], null)
  device_mo_id = try(local.m716["device_mo_id"], null)
  domain_group_moid = try(local.m716["domain_group_moid"], null)
  enable_dns = try(local.m716["enable_dns"], null)
  enabled = try(local.m716["enabled"], null)
  id = try(local.m716["id"], null)
  mod_time = try(local.m716["mod_time"], null)
  moid = try(local.m716["moid"], null)
  name = try(local.m716["name"], null)
  object_type = try(local.m716["object_type"], null)
  owners = try(local.m716["owners"], null)
  results = try(local.m716["results"], null)
  shared_scope = try(local.m716["shared_scope"], null)
  user_search_precedence = try(local.m716["user_search_precedence"], null)
  dynamic "ancestors" {
    for_each = try(local.m716["ancestors"], null) == null ? [] : local.m716["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "base_properties" {
    for_each = try(local.m716["base_properties"], null) == null ? [] : local.m716["base_properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dns_parameters" {
    for_each = try(local.m716["dns_parameters"], null) == null ? [] : local.m716["dns_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "groups" {
    for_each = try(local.m716["groups"], null) == null ? [] : local.m716["groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_providers" {
    for_each = try(local.m716["nr_providers"], null) == null ? [] : local.m716["nr_providers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m716["parent"], null) == null ? [] : local.m716["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m716["permission_resources"], null) == null ? [] : local.m716["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m716["tags"], null) == null ? [] : local.m716["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m716["target_mo"], null) == null ? [] : local.m716["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m716["version_context"], null) == null ? [] : local.m716["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
