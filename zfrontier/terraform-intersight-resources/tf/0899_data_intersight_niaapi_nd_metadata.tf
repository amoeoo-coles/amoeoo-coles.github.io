# Sample data source intersight_niaapi_nd_metadata — reads ../models/data_intersight_niaapi_nd_metadata.yml
locals { m899 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_nd_metadata.yml"))["data_intersight_niaapi_nd_metadata"] }

data "intersight_niaapi_nd_metadata" "n899" {
  account_moid = try(local.m899["account_moid"], null)
  additional_properties = try(local.m899["additional_properties"], null)
  class_id = try(local.m899["class_id"], null)
  create_time = try(local.m899["create_time"], null)
  date = try(local.m899["date"], null)
  domain_group_moid = try(local.m899["domain_group_moid"], null)
  id = try(local.m899["id"], null)
  metadata_chksum = try(local.m899["metadata_chksum"], null)
  metadata_filename = try(local.m899["metadata_filename"], null)
  metadata_size = try(local.m899["metadata_size"], null)
  mod_time = try(local.m899["mod_time"], null)
  moid = try(local.m899["moid"], null)
  nr_version = try(local.m899["nr_version"], null)
  object_type = try(local.m899["object_type"], null)
  owners = try(local.m899["owners"], null)
  results = try(local.m899["results"], null)
  shared_scope = try(local.m899["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m899["ancestors"], null) == null ? [] : local.m899["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "content" {
    for_each = try(local.m899["content"], null) == null ? [] : local.m899["content"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m899["parent"], null) == null ? [] : local.m899["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m899["permission_resources"], null) == null ? [] : local.m899["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m899["tags"], null) == null ? [] : local.m899["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m899["version_context"], null) == null ? [] : local.m899["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
