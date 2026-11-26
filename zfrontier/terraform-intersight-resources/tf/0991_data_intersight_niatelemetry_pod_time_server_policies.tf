# Sample data source intersight_niatelemetry_pod_time_server_policies — reads ../models/data_intersight_niatelemetry_pod_time_server_policies.yml
locals { m991 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_pod_time_server_policies.yml"))["data_intersight_niatelemetry_pod_time_server_policies"] }

data "intersight_niatelemetry_pod_time_server_policies" "n991" {
  account_moid = try(local.m991["account_moid"], null)
  additional_properties = try(local.m991["additional_properties"], null)
  class_id = try(local.m991["class_id"], null)
  create_time = try(local.m991["create_time"], null)
  domain_group_moid = try(local.m991["domain_group_moid"], null)
  id = try(local.m991["id"], null)
  mod_time = try(local.m991["mod_time"], null)
  moid = try(local.m991["moid"], null)
  object_type = try(local.m991["object_type"], null)
  owners = try(local.m991["owners"], null)
  pol_dn = try(local.m991["pol_dn"], null)
  record_type = try(local.m991["record_type"], null)
  record_version = try(local.m991["record_version"], null)
  results = try(local.m991["results"], null)
  shared_scope = try(local.m991["shared_scope"], null)
  site_name = try(local.m991["site_name"], null)
  time_server_enable_st = try(local.m991["time_server_enable_st"], null)
  time_servers = try(local.m991["time_servers"], null)
  dynamic "ancestors" {
    for_each = try(local.m991["ancestors"], null) == null ? [] : local.m991["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m991["parent"], null) == null ? [] : local.m991["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m991["permission_resources"], null) == null ? [] : local.m991["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m991["registered_device"], null) == null ? [] : local.m991["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m991["tags"], null) == null ? [] : local.m991["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m991["version_context"], null) == null ? [] : local.m991["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
