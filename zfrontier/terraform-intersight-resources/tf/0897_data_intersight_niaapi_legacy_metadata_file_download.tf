# Sample data source intersight_niaapi_legacy_metadata_file_download — reads ../models/data_intersight_niaapi_legacy_metadata_file_download.yml
locals { m897 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_legacy_metadata_file_download.yml"))["data_intersight_niaapi_legacy_metadata_file_download"] }

data "intersight_niaapi_legacy_metadata_file_download" "n897" {
  account_moid = try(local.m897["account_moid"], null)
  additional_properties = try(local.m897["additional_properties"], null)
  class_id = try(local.m897["class_id"], null)
  create_time = try(local.m897["create_time"], null)
  domain_group_moid = try(local.m897["domain_group_moid"], null)
  file_name = try(local.m897["file_name"], null)
  id = try(local.m897["id"], null)
  mod_time = try(local.m897["mod_time"], null)
  moid = try(local.m897["moid"], null)
  object_type = try(local.m897["object_type"], null)
  owners = try(local.m897["owners"], null)
  results = try(local.m897["results"], null)
  shared_scope = try(local.m897["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m897["ancestors"], null) == null ? [] : local.m897["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m897["parent"], null) == null ? [] : local.m897["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m897["permission_resources"], null) == null ? [] : local.m897["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m897["tags"], null) == null ? [] : local.m897["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m897["version_context"], null) == null ? [] : local.m897["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
