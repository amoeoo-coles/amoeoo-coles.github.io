# Sample data source intersight_niaapi_nd_metadata_file_downloader — reads ../models/data_intersight_niaapi_nd_metadata_file_downloader.yml
locals { m900 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_nd_metadata_file_downloader.yml"))["data_intersight_niaapi_nd_metadata_file_downloader"] }

data "intersight_niaapi_nd_metadata_file_downloader" "n900" {
  account_moid = try(local.m900["account_moid"], null)
  additional_properties = try(local.m900["additional_properties"], null)
  class_id = try(local.m900["class_id"], null)
  create_time = try(local.m900["create_time"], null)
  domain_group_moid = try(local.m900["domain_group_moid"], null)
  file_name = try(local.m900["file_name"], null)
  id = try(local.m900["id"], null)
  mod_time = try(local.m900["mod_time"], null)
  moid = try(local.m900["moid"], null)
  object_type = try(local.m900["object_type"], null)
  owners = try(local.m900["owners"], null)
  presigned_url = try(local.m900["presigned_url"], null)
  results = try(local.m900["results"], null)
  shared_scope = try(local.m900["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m900["ancestors"], null) == null ? [] : local.m900["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m900["parent"], null) == null ? [] : local.m900["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m900["permission_resources"], null) == null ? [] : local.m900["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m900["tags"], null) == null ? [] : local.m900["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m900["version_context"], null) == null ? [] : local.m900["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
