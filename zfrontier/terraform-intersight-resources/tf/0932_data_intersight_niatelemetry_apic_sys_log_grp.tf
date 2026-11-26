# Sample data source intersight_niatelemetry_apic_sys_log_grp — reads ../models/data_intersight_niatelemetry_apic_sys_log_grp.yml
locals { m932 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_sys_log_grp.yml"))["data_intersight_niatelemetry_apic_sys_log_grp"] }

data "intersight_niatelemetry_apic_sys_log_grp" "n932" {
  account_moid = try(local.m932["account_moid"], null)
  additional_properties = try(local.m932["additional_properties"], null)
  class_id = try(local.m932["class_id"], null)
  create_time = try(local.m932["create_time"], null)
  dn = try(local.m932["dn"], null)
  domain_group_moid = try(local.m932["domain_group_moid"], null)
  id = try(local.m932["id"], null)
  mod_time = try(local.m932["mod_time"], null)
  moid = try(local.m932["moid"], null)
  object_type = try(local.m932["object_type"], null)
  owners = try(local.m932["owners"], null)
  record_type = try(local.m932["record_type"], null)
  record_version = try(local.m932["record_version"], null)
  remote_dest_count = try(local.m932["remote_dest_count"], null)
  results = try(local.m932["results"], null)
  shared_scope = try(local.m932["shared_scope"], null)
  site_name = try(local.m932["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m932["ancestors"], null) == null ? [] : local.m932["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m932["parent"], null) == null ? [] : local.m932["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m932["permission_resources"], null) == null ? [] : local.m932["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m932["registered_device"], null) == null ? [] : local.m932["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m932["tags"], null) == null ? [] : local.m932["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m932["version_context"], null) == null ? [] : local.m932["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
