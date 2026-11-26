# Sample data source intersight_iam_end_point_role — reads ../models/data_intersight_iam_end_point_role.yml
locals { m699 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_role.yml"))["data_intersight_iam_end_point_role"] }

data "intersight_iam_end_point_role" "n699" {
  account_moid = try(local.m699["account_moid"], null)
  additional_properties = try(local.m699["additional_properties"], null)
  class_id = try(local.m699["class_id"], null)
  create_time = try(local.m699["create_time"], null)
  domain_group_moid = try(local.m699["domain_group_moid"], null)
  id = try(local.m699["id"], null)
  mod_time = try(local.m699["mod_time"], null)
  moid = try(local.m699["moid"], null)
  name = try(local.m699["name"], null)
  object_type = try(local.m699["object_type"], null)
  owners = try(local.m699["owners"], null)
  results = try(local.m699["results"], null)
  role_type = try(local.m699["role_type"], null)
  shared_scope = try(local.m699["shared_scope"], null)
  type = try(local.m699["type"], null)
  dynamic "account" {
    for_each = try(local.m699["account"], null) == null ? [] : local.m699["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m699["ancestors"], null) == null ? [] : local.m699["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_privileges" {
    for_each = try(local.m699["end_point_privileges"], null) == null ? [] : local.m699["end_point_privileges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m699["parent"], null) == null ? [] : local.m699["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m699["permission_resources"], null) == null ? [] : local.m699["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m699["system"], null) == null ? [] : local.m699["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m699["tags"], null) == null ? [] : local.m699["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m699["version_context"], null) == null ? [] : local.m699["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
