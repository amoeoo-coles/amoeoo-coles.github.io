# Sample data source intersight_resourcepool_lease_resource — reads ../models/data_intersight_resourcepool_lease_resource.yml
locals { m1124 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_lease_resource.yml"))["data_intersight_resourcepool_lease_resource"] }

data "intersight_resourcepool_lease_resource" "n1124" {
  account_moid = try(local.m1124["account_moid"], null)
  additional_properties = try(local.m1124["additional_properties"], null)
  class_id = try(local.m1124["class_id"], null)
  create_time = try(local.m1124["create_time"], null)
  domain_group_moid = try(local.m1124["domain_group_moid"], null)
  feature = try(local.m1124["feature"], null)
  id = try(local.m1124["id"], null)
  mod_time = try(local.m1124["mod_time"], null)
  moid = try(local.m1124["moid"], null)
  object_type = try(local.m1124["object_type"], null)
  owners = try(local.m1124["owners"], null)
  results = try(local.m1124["results"], null)
  shared_scope = try(local.m1124["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1124["ancestors"], null) == null ? [] : local.m1124["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1124["parent"], null) == null ? [] : local.m1124["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1124["permission_resources"], null) == null ? [] : local.m1124["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m1124["resource"], null) == null ? [] : local.m1124["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1124["tags"], null) == null ? [] : local.m1124["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1124["version_context"], null) == null ? [] : local.m1124["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
