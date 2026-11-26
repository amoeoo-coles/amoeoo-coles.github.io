# Sample data source intersight_iam_sharing_rule — reads ../models/data_intersight_iam_sharing_rule.yml
locals { m737 = yamldecode(file("${path.module}/../models/data_intersight_iam_sharing_rule.yml"))["data_intersight_iam_sharing_rule"] }

data "intersight_iam_sharing_rule" "n737" {
  account_moid = try(local.m737["account_moid"], null)
  additional_properties = try(local.m737["additional_properties"], null)
  class_id = try(local.m737["class_id"], null)
  create_time = try(local.m737["create_time"], null)
  domain_group_moid = try(local.m737["domain_group_moid"], null)
  id = try(local.m737["id"], null)
  mod_time = try(local.m737["mod_time"], null)
  moid = try(local.m737["moid"], null)
  object_type = try(local.m737["object_type"], null)
  owners = try(local.m737["owners"], null)
  results = try(local.m737["results"], null)
  shared_scope = try(local.m737["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m737["account"], null) == null ? [] : local.m737["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m737["ancestors"], null) == null ? [] : local.m737["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m737["parent"], null) == null ? [] : local.m737["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m737["permission_resources"], null) == null ? [] : local.m737["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_resource" {
    for_each = try(local.m737["shared_resource"], null) == null ? [] : local.m737["shared_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_with_resource" {
    for_each = try(local.m737["shared_with_resource"], null) == null ? [] : local.m737["shared_with_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m737["tags"], null) == null ? [] : local.m737["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m737["version_context"], null) == null ? [] : local.m737["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
