# Sample data source intersight_iam_role — reads ../models/data_intersight_iam_role.yml
locals { m732 = yamldecode(file("${path.module}/../models/data_intersight_iam_role.yml"))["data_intersight_iam_role"] }

data "intersight_iam_role" "n732" {
  account_moid = try(local.m732["account_moid"], null)
  additional_properties = try(local.m732["additional_properties"], null)
  class_id = try(local.m732["class_id"], null)
  create_time = try(local.m732["create_time"], null)
  description = try(local.m732["description"], null)
  domain_group_moid = try(local.m732["domain_group_moid"], null)
  id = try(local.m732["id"], null)
  mod_time = try(local.m732["mod_time"], null)
  moid = try(local.m732["moid"], null)
  name = try(local.m732["name"], null)
  object_type = try(local.m732["object_type"], null)
  owners = try(local.m732["owners"], null)
  privilege_names = try(local.m732["privilege_names"], null)
  results = try(local.m732["results"], null)
  shared_scope = try(local.m732["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m732["account"], null) == null ? [] : local.m732["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m732["ancestors"], null) == null ? [] : local.m732["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m732["parent"], null) == null ? [] : local.m732["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m732["permission_resources"], null) == null ? [] : local.m732["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privilege_sets" {
    for_each = try(local.m732["privilege_sets"], null) == null ? [] : local.m732["privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m732["system"], null) == null ? [] : local.m732["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m732["tags"], null) == null ? [] : local.m732["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m732["version_context"], null) == null ? [] : local.m732["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
