# Sample data source intersight_niaapi_file_downloader — reads ../models/data_intersight_niaapi_file_downloader.yml
locals { m896 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_file_downloader.yml"))["data_intersight_niaapi_file_downloader"] }

data "intersight_niaapi_file_downloader" "n896" {
  account_moid = try(local.m896["account_moid"], null)
  additional_properties = try(local.m896["additional_properties"], null)
  class_id = try(local.m896["class_id"], null)
  create_time = try(local.m896["create_time"], null)
  domain_group_moid = try(local.m896["domain_group_moid"], null)
  file_name = try(local.m896["file_name"], null)
  id = try(local.m896["id"], null)
  mod_time = try(local.m896["mod_time"], null)
  moid = try(local.m896["moid"], null)
  object_type = try(local.m896["object_type"], null)
  owners = try(local.m896["owners"], null)
  presigned_url = try(local.m896["presigned_url"], null)
  results = try(local.m896["results"], null)
  shared_scope = try(local.m896["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m896["ancestors"], null) == null ? [] : local.m896["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m896["parent"], null) == null ? [] : local.m896["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m896["permission_resources"], null) == null ? [] : local.m896["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m896["tags"], null) == null ? [] : local.m896["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m896["version_context"], null) == null ? [] : local.m896["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
