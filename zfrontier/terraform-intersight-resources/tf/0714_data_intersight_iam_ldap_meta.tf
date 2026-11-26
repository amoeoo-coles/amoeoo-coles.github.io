# Sample data source intersight_iam_ldap_meta — reads ../models/data_intersight_iam_ldap_meta.yml
locals { m714 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_meta.yml"))["data_intersight_iam_ldap_meta"] }

data "intersight_iam_ldap_meta" "n714" {
  account_moid = try(local.m714["account_moid"], null)
  additional_properties = try(local.m714["additional_properties"], null)
  class_id = try(local.m714["class_id"], null)
  connectors = try(local.m714["connectors"], null)
  create_time = try(local.m714["create_time"], null)
  domain = try(local.m714["domain"], null)
  domain_group_moid = try(local.m714["domain_group_moid"], null)
  id = try(local.m714["id"], null)
  mod_time = try(local.m714["mod_time"], null)
  moid = try(local.m714["moid"], null)
  object_type = try(local.m714["object_type"], null)
  owners = try(local.m714["owners"], null)
  results = try(local.m714["results"], null)
  shared_scope = try(local.m714["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m714["ancestors"], null) == null ? [] : local.m714["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m714["idp"], null) == null ? [] : local.m714["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m714["parent"], null) == null ? [] : local.m714["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m714["permission_resources"], null) == null ? [] : local.m714["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m714["tags"], null) == null ? [] : local.m714["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m714["version_context"], null) == null ? [] : local.m714["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
