# Sample data source intersight_niatelemetry_syslog_remote_dest — reads ../models/data_intersight_niatelemetry_syslog_remote_dest.yml
locals { m1000 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_syslog_remote_dest.yml"))["data_intersight_niatelemetry_syslog_remote_dest"] }

data "intersight_niatelemetry_syslog_remote_dest" "n1000" {
  account_moid = try(local.m1000["account_moid"], null)
  additional_properties = try(local.m1000["additional_properties"], null)
  admin_state = try(local.m1000["admin_state"], null)
  class_id = try(local.m1000["class_id"], null)
  common_policy = try(local.m1000["common_policy"], null)
  create_time = try(local.m1000["create_time"], null)
  dn = try(local.m1000["dn"], null)
  domain_group_moid = try(local.m1000["domain_group_moid"], null)
  host = try(local.m1000["host"], null)
  id = try(local.m1000["id"], null)
  mod_time = try(local.m1000["mod_time"], null)
  moid = try(local.m1000["moid"], null)
  object_type = try(local.m1000["object_type"], null)
  owners = try(local.m1000["owners"], null)
  record_type = try(local.m1000["record_type"], null)
  record_version = try(local.m1000["record_version"], null)
  results = try(local.m1000["results"], null)
  shared_scope = try(local.m1000["shared_scope"], null)
  site_name = try(local.m1000["site_name"], null)
  syslog_rs_dest_grp = try(local.m1000["syslog_rs_dest_grp"], null)
  syslog_src = try(local.m1000["syslog_src"], null)
  dynamic "ancestors" {
    for_each = try(local.m1000["ancestors"], null) == null ? [] : local.m1000["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1000["parent"], null) == null ? [] : local.m1000["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1000["permission_resources"], null) == null ? [] : local.m1000["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1000["registered_device"], null) == null ? [] : local.m1000["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1000["tags"], null) == null ? [] : local.m1000["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1000["version_context"], null) == null ? [] : local.m1000["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
