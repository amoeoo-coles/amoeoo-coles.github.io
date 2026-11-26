# Sample data source intersight_niatelemetry_apic_dbgexp_rs_ts_scheduler — reads ../models/data_intersight_niatelemetry_apic_dbgexp_rs_ts_scheduler.yml
locals { m917 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_dbgexp_rs_ts_scheduler.yml"))["data_intersight_niatelemetry_apic_dbgexp_rs_ts_scheduler"] }

data "intersight_niatelemetry_apic_dbgexp_rs_ts_scheduler" "n917" {
  account_moid = try(local.m917["account_moid"], null)
  additional_properties = try(local.m917["additional_properties"], null)
  class_id = try(local.m917["class_id"], null)
  create_time = try(local.m917["create_time"], null)
  dn = try(local.m917["dn"], null)
  domain_group_moid = try(local.m917["domain_group_moid"], null)
  id = try(local.m917["id"], null)
  mod_time = try(local.m917["mod_time"], null)
  moid = try(local.m917["moid"], null)
  object_type = try(local.m917["object_type"], null)
  owners = try(local.m917["owners"], null)
  record_type = try(local.m917["record_type"], null)
  record_version = try(local.m917["record_version"], null)
  results = try(local.m917["results"], null)
  shared_scope = try(local.m917["shared_scope"], null)
  site_name = try(local.m917["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m917["ancestors"], null) == null ? [] : local.m917["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m917["parent"], null) == null ? [] : local.m917["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m917["permission_resources"], null) == null ? [] : local.m917["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m917["registered_device"], null) == null ? [] : local.m917["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m917["tags"], null) == null ? [] : local.m917["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m917["version_context"], null) == null ? [] : local.m917["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
