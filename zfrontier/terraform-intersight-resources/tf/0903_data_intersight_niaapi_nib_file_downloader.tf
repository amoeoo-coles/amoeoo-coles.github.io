# Sample data source intersight_niaapi_nib_file_downloader — reads ../models/data_intersight_niaapi_nib_file_downloader.yml
locals { m903 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_nib_file_downloader.yml"))["data_intersight_niaapi_nib_file_downloader"] }

data "intersight_niaapi_nib_file_downloader" "n903" {
  account_moid = try(local.m903["account_moid"], null)
  additional_properties = try(local.m903["additional_properties"], null)
  class_id = try(local.m903["class_id"], null)
  create_time = try(local.m903["create_time"], null)
  domain_group_moid = try(local.m903["domain_group_moid"], null)
  file_name = try(local.m903["file_name"], null)
  id = try(local.m903["id"], null)
  mod_time = try(local.m903["mod_time"], null)
  moid = try(local.m903["moid"], null)
  object_type = try(local.m903["object_type"], null)
  owners = try(local.m903["owners"], null)
  presigned_url = try(local.m903["presigned_url"], null)
  results = try(local.m903["results"], null)
  shared_scope = try(local.m903["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m903["ancestors"], null) == null ? [] : local.m903["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m903["parent"], null) == null ? [] : local.m903["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m903["permission_resources"], null) == null ? [] : local.m903["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m903["tags"], null) == null ? [] : local.m903["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m903["version_context"], null) == null ? [] : local.m903["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
