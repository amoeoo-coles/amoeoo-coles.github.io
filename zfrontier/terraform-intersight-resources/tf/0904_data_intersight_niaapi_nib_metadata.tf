# Sample data source intersight_niaapi_nib_metadata — reads ../models/data_intersight_niaapi_nib_metadata.yml
locals { m904 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_nib_metadata.yml"))["data_intersight_niaapi_nib_metadata"] }

data "intersight_niaapi_nib_metadata" "n904" {
  account_moid = try(local.m904["account_moid"], null)
  additional_properties = try(local.m904["additional_properties"], null)
  class_id = try(local.m904["class_id"], null)
  create_time = try(local.m904["create_time"], null)
  date = try(local.m904["date"], null)
  domain_group_moid = try(local.m904["domain_group_moid"], null)
  id = try(local.m904["id"], null)
  metadata_chksum = try(local.m904["metadata_chksum"], null)
  metadata_filename = try(local.m904["metadata_filename"], null)
  mod_time = try(local.m904["mod_time"], null)
  moid = try(local.m904["moid"], null)
  nr_version = try(local.m904["nr_version"], null)
  object_type = try(local.m904["object_type"], null)
  owners = try(local.m904["owners"], null)
  results = try(local.m904["results"], null)
  shared_scope = try(local.m904["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m904["ancestors"], null) == null ? [] : local.m904["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "content" {
    for_each = try(local.m904["content"], null) == null ? [] : local.m904["content"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m904["parent"], null) == null ? [] : local.m904["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m904["permission_resources"], null) == null ? [] : local.m904["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m904["tags"], null) == null ? [] : local.m904["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m904["version_context"], null) == null ? [] : local.m904["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
