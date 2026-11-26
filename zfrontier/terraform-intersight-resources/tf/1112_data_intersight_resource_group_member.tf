# Sample data source intersight_resource_group_member — reads ../models/data_intersight_resource_group_member.yml
locals { m1112 = yamldecode(file("${path.module}/../models/data_intersight_resource_group_member.yml"))["data_intersight_resource_group_member"] }

data "intersight_resource_group_member" "n1112" {
  account_moid = try(local.m1112["account_moid"], null)
  additional_properties = try(local.m1112["additional_properties"], null)
  class_id = try(local.m1112["class_id"], null)
  create_time = try(local.m1112["create_time"], null)
  domain_group_moid = try(local.m1112["domain_group_moid"], null)
  id = try(local.m1112["id"], null)
  mod_time = try(local.m1112["mod_time"], null)
  moid = try(local.m1112["moid"], null)
  object_type = try(local.m1112["object_type"], null)
  owners = try(local.m1112["owners"], null)
  results = try(local.m1112["results"], null)
  shared_scope = try(local.m1112["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1112["ancestors"], null) == null ? [] : local.m1112["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "group" {
    for_each = try(local.m1112["group"], null) == null ? [] : local.m1112["group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1112["parent"], null) == null ? [] : local.m1112["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1112["permission_resources"], null) == null ? [] : local.m1112["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m1112["resource"], null) == null ? [] : local.m1112["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1112["tags"], null) == null ? [] : local.m1112["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1112["version_context"], null) == null ? [] : local.m1112["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
