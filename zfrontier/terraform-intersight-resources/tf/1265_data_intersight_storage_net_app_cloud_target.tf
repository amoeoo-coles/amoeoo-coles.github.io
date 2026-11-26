# Sample data source intersight_storage_net_app_cloud_target — reads ../models/data_intersight_storage_net_app_cloud_target.yml
locals { m1265 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_cloud_target.yml"))["data_intersight_storage_net_app_cloud_target"] }

data "intersight_storage_net_app_cloud_target" "n1265" {
  access_key = try(var.secrets["data_intersight_storage_net_app_cloud_target.access_key"], local.m1265["access_key"])
  account_moid = try(local.m1265["account_moid"], null)
  additional_properties = try(local.m1265["additional_properties"], null)
  authentication_type = try(local.m1265["authentication_type"], null)
  azure_account = try(local.m1265["azure_account"], null)
  cap_url = try(local.m1265["cap_url"], null)
  certificate_validation_enabled = try(local.m1265["certificate_validation_enabled"], null)
  class_id = try(local.m1265["class_id"], null)
  cloud_storage = try(local.m1265["cloud_storage"], null)
  container = try(local.m1265["container"], null)
  create_time = try(local.m1265["create_time"], null)
  domain_group_moid = try(local.m1265["domain_group_moid"], null)
  id = try(local.m1265["id"], null)
  ipspace = try(local.m1265["ipspace"], null)
  mod_time = try(local.m1265["mod_time"], null)
  moid = try(local.m1265["moid"], null)
  name = try(local.m1265["name"], null)
  object_type = try(local.m1265["object_type"], null)
  owner = try(local.m1265["owner"], null)
  owners = try(local.m1265["owners"], null)
  port = try(local.m1265["port"], null)
  provider_type = try(local.m1265["provider_type"], null)
  results = try(local.m1265["results"], null)
  server = try(local.m1265["server"], null)
  shared_scope = try(local.m1265["shared_scope"], null)
  snap_mirror_use = try(local.m1265["snap_mirror_use"], null)
  ssl_enabled = try(local.m1265["ssl_enabled"], null)
  used = try(local.m1265["used"], null)
  uuid = try(local.m1265["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1265["ancestors"], null) == null ? [] : local.m1265["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1265["array"], null) == null ? [] : local.m1265["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1265["parent"], null) == null ? [] : local.m1265["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1265["permission_resources"], null) == null ? [] : local.m1265["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1265["tags"], null) == null ? [] : local.m1265["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1265["version_context"], null) == null ? [] : local.m1265["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
