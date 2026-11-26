# Sample data source intersight_niatelemetry_syslog_sys_msg — reads ../models/data_intersight_niatelemetry_syslog_sys_msg.yml
locals { m1001 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_syslog_sys_msg.yml"))["data_intersight_niatelemetry_syslog_sys_msg"] }

data "intersight_niatelemetry_syslog_sys_msg" "n1001" {
  account_moid = try(local.m1001["account_moid"], null)
  additional_properties = try(local.m1001["additional_properties"], null)
  class_id = try(local.m1001["class_id"], null)
  common_policy = try(local.m1001["common_policy"], null)
  create_time = try(local.m1001["create_time"], null)
  dn = try(local.m1001["dn"], null)
  domain_group_moid = try(local.m1001["domain_group_moid"], null)
  facility_filter = try(local.m1001["facility_filter"], null)
  id = try(local.m1001["id"], null)
  mod_time = try(local.m1001["mod_time"], null)
  moid = try(local.m1001["moid"], null)
  object_type = try(local.m1001["object_type"], null)
  owners = try(local.m1001["owners"], null)
  record_type = try(local.m1001["record_type"], null)
  record_version = try(local.m1001["record_version"], null)
  results = try(local.m1001["results"], null)
  shared_scope = try(local.m1001["shared_scope"], null)
  site_name = try(local.m1001["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1001["ancestors"], null) == null ? [] : local.m1001["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1001["parent"], null) == null ? [] : local.m1001["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1001["permission_resources"], null) == null ? [] : local.m1001["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1001["registered_device"], null) == null ? [] : local.m1001["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1001["tags"], null) == null ? [] : local.m1001["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1001["version_context"], null) == null ? [] : local.m1001["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
