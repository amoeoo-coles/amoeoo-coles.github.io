# Sample data source intersight_iam_ldap_config_params — reads ../models/data_intersight_iam_ldap_config_params.yml
locals { m711 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_config_params.yml"))["data_intersight_iam_ldap_config_params"] }

data "intersight_iam_ldap_config_params" "n711" {
  account_moid = try(local.m711["account_moid"], null)
  additional_properties = try(local.m711["additional_properties"], null)
  class_id = try(local.m711["class_id"], null)
  config_host = try(local.m711["config_host"], null)
  create_time = try(local.m711["create_time"], null)
  domain_group_moid = try(local.m711["domain_group_moid"], null)
  id = try(local.m711["id"], null)
  mod_time = try(local.m711["mod_time"], null)
  moid = try(local.m711["moid"], null)
  object_type = try(local.m711["object_type"], null)
  owners = try(local.m711["owners"], null)
  results = try(local.m711["results"], null)
  shared_scope = try(local.m711["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m711["account"], null) == null ? [] : local.m711["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m711["ancestors"], null) == null ? [] : local.m711["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m711["parent"], null) == null ? [] : local.m711["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m711["permission_resources"], null) == null ? [] : local.m711["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m711["tags"], null) == null ? [] : local.m711["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m711["version_context"], null) == null ? [] : local.m711["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
