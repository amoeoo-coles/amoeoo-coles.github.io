# Sample data source intersight_appliance_file_gateway — reads ../models/data_intersight_appliance_file_gateway.yml
locals { m054 = yamldecode(file("${path.module}/../models/data_intersight_appliance_file_gateway.yml"))["data_intersight_appliance_file_gateway"] }

data "intersight_appliance_file_gateway" "n054" {
  account_moid = try(local.m054["account_moid"], null)
  additional_properties = try(local.m054["additional_properties"], null)
  bucket_name = try(local.m054["bucket_name"], null)
  class_id = try(local.m054["class_id"], null)
  create_time = try(local.m054["create_time"], null)
  domain_group_moid = try(local.m054["domain_group_moid"], null)
  external_host = try(local.m054["external_host"], null)
  file_size = try(local.m054["file_size"], null)
  file_time = try(local.m054["file_time"], null)
  file_type = try(local.m054["file_type"], null)
  filename = try(local.m054["filename"], null)
  id = try(local.m054["id"], null)
  mod_time = try(local.m054["mod_time"], null)
  moid = try(local.m054["moid"], null)
  nr_version = try(local.m054["nr_version"], null)
  object_type = try(local.m054["object_type"], null)
  owners = try(local.m054["owners"], null)
  presigned_url = try(local.m054["presigned_url"], null)
  results = try(local.m054["results"], null)
  server_cert = try(local.m054["server_cert"], null)
  shared_scope = try(local.m054["shared_scope"], null)
  validity_period = try(local.m054["validity_period"], null)
  dynamic "account" {
    for_each = try(local.m054["account"], null) == null ? [] : local.m054["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m054["ancestors"], null) == null ? [] : local.m054["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m054["parent"], null) == null ? [] : local.m054["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m054["permission_resources"], null) == null ? [] : local.m054["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m054["tags"], null) == null ? [] : local.m054["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m054["version_context"], null) == null ? [] : local.m054["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
