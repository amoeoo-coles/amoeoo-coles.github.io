# Sample data source intersight_niatelemetry_apic_dbgexp_rs_export_dest — reads ../models/data_intersight_niatelemetry_apic_dbgexp_rs_export_dest.yml
locals { m916 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_dbgexp_rs_export_dest.yml"))["data_intersight_niatelemetry_apic_dbgexp_rs_export_dest"] }

data "intersight_niatelemetry_apic_dbgexp_rs_export_dest" "n916" {
  account_moid = try(local.m916["account_moid"], null)
  additional_properties = try(local.m916["additional_properties"], null)
  class_id = try(local.m916["class_id"], null)
  create_time = try(local.m916["create_time"], null)
  dn = try(local.m916["dn"], null)
  domain_group_moid = try(local.m916["domain_group_moid"], null)
  id = try(local.m916["id"], null)
  mod_time = try(local.m916["mod_time"], null)
  moid = try(local.m916["moid"], null)
  object_type = try(local.m916["object_type"], null)
  owners = try(local.m916["owners"], null)
  record_type = try(local.m916["record_type"], null)
  record_version = try(local.m916["record_version"], null)
  results = try(local.m916["results"], null)
  shared_scope = try(local.m916["shared_scope"], null)
  site_name = try(local.m916["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m916["ancestors"], null) == null ? [] : local.m916["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m916["parent"], null) == null ? [] : local.m916["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m916["permission_resources"], null) == null ? [] : local.m916["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m916["registered_device"], null) == null ? [] : local.m916["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m916["tags"], null) == null ? [] : local.m916["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m916["version_context"], null) == null ? [] : local.m916["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
