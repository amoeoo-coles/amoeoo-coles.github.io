# Sample data source intersight_macpool_universe — reads ../models/data_intersight_macpool_universe.yml
locals { m817 = yamldecode(file("${path.module}/../models/data_intersight_macpool_universe.yml"))["data_intersight_macpool_universe"] }

data "intersight_macpool_universe" "n817" {
  account_moid = try(local.m817["account_moid"], null)
  additional_properties = try(local.m817["additional_properties"], null)
  class_id = try(local.m817["class_id"], null)
  create_time = try(local.m817["create_time"], null)
  domain_group_moid = try(local.m817["domain_group_moid"], null)
  id = try(local.m817["id"], null)
  mod_time = try(local.m817["mod_time"], null)
  moid = try(local.m817["moid"], null)
  object_type = try(local.m817["object_type"], null)
  owners = try(local.m817["owners"], null)
  results = try(local.m817["results"], null)
  shared_scope = try(local.m817["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m817["account"], null) == null ? [] : local.m817["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m817["ancestors"], null) == null ? [] : local.m817["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m817["parent"], null) == null ? [] : local.m817["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m817["permission_resources"], null) == null ? [] : local.m817["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m817["tags"], null) == null ? [] : local.m817["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m817["version_context"], null) == null ? [] : local.m817["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
