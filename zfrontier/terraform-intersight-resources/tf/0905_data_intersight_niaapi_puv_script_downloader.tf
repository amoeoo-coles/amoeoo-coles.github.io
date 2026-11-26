# Sample data source intersight_niaapi_puv_script_downloader — reads ../models/data_intersight_niaapi_puv_script_downloader.yml
locals { m905 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_puv_script_downloader.yml"))["data_intersight_niaapi_puv_script_downloader"] }

data "intersight_niaapi_puv_script_downloader" "n905" {
  account_moid = try(local.m905["account_moid"], null)
  additional_properties = try(local.m905["additional_properties"], null)
  class_id = try(local.m905["class_id"], null)
  create_time = try(local.m905["create_time"], null)
  domain_group_moid = try(local.m905["domain_group_moid"], null)
  file_name = try(local.m905["file_name"], null)
  id = try(local.m905["id"], null)
  mod_time = try(local.m905["mod_time"], null)
  moid = try(local.m905["moid"], null)
  object_type = try(local.m905["object_type"], null)
  owners = try(local.m905["owners"], null)
  presigned_url = try(local.m905["presigned_url"], null)
  results = try(local.m905["results"], null)
  shared_scope = try(local.m905["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m905["ancestors"], null) == null ? [] : local.m905["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m905["parent"], null) == null ? [] : local.m905["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m905["permission_resources"], null) == null ? [] : local.m905["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m905["tags"], null) == null ? [] : local.m905["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m905["version_context"], null) == null ? [] : local.m905["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
