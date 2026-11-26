# Sample data source intersight_iam_ldap_group_inventory — reads ../models/data_intersight_iam_ldap_group_inventory.yml
locals { m713 = yamldecode(file("${path.module}/../models/data_intersight_iam_ldap_group_inventory.yml"))["data_intersight_iam_ldap_group_inventory"] }

data "intersight_iam_ldap_group_inventory" "n713" {
  account_moid = try(local.m713["account_moid"], null)
  additional_properties = try(local.m713["additional_properties"], null)
  class_id = try(local.m713["class_id"], null)
  create_time = try(local.m713["create_time"], null)
  device_mo_id = try(local.m713["device_mo_id"], null)
  domain = try(local.m713["domain"], null)
  domain_group_moid = try(local.m713["domain_group_moid"], null)
  group_dn = try(local.m713["group_dn"], null)
  id = try(local.m713["id"], null)
  mod_time = try(local.m713["mod_time"], null)
  moid = try(local.m713["moid"], null)
  name = try(local.m713["name"], null)
  object_type = try(local.m713["object_type"], null)
  owners = try(local.m713["owners"], null)
  results = try(local.m713["results"], null)
  shared_scope = try(local.m713["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m713["ancestors"], null) == null ? [] : local.m713["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_role" {
    for_each = try(local.m713["end_point_role"], null) == null ? [] : local.m713["end_point_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_policy" {
    for_each = try(local.m713["ldap_policy"], null) == null ? [] : local.m713["ldap_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m713["parent"], null) == null ? [] : local.m713["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m713["permission_resources"], null) == null ? [] : local.m713["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m713["tags"], null) == null ? [] : local.m713["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m713["version_context"], null) == null ? [] : local.m713["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
