# Sample data source intersight_niaapi_nia_metadata — reads ../models/data_intersight_niaapi_nia_metadata.yml
locals { m902 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_nia_metadata.yml"))["data_intersight_niaapi_nia_metadata"] }

data "intersight_niaapi_nia_metadata" "n902" {
  account_moid = try(local.m902["account_moid"], null)
  additional_properties = try(local.m902["additional_properties"], null)
  class_id = try(local.m902["class_id"], null)
  create_time = try(local.m902["create_time"], null)
  date = try(local.m902["date"], null)
  domain_group_moid = try(local.m902["domain_group_moid"], null)
  id = try(local.m902["id"], null)
  metadata_chksum = try(local.m902["metadata_chksum"], null)
  metadata_filename = try(local.m902["metadata_filename"], null)
  mod_time = try(local.m902["mod_time"], null)
  moid = try(local.m902["moid"], null)
  nr_version = try(local.m902["nr_version"], null)
  object_type = try(local.m902["object_type"], null)
  owners = try(local.m902["owners"], null)
  results = try(local.m902["results"], null)
  shared_scope = try(local.m902["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m902["ancestors"], null) == null ? [] : local.m902["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "content" {
    for_each = try(local.m902["content"], null) == null ? [] : local.m902["content"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m902["parent"], null) == null ? [] : local.m902["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m902["permission_resources"], null) == null ? [] : local.m902["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m902["tags"], null) == null ? [] : local.m902["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m902["version_context"], null) == null ? [] : local.m902["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
