# Sample data source intersight_uuidpool_universe — reads ../models/data_intersight_uuidpool_universe.yml
locals { m1402 = yamldecode(file("${path.module}/../models/data_intersight_uuidpool_universe.yml"))["data_intersight_uuidpool_universe"] }

data "intersight_uuidpool_universe" "n1402" {
  account_moid = try(local.m1402["account_moid"], null)
  additional_properties = try(local.m1402["additional_properties"], null)
  class_id = try(local.m1402["class_id"], null)
  create_time = try(local.m1402["create_time"], null)
  domain_group_moid = try(local.m1402["domain_group_moid"], null)
  id = try(local.m1402["id"], null)
  mod_time = try(local.m1402["mod_time"], null)
  moid = try(local.m1402["moid"], null)
  object_type = try(local.m1402["object_type"], null)
  owners = try(local.m1402["owners"], null)
  results = try(local.m1402["results"], null)
  shared_scope = try(local.m1402["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1402["account"], null) == null ? [] : local.m1402["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1402["ancestors"], null) == null ? [] : local.m1402["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1402["parent"], null) == null ? [] : local.m1402["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1402["permission_resources"], null) == null ? [] : local.m1402["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1402["tags"], null) == null ? [] : local.m1402["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1402["version_context"], null) == null ? [] : local.m1402["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
