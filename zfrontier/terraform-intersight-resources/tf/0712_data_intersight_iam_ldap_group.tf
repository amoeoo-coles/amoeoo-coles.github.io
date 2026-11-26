# Sample data source intersight_iam_ldap_group — reads ../models/data_intersight_iam_ldap_group.yml
locals { m712 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_group.yml"))["data_intersight_iam_ldap_group"] }

data "intersight_iam_ldap_group" "n712" {
  account_moid = try(local.m712["account_moid"], null)
  additional_properties = try(local.m712["additional_properties"], null)
  class_id = try(local.m712["class_id"], null)
  create_time = try(local.m712["create_time"], null)
  domain = try(local.m712["domain"], null)
  domain_group_moid = try(local.m712["domain_group_moid"], null)
  group_dn = try(local.m712["group_dn"], null)
  id = try(local.m712["id"], null)
  mod_time = try(local.m712["mod_time"], null)
  moid = try(local.m712["moid"], null)
  name = try(local.m712["name"], null)
  object_type = try(local.m712["object_type"], null)
  owners = try(local.m712["owners"], null)
  results = try(local.m712["results"], null)
  shared_scope = try(local.m712["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m712["ancestors"], null) == null ? [] : local.m712["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_role" {
    for_each = try(local.m712["end_point_role"], null) == null ? [] : local.m712["end_point_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_policy" {
    for_each = try(local.m712["ldap_policy"], null) == null ? [] : local.m712["ldap_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m712["parent"], null) == null ? [] : local.m712["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m712["permission_resources"], null) == null ? [] : local.m712["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m712["tags"], null) == null ? [] : local.m712["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m712["version_context"], null) == null ? [] : local.m712["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
