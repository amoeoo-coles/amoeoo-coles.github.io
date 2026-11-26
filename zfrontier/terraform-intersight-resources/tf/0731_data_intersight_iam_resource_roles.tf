# Sample data source intersight_iam_resource_roles — reads ../models/data_intersight_iam_resource_roles.yml
locals { m731 = yamldecode(file("${path.module}/../models/data_intersight_iam_resource_roles.yml"))["data_intersight_iam_resource_roles"] }

data "intersight_iam_resource_roles" "n731" {
  account_moid = try(local.m731["account_moid"], null)
  additional_properties = try(local.m731["additional_properties"], null)
  class_id = try(local.m731["class_id"], null)
  create_time = try(local.m731["create_time"], null)
  domain_group_moid = try(local.m731["domain_group_moid"], null)
  id = try(local.m731["id"], null)
  mod_time = try(local.m731["mod_time"], null)
  moid = try(local.m731["moid"], null)
  object_type = try(local.m731["object_type"], null)
  owners = try(local.m731["owners"], null)
  results = try(local.m731["results"], null)
  shared_scope = try(local.m731["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m731["ancestors"], null) == null ? [] : local.m731["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_roles" {
    for_each = try(local.m731["end_point_roles"], null) == null ? [] : local.m731["end_point_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m731["parent"], null) == null ? [] : local.m731["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission" {
    for_each = try(local.m731["permission"], null) == null ? [] : local.m731["permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m731["permission_resources"], null) == null ? [] : local.m731["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privilege_sets" {
    for_each = try(local.m731["privilege_sets"], null) == null ? [] : local.m731["privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m731["resource"], null) == null ? [] : local.m731["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "roles" {
    for_each = try(local.m731["roles"], null) == null ? [] : local.m731["roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m731["tags"], null) == null ? [] : local.m731["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m731["version_context"], null) == null ? [] : local.m731["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
