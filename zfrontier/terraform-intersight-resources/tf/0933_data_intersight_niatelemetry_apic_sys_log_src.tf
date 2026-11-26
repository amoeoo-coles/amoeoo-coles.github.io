# Sample data source intersight_niatelemetry_apic_sys_log_src — reads ../models/data_intersight_niatelemetry_apic_sys_log_src.yml
locals { m933 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_sys_log_src.yml"))["data_intersight_niatelemetry_apic_sys_log_src"] }

data "intersight_niatelemetry_apic_sys_log_src" "n933" {
  account_moid = try(local.m933["account_moid"], null)
  additional_properties = try(local.m933["additional_properties"], null)
  class_id = try(local.m933["class_id"], null)
  create_time = try(local.m933["create_time"], null)
  dn = try(local.m933["dn"], null)
  domain_group_moid = try(local.m933["domain_group_moid"], null)
  id = try(local.m933["id"], null)
  min_sev = try(local.m933["min_sev"], null)
  mod_time = try(local.m933["mod_time"], null)
  moid = try(local.m933["moid"], null)
  object_type = try(local.m933["object_type"], null)
  owners = try(local.m933["owners"], null)
  record_type = try(local.m933["record_type"], null)
  record_version = try(local.m933["record_version"], null)
  results = try(local.m933["results"], null)
  shared_scope = try(local.m933["shared_scope"], null)
  site_name = try(local.m933["site_name"], null)
  syslog_remote_dest = try(local.m933["syslog_remote_dest"], null)
  syslog_rs_dest_grp = try(local.m933["syslog_rs_dest_grp"], null)
  dynamic "ancestors" {
    for_each = try(local.m933["ancestors"], null) == null ? [] : local.m933["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m933["parent"], null) == null ? [] : local.m933["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m933["permission_resources"], null) == null ? [] : local.m933["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m933["registered_device"], null) == null ? [] : local.m933["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m933["tags"], null) == null ? [] : local.m933["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m933["version_context"], null) == null ? [] : local.m933["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
