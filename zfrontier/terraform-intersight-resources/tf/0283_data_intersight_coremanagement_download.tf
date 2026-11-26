# Sample data source intersight_coremanagement_download — reads ../models/data_intersight_coremanagement_download.yml
locals { m283 = yamldecode(file("${path.module}/../models/data_intersight_coremanagement_download.yml"))["data_intersight_coremanagement_download"] }

data "intersight_coremanagement_download" "n283" {
  account_moid = try(local.m283["account_moid"], null)
  additional_properties = try(local.m283["additional_properties"], null)
  class_id = try(local.m283["class_id"], null)
  create_time = try(local.m283["create_time"], null)
  domain_group_moid = try(local.m283["domain_group_moid"], null)
  id = try(local.m283["id"], null)
  mod_time = try(local.m283["mod_time"], null)
  moid = try(local.m283["moid"], null)
  object_type = try(local.m283["object_type"], null)
  owners = try(local.m283["owners"], null)
  results = try(local.m283["results"], null)
  shared_scope = try(local.m283["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m283["ancestors"], null) == null ? [] : local.m283["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "core_file" {
    for_each = try(local.m283["core_file"], null) == null ? [] : local.m283["core_file"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m283["parent"], null) == null ? [] : local.m283["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m283["permission_resources"], null) == null ? [] : local.m283["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m283["tags"], null) == null ? [] : local.m283["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m283["version_context"], null) == null ? [] : local.m283["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
