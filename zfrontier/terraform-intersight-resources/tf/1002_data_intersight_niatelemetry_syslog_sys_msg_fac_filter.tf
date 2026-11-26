# Sample data source intersight_niatelemetry_syslog_sys_msg_fac_filter — reads ../models/data_intersight_niatelemetry_syslog_sys_msg_fac_filter.yml
locals { m1002 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_syslog_sys_msg_fac_filter.yml"))["data_intersight_niatelemetry_syslog_sys_msg_fac_filter"] }

data "intersight_niatelemetry_syslog_sys_msg_fac_filter" "n1002" {
  account_moid = try(local.m1002["account_moid"], null)
  additional_properties = try(local.m1002["additional_properties"], null)
  class_id = try(local.m1002["class_id"], null)
  common_policy = try(local.m1002["common_policy"], null)
  create_time = try(local.m1002["create_time"], null)
  dn = try(local.m1002["dn"], null)
  domain_group_moid = try(local.m1002["domain_group_moid"], null)
  facility = try(local.m1002["facility"], null)
  id = try(local.m1002["id"], null)
  min_sev = try(local.m1002["min_sev"], null)
  mod_time = try(local.m1002["mod_time"], null)
  moid = try(local.m1002["moid"], null)
  object_type = try(local.m1002["object_type"], null)
  owners = try(local.m1002["owners"], null)
  record_type = try(local.m1002["record_type"], null)
  record_version = try(local.m1002["record_version"], null)
  results = try(local.m1002["results"], null)
  shared_scope = try(local.m1002["shared_scope"], null)
  site_name = try(local.m1002["site_name"], null)
  syslog_sys_msg = try(local.m1002["syslog_sys_msg"], null)
  dynamic "ancestors" {
    for_each = try(local.m1002["ancestors"], null) == null ? [] : local.m1002["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1002["parent"], null) == null ? [] : local.m1002["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1002["permission_resources"], null) == null ? [] : local.m1002["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1002["registered_device"], null) == null ? [] : local.m1002["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1002["tags"], null) == null ? [] : local.m1002["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1002["version_context"], null) == null ? [] : local.m1002["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
