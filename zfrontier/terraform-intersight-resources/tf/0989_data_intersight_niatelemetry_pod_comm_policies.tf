# Sample data source intersight_niatelemetry_pod_comm_policies — reads ../models/data_intersight_niatelemetry_pod_comm_policies.yml
locals { m989 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_pod_comm_policies.yml"))["data_intersight_niatelemetry_pod_comm_policies"] }

data "intersight_niatelemetry_pod_comm_policies" "n989" {
  account_moid = try(local.m989["account_moid"], null)
  additional_properties = try(local.m989["additional_properties"], null)
  class_id = try(local.m989["class_id"], null)
  comm_http_admin_st = try(local.m989["comm_http_admin_st"], null)
  comm_https_admin_st = try(local.m989["comm_https_admin_st"], null)
  comm_ssh_admin_st = try(local.m989["comm_ssh_admin_st"], null)
  comm_telnet_admin_st = try(local.m989["comm_telnet_admin_st"], null)
  create_time = try(local.m989["create_time"], null)
  domain_group_moid = try(local.m989["domain_group_moid"], null)
  id = try(local.m989["id"], null)
  mod_time = try(local.m989["mod_time"], null)
  moid = try(local.m989["moid"], null)
  object_type = try(local.m989["object_type"], null)
  owners = try(local.m989["owners"], null)
  pol_dn = try(local.m989["pol_dn"], null)
  record_type = try(local.m989["record_type"], null)
  record_version = try(local.m989["record_version"], null)
  results = try(local.m989["results"], null)
  shared_scope = try(local.m989["shared_scope"], null)
  site_name = try(local.m989["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m989["ancestors"], null) == null ? [] : local.m989["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m989["parent"], null) == null ? [] : local.m989["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m989["permission_resources"], null) == null ? [] : local.m989["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m989["registered_device"], null) == null ? [] : local.m989["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m989["tags"], null) == null ? [] : local.m989["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m989["version_context"], null) == null ? [] : local.m989["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
