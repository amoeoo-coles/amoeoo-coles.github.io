# Sample data source intersight_iam_ldap_provider_inventory — reads ../models/data_intersight_iam_ldap_provider_inventory.yml
locals { m718 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_provider_inventory.yml"))["data_intersight_iam_ldap_provider_inventory"] }

data "intersight_iam_ldap_provider_inventory" "n718" {
  account_moid = try(local.m718["account_moid"], null)
  additional_properties = try(local.m718["additional_properties"], null)
  class_id = try(local.m718["class_id"], null)
  create_time = try(local.m718["create_time"], null)
  device_mo_id = try(local.m718["device_mo_id"], null)
  domain_group_moid = try(local.m718["domain_group_moid"], null)
  id = try(local.m718["id"], null)
  mod_time = try(local.m718["mod_time"], null)
  moid = try(local.m718["moid"], null)
  object_type = try(local.m718["object_type"], null)
  owners = try(local.m718["owners"], null)
  port = try(local.m718["port"], null)
  results = try(local.m718["results"], null)
  server = try(local.m718["server"], null)
  shared_scope = try(local.m718["shared_scope"], null)
  vendor = try(local.m718["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m718["ancestors"], null) == null ? [] : local.m718["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_policy" {
    for_each = try(local.m718["ldap_policy"], null) == null ? [] : local.m718["ldap_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m718["parent"], null) == null ? [] : local.m718["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m718["permission_resources"], null) == null ? [] : local.m718["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m718["tags"], null) == null ? [] : local.m718["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m718["version_context"], null) == null ? [] : local.m718["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
