# Sample data source intersight_softwarerepository_download_spec — reads ../models/data_intersight_softwarerepository_download_spec.yml
locals { m1206 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_download_spec.yml"))["data_intersight_softwarerepository_download_spec"] }

data "intersight_softwarerepository_download_spec" "n1206" {
  account_moid = try(local.m1206["account_moid"], null)
  additional_properties = try(local.m1206["additional_properties"], null)
  auth_token = try(var.secrets["data_intersight_softwarerepository_download_spec.auth_token"], local.m1206["auth_token"])
  cdn_disabled = try(local.m1206["cdn_disabled"], null)
  certificate = try(local.m1206["certificate"], null)
  class_id = try(local.m1206["class_id"], null)
  create_time = try(local.m1206["create_time"], null)
  domain_group_moid = try(local.m1206["domain_group_moid"], null)
  filename = try(local.m1206["filename"], null)
  id = try(local.m1206["id"], null)
  md5sum = try(local.m1206["md5sum"], null)
  mod_time = try(local.m1206["mod_time"], null)
  moid = try(local.m1206["moid"], null)
  object_type = try(local.m1206["object_type"], null)
  owners = try(local.m1206["owners"], null)
  results = try(local.m1206["results"], null)
  shared_scope = try(local.m1206["shared_scope"], null)
  size = try(local.m1206["size"], null)
  url = try(local.m1206["url"], null)
  dynamic "ancestors" {
    for_each = try(local.m1206["ancestors"], null) == null ? [] : local.m1206["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file" {
    for_each = try(local.m1206["file"], null) == null ? [] : local.m1206["file"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1206["parent"], null) == null ? [] : local.m1206["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1206["permission_resources"], null) == null ? [] : local.m1206["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1206["tags"], null) == null ? [] : local.m1206["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1206["version_context"], null) == null ? [] : local.m1206["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
