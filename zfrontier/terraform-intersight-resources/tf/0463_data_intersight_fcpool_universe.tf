# Sample data source intersight_fcpool_universe — reads ../models/data_intersight_fcpool_universe.yml
locals { m463 = yamldecode(file("${path.module}/../models/data_intersight_fcpool_universe.yml"))["data_intersight_fcpool_universe"] }

data "intersight_fcpool_universe" "n463" {
  account_moid = try(local.m463["account_moid"], null)
  additional_properties = try(local.m463["additional_properties"], null)
  class_id = try(local.m463["class_id"], null)
  create_time = try(local.m463["create_time"], null)
  domain_group_moid = try(local.m463["domain_group_moid"], null)
  id = try(local.m463["id"], null)
  mod_time = try(local.m463["mod_time"], null)
  moid = try(local.m463["moid"], null)
  object_type = try(local.m463["object_type"], null)
  owners = try(local.m463["owners"], null)
  results = try(local.m463["results"], null)
  shared_scope = try(local.m463["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m463["account"], null) == null ? [] : local.m463["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m463["ancestors"], null) == null ? [] : local.m463["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m463["parent"], null) == null ? [] : local.m463["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m463["permission_resources"], null) == null ? [] : local.m463["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m463["tags"], null) == null ? [] : local.m463["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m463["version_context"], null) == null ? [] : local.m463["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
