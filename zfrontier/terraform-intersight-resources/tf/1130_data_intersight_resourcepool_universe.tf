# Sample data source intersight_resourcepool_universe — reads ../models/data_intersight_resourcepool_universe.yml
locals { m1130 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_universe.yml"))["data_intersight_resourcepool_universe"] }

data "intersight_resourcepool_universe" "n1130" {
  account_moid = try(local.m1130["account_moid"], null)
  additional_properties = try(local.m1130["additional_properties"], null)
  class_id = try(local.m1130["class_id"], null)
  create_time = try(local.m1130["create_time"], null)
  domain_group_moid = try(local.m1130["domain_group_moid"], null)
  id = try(local.m1130["id"], null)
  mod_time = try(local.m1130["mod_time"], null)
  moid = try(local.m1130["moid"], null)
  object_type = try(local.m1130["object_type"], null)
  owners = try(local.m1130["owners"], null)
  results = try(local.m1130["results"], null)
  shared_scope = try(local.m1130["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1130["account"], null) == null ? [] : local.m1130["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1130["ancestors"], null) == null ? [] : local.m1130["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1130["parent"], null) == null ? [] : local.m1130["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1130["permission_resources"], null) == null ? [] : local.m1130["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1130["tags"], null) == null ? [] : local.m1130["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1130["version_context"], null) == null ? [] : local.m1130["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
