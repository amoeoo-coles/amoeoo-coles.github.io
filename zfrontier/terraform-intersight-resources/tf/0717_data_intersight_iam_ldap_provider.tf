# Sample data source intersight_iam_ldap_provider — reads ../models/data_intersight_iam_ldap_provider.yml
locals { m717 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_provider.yml"))["data_intersight_iam_ldap_provider"] }

data "intersight_iam_ldap_provider" "n717" {
  account_moid = try(local.m717["account_moid"], null)
  additional_properties = try(local.m717["additional_properties"], null)
  class_id = try(local.m717["class_id"], null)
  create_time = try(local.m717["create_time"], null)
  domain_group_moid = try(local.m717["domain_group_moid"], null)
  id = try(local.m717["id"], null)
  mod_time = try(local.m717["mod_time"], null)
  moid = try(local.m717["moid"], null)
  object_type = try(local.m717["object_type"], null)
  owners = try(local.m717["owners"], null)
  port = try(local.m717["port"], null)
  results = try(local.m717["results"], null)
  server = try(local.m717["server"], null)
  shared_scope = try(local.m717["shared_scope"], null)
  vendor = try(local.m717["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m717["ancestors"], null) == null ? [] : local.m717["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_policy" {
    for_each = try(local.m717["ldap_policy"], null) == null ? [] : local.m717["ldap_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m717["parent"], null) == null ? [] : local.m717["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m717["permission_resources"], null) == null ? [] : local.m717["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m717["tags"], null) == null ? [] : local.m717["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m717["version_context"], null) == null ? [] : local.m717["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
