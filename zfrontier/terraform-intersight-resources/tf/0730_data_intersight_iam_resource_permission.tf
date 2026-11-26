# Sample data source intersight_iam_resource_permission — reads ../models/data_intersight_iam_resource_permission.yml
locals { m730 = yamldecode(file("${path.module}/../models/data_intersight_iam_resource_permission.yml"))["data_intersight_iam_resource_permission"] }

data "intersight_iam_resource_permission" "n730" {
  account_moid = try(local.m730["account_moid"], null)
  additional_properties = try(local.m730["additional_properties"], null)
  class_id = try(local.m730["class_id"], null)
  create_time = try(local.m730["create_time"], null)
  domain_group_moid = try(local.m730["domain_group_moid"], null)
  id = try(local.m730["id"], null)
  mod_time = try(local.m730["mod_time"], null)
  moid = try(local.m730["moid"], null)
  object_type = try(local.m730["object_type"], null)
  owners = try(local.m730["owners"], null)
  results = try(local.m730["results"], null)
  shared_scope = try(local.m730["shared_scope"], null)
  target_app = try(local.m730["target_app"], null)
  dynamic "ancestors" {
    for_each = try(local.m730["ancestors"], null) == null ? [] : local.m730["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "holder" {
    for_each = try(local.m730["holder"], null) == null ? [] : local.m730["holder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m730["parent"], null) == null ? [] : local.m730["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m730["permission_resources"], null) == null ? [] : local.m730["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_roles" {
    for_each = try(local.m730["permission_roles"], null) == null ? [] : local.m730["permission_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m730["resource"], null) == null ? [] : local.m730["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m730["tags"], null) == null ? [] : local.m730["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m730["version_context"], null) == null ? [] : local.m730["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
