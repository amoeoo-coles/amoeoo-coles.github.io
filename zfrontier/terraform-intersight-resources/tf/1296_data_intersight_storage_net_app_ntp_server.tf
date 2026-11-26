# Sample data source intersight_storage_net_app_ntp_server — reads ../models/data_intersight_storage_net_app_ntp_server.yml
locals { m1296 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_ntp_server.yml"))["data_intersight_storage_net_app_ntp_server"] }

data "intersight_storage_net_app_ntp_server" "n1296" {
  account_moid = try(local.m1296["account_moid"], null)
  additional_properties = try(local.m1296["additional_properties"], null)
  authentication_enabled = try(local.m1296["authentication_enabled"], null)
  authentication_key_id = try(local.m1296["authentication_key_id"], null)
  class_id = try(local.m1296["class_id"], null)
  cluster_uuid = try(local.m1296["cluster_uuid"], null)
  create_time = try(local.m1296["create_time"], null)
  domain_group_moid = try(local.m1296["domain_group_moid"], null)
  id = try(local.m1296["id"], null)
  is_authentication_enabled = try(local.m1296["is_authentication_enabled"], null)
  mod_time = try(local.m1296["mod_time"], null)
  moid = try(local.m1296["moid"], null)
  nr_version = try(local.m1296["nr_version"], null)
  object_type = try(local.m1296["object_type"], null)
  owners = try(local.m1296["owners"], null)
  results = try(local.m1296["results"], null)
  server = try(local.m1296["server"], null)
  shared_scope = try(local.m1296["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1296["ancestors"], null) == null ? [] : local.m1296["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1296["array"], null) == null ? [] : local.m1296["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1296["parent"], null) == null ? [] : local.m1296["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1296["permission_resources"], null) == null ? [] : local.m1296["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1296["tags"], null) == null ? [] : local.m1296["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1296["version_context"], null) == null ? [] : local.m1296["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
