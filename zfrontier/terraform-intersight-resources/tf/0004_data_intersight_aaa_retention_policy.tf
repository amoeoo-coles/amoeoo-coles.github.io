# Sample data source intersight_aaa_retention_policy — reads ../models/data_intersight_aaa_retention_policy.yml
locals { m004 = yamldecode(file("${path.module}/../models/data_intersight_aaa_retention_policy.yml"))["data_intersight_aaa_retention_policy"] }

data "intersight_aaa_retention_policy" "n004" {
  account_moid = try(local.m004["account_moid"], null)
  additional_properties = try(local.m004["additional_properties"], null)
  class_id = try(local.m004["class_id"], null)
  create_time = try(local.m004["create_time"], null)
  description = try(local.m004["description"], null)
  domain_group_moid = try(local.m004["domain_group_moid"], null)
  id = try(local.m004["id"], null)
  mod_time = try(local.m004["mod_time"], null)
  moid = try(local.m004["moid"], null)
  name = try(local.m004["name"], null)
  object_type = try(local.m004["object_type"], null)
  owners = try(local.m004["owners"], null)
  results = try(local.m004["results"], null)
  retention_period = try(local.m004["retention_period"], null)
  shared_scope = try(local.m004["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m004["account"], null) == null ? [] : local.m004["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m004["ancestors"], null) == null ? [] : local.m004["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m004["parent"], null) == null ? [] : local.m004["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m004["permission_resources"], null) == null ? [] : local.m004["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m004["tags"], null) == null ? [] : local.m004["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m004["version_context"], null) == null ? [] : local.m004["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
