# Sample data source intersight_iam_default_authentication — reads ../models/data_intersight_iam_default_authentication.yml
locals { m695 = yamldecode(file("${path.module}/../models/data_intersight_iam_default_authentication.yml"))["data_intersight_iam_default_authentication"] }

data "intersight_iam_default_authentication" "n695" {
  account_moid = try(local.m695["account_moid"], null)
  additional_properties = try(local.m695["additional_properties"], null)
  class_id = try(local.m695["class_id"], null)
  create_time = try(local.m695["create_time"], null)
  default_authentication_method = try(local.m695["default_authentication_method"], null)
  domain_group_moid = try(local.m695["domain_group_moid"], null)
  id = try(local.m695["id"], null)
  mod_time = try(local.m695["mod_time"], null)
  moid = try(local.m695["moid"], null)
  object_type = try(local.m695["object_type"], null)
  owners = try(local.m695["owners"], null)
  results = try(local.m695["results"], null)
  shared_scope = try(local.m695["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m695["account"], null) == null ? [] : local.m695["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m695["ancestors"], null) == null ? [] : local.m695["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_domain" {
    for_each = try(local.m695["ldap_domain"], null) == null ? [] : local.m695["ldap_domain"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m695["parent"], null) == null ? [] : local.m695["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m695["permission_resources"], null) == null ? [] : local.m695["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m695["tags"], null) == null ? [] : local.m695["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m695["version_context"], null) == null ? [] : local.m695["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
