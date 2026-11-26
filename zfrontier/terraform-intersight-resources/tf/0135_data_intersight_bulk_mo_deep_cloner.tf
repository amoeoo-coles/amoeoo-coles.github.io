# Sample data source intersight_bulk_mo_deep_cloner — reads ../models/data_intersight_bulk_mo_deep_cloner.yml
locals { m135 = yamldecode(file("${path.module}/../models/data_intersight_bulk_mo_deep_cloner.yml"))["data_intersight_bulk_mo_deep_cloner"] }

data "intersight_bulk_mo_deep_cloner" "n135" {
  account_moid = try(local.m135["account_moid"], null)
  additional_properties = try(local.m135["additional_properties"], null)
  class_id = try(local.m135["class_id"], null)
  create_time = try(local.m135["create_time"], null)
  domain_group_moid = try(local.m135["domain_group_moid"], null)
  exclude_properties = try(local.m135["exclude_properties"], null)
  id = try(local.m135["id"], null)
  mod_time = try(local.m135["mod_time"], null)
  moid = try(local.m135["moid"], null)
  object_type = try(local.m135["object_type"], null)
  owners = try(local.m135["owners"], null)
  reference_name_suffix = try(local.m135["reference_name_suffix"], null)
  reference_policy = try(local.m135["reference_policy"], null)
  results = try(local.m135["results"], null)
  shared_scope = try(local.m135["shared_scope"], null)
  workflow_name_suffix = try(local.m135["workflow_name_suffix"], null)
  dynamic "ancestors" {
    for_each = try(local.m135["ancestors"], null) == null ? [] : local.m135["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "async_result" {
    for_each = try(local.m135["async_result"], null) == null ? [] : local.m135["async_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m135["nr_source"], null) == null ? [] : local.m135["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m135["organization"], null) == null ? [] : local.m135["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m135["parent"], null) == null ? [] : local.m135["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m135["permission_resources"], null) == null ? [] : local.m135["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m135["tags"], null) == null ? [] : local.m135["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "targets" {
    for_each = try(local.m135["targets"], null) == null ? [] : local.m135["targets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m135["version_context"], null) == null ? [] : local.m135["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
