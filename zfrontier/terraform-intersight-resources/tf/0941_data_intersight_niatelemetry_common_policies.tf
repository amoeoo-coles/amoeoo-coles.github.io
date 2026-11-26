# Sample data source intersight_niatelemetry_common_policies — reads ../models/data_intersight_niatelemetry_common_policies.yml
locals { m941 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_common_policies.yml"))["data_intersight_niatelemetry_common_policies"] }

data "intersight_niatelemetry_common_policies" "n941" {
  account_moid = try(local.m941["account_moid"], null)
  additional_properties = try(local.m941["additional_properties"], null)
  class_id = try(local.m941["class_id"], null)
  create_time = try(local.m941["create_time"], null)
  dn = try(local.m941["dn"], null)
  domain_group_moid = try(local.m941["domain_group_moid"], null)
  id = try(local.m941["id"], null)
  mod_time = try(local.m941["mod_time"], null)
  moid = try(local.m941["moid"], null)
  object_type = try(local.m941["object_type"], null)
  owners = try(local.m941["owners"], null)
  record_type = try(local.m941["record_type"], null)
  record_version = try(local.m941["record_version"], null)
  results = try(local.m941["results"], null)
  shared_scope = try(local.m941["shared_scope"], null)
  site_name = try(local.m941["site_name"], null)
  snmp_src = try(local.m941["snmp_src"], null)
  syslog_src = try(local.m941["syslog_src"], null)
  syslog_sys_msg = try(local.m941["syslog_sys_msg"], null)
  dynamic "ancestors" {
    for_each = try(local.m941["ancestors"], null) == null ? [] : local.m941["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m941["parent"], null) == null ? [] : local.m941["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m941["permission_resources"], null) == null ? [] : local.m941["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m941["registered_device"], null) == null ? [] : local.m941["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m941["tags"], null) == null ? [] : local.m941["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m941["version_context"], null) == null ? [] : local.m941["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
