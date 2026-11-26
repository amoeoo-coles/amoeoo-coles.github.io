# Sample data source intersight_hyperflex_hw_catalog — reads ../models/data_intersight_hyperflex_hw_catalog.yml
locals { m609 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_hw_catalog.yml"))["data_intersight_hyperflex_hw_catalog"] }

data "intersight_hyperflex_hw_catalog" "n609" {
  account_moid = try(local.m609["account_moid"], null)
  additional_properties = try(local.m609["additional_properties"], null)
  class_id = try(local.m609["class_id"], null)
  create_time = try(local.m609["create_time"], null)
  domain_group_moid = try(local.m609["domain_group_moid"], null)
  id = try(local.m609["id"], null)
  mod_time = try(local.m609["mod_time"], null)
  moid = try(local.m609["moid"], null)
  nr_version = try(local.m609["nr_version"], null)
  object_type = try(local.m609["object_type"], null)
  owners = try(local.m609["owners"], null)
  results = try(local.m609["results"], null)
  shared_scope = try(local.m609["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m609["ancestors"], null) == null ? [] : local.m609["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog_infos" {
    for_each = try(local.m609["catalog_infos"], null) == null ? [] : local.m609["catalog_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m609["parent"], null) == null ? [] : local.m609["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m609["permission_resources"], null) == null ? [] : local.m609["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m609["tags"], null) == null ? [] : local.m609["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m609["version_context"], null) == null ? [] : local.m609["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
