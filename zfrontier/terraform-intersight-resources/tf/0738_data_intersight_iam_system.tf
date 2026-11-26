# Sample data source intersight_iam_system — reads ../models/data_intersight_iam_system.yml
locals { m738 = yamldecode(file("${path.module}/../models/data_intersight_iam_system.yml"))["data_intersight_iam_system"] }

data "intersight_iam_system" "n738" {
  account_moid = try(local.m738["account_moid"], null)
  additional_properties = try(local.m738["additional_properties"], null)
  class_id = try(local.m738["class_id"], null)
  create_time = try(local.m738["create_time"], null)
  domain_group_moid = try(local.m738["domain_group_moid"], null)
  id = try(local.m738["id"], null)
  mod_time = try(local.m738["mod_time"], null)
  moid = try(local.m738["moid"], null)
  object_type = try(local.m738["object_type"], null)
  owners = try(local.m738["owners"], null)
  results = try(local.m738["results"], null)
  shared_scope = try(local.m738["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m738["ancestors"], null) == null ? [] : local.m738["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_privileges" {
    for_each = try(local.m738["end_point_privileges"], null) == null ? [] : local.m738["end_point_privileges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_roles" {
    for_each = try(local.m738["end_point_roles"], null) == null ? [] : local.m738["end_point_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m738["idp"], null) == null ? [] : local.m738["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m738["parent"], null) == null ? [] : local.m738["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m738["permission_resources"], null) == null ? [] : local.m738["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privilege_sets" {
    for_each = try(local.m738["privilege_sets"], null) == null ? [] : local.m738["privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privileges" {
    for_each = try(local.m738["privileges"], null) == null ? [] : local.m738["privileges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "roles" {
    for_each = try(local.m738["roles"], null) == null ? [] : local.m738["roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_provider" {
    for_each = try(local.m738["service_provider"], null) == null ? [] : local.m738["service_provider"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m738["tags"], null) == null ? [] : local.m738["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m738["version_context"], null) == null ? [] : local.m738["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
