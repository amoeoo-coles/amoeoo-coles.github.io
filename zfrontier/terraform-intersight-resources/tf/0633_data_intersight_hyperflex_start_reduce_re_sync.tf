# Sample data source intersight_hyperflex_start_reduce_re_sync — reads ../models/data_intersight_hyperflex_start_reduce_re_sync.yml
locals { m633 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_start_reduce_re_sync.yml"))["data_intersight_hyperflex_start_reduce_re_sync"] }

data "intersight_hyperflex_start_reduce_re_sync" "n633" {
  account_moid = try(local.m633["account_moid"], null)
  additional_properties = try(local.m633["additional_properties"], null)
  class_id = try(local.m633["class_id"], null)
  cluster_mo_ids = try(local.m633["cluster_mo_ids"], null)
  create_time = try(local.m633["create_time"], null)
  domain_group_moid = try(local.m633["domain_group_moid"], null)
  id = try(local.m633["id"], null)
  mod_time = try(local.m633["mod_time"], null)
  moid = try(local.m633["moid"], null)
  object_type = try(local.m633["object_type"], null)
  operation = try(local.m633["operation"], null)
  owners = try(local.m633["owners"], null)
  results = try(local.m633["results"], null)
  shared_scope = try(local.m633["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m633["ancestors"], null) == null ? [] : local.m633["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m633["parent"], null) == null ? [] : local.m633["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m633["permission_resources"], null) == null ? [] : local.m633["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m633["tags"], null) == null ? [] : local.m633["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_details" {
    for_each = try(local.m633["target_details"], null) == null ? [] : local.m633["target_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m633["version_context"], null) == null ? [] : local.m633["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
