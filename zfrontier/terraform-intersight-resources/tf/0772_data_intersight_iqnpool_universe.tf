# Sample data source intersight_iqnpool_universe — reads ../models/data_intersight_iqnpool_universe.yml
locals { m772 = yamldecode(file("${path.module}/../models/data_intersight_iqnpool_universe.yml"))["data_intersight_iqnpool_universe"] }

data "intersight_iqnpool_universe" "n772" {
  account_moid = try(local.m772["account_moid"], null)
  additional_properties = try(local.m772["additional_properties"], null)
  class_id = try(local.m772["class_id"], null)
  create_time = try(local.m772["create_time"], null)
  domain_group_moid = try(local.m772["domain_group_moid"], null)
  id = try(local.m772["id"], null)
  mod_time = try(local.m772["mod_time"], null)
  moid = try(local.m772["moid"], null)
  object_type = try(local.m772["object_type"], null)
  owners = try(local.m772["owners"], null)
  results = try(local.m772["results"], null)
  shared_scope = try(local.m772["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m772["account"], null) == null ? [] : local.m772["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m772["ancestors"], null) == null ? [] : local.m772["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m772["parent"], null) == null ? [] : local.m772["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m772["permission_resources"], null) == null ? [] : local.m772["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m772["tags"], null) == null ? [] : local.m772["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m772["version_context"], null) == null ? [] : local.m772["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
