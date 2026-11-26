# Sample data source intersight_hyperflex_hxdp_version — reads ../models/data_intersight_hyperflex_hxdp_version.yml
locals { m610 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_hxdp_version.yml"))["data_intersight_hyperflex_hxdp_version"] }

data "intersight_hyperflex_hxdp_version" "n610" {
  account_moid = try(local.m610["account_moid"], null)
  additional_properties = try(local.m610["additional_properties"], null)
  class_id = try(local.m610["class_id"], null)
  create_time = try(local.m610["create_time"], null)
  domain_group_moid = try(local.m610["domain_group_moid"], null)
  id = try(local.m610["id"], null)
  mod_time = try(local.m610["mod_time"], null)
  moid = try(local.m610["moid"], null)
  nr_version = try(local.m610["nr_version"], null)
  object_type = try(local.m610["object_type"], null)
  owners = try(local.m610["owners"], null)
  results = try(local.m610["results"], null)
  shared_scope = try(local.m610["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m610["ancestors"], null) == null ? [] : local.m610["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m610["app_catalog"], null) == null ? [] : local.m610["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m610["parent"], null) == null ? [] : local.m610["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m610["permission_resources"], null) == null ? [] : local.m610["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m610["tags"], null) == null ? [] : local.m610["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m610["version_context"], null) == null ? [] : local.m610["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
