# Sample data source intersight_niaapi_nd_encrypted_file_download — reads ../models/data_intersight_niaapi_nd_encrypted_file_download.yml
locals { m898 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_nd_encrypted_file_download.yml"))["data_intersight_niaapi_nd_encrypted_file_download"] }

data "intersight_niaapi_nd_encrypted_file_download" "n898" {
  account_moid = try(local.m898["account_moid"], null)
  additional_properties = try(local.m898["additional_properties"], null)
  class_id = try(local.m898["class_id"], null)
  create_time = try(local.m898["create_time"], null)
  domain_group_moid = try(local.m898["domain_group_moid"], null)
  id = try(local.m898["id"], null)
  key = try(var.secrets["data_intersight_niaapi_nd_encrypted_file_download.key"], local.m898["key"])
  mod_time = try(local.m898["mod_time"], null)
  moid = try(local.m898["moid"], null)
  object_type = try(local.m898["object_type"], null)
  owners = try(local.m898["owners"], null)
  results = try(local.m898["results"], null)
  shared_scope = try(local.m898["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m898["ancestors"], null) == null ? [] : local.m898["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m898["parent"], null) == null ? [] : local.m898["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m898["permission_resources"], null) == null ? [] : local.m898["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m898["tags"], null) == null ? [] : local.m898["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m898["version_context"], null) == null ? [] : local.m898["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
