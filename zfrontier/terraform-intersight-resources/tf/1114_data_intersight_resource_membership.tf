# Sample data source intersight_resource_membership — reads ../models/data_intersight_resource_membership.yml
locals { m1114 = yamldecode(file("${path.module}/../models/data_intersight_resource_membership.yml"))["data_intersight_resource_membership"] }

data "intersight_resource_membership" "n1114" {
  account_moid = try(local.m1114["account_moid"], null)
  additional_properties = try(local.m1114["additional_properties"], null)
  class_id = try(local.m1114["class_id"], null)
  create_time = try(local.m1114["create_time"], null)
  domain_group_moid = try(local.m1114["domain_group_moid"], null)
  id = try(local.m1114["id"], null)
  mod_time = try(local.m1114["mod_time"], null)
  moid = try(local.m1114["moid"], null)
  object_type = try(local.m1114["object_type"], null)
  owners = try(local.m1114["owners"], null)
  reevaluate = try(local.m1114["reevaluate"], null)
  results = try(local.m1114["results"], null)
  shared_scope = try(local.m1114["shared_scope"], null)
  target_app = try(local.m1114["target_app"], null)
  dynamic "ancestors" {
    for_each = try(local.m1114["ancestors"], null) == null ? [] : local.m1114["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "group_permission_roles" {
    for_each = try(local.m1114["group_permission_roles"], null) == null ? [] : local.m1114["group_permission_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "holder" {
    for_each = try(local.m1114["holder"], null) == null ? [] : local.m1114["holder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1114["parent"], null) == null ? [] : local.m1114["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1114["permission_resources"], null) == null ? [] : local.m1114["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m1114["resource"], null) == null ? [] : local.m1114["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_ancestors" {
    for_each = try(local.m1114["resource_ancestors"], null) == null ? [] : local.m1114["resource_ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1114["tags"], null) == null ? [] : local.m1114["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1114["version_context"], null) == null ? [] : local.m1114["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
