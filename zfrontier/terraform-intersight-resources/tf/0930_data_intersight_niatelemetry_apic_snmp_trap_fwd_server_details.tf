# Sample data source intersight_niatelemetry_apic_snmp_trap_fwd_server_details — reads ../models/data_intersight_niatelemetry_apic_snmp_trap_fwd_server_details.yml
locals { m930 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_snmp_trap_fwd_server_details.yml"))["data_intersight_niatelemetry_apic_snmp_trap_fwd_server_details"] }

data "intersight_niatelemetry_apic_snmp_trap_fwd_server_details" "n930" {
  account_moid = try(local.m930["account_moid"], null)
  additional_properties = try(local.m930["additional_properties"], null)
  address = try(local.m930["address"], null)
  class_id = try(local.m930["class_id"], null)
  create_time = try(local.m930["create_time"], null)
  dn = try(local.m930["dn"], null)
  domain_group_moid = try(local.m930["domain_group_moid"], null)
  id = try(local.m930["id"], null)
  mod_time = try(local.m930["mod_time"], null)
  moid = try(local.m930["moid"], null)
  object_type = try(local.m930["object_type"], null)
  owners = try(local.m930["owners"], null)
  pol_dn = try(local.m930["pol_dn"], null)
  record_type = try(local.m930["record_type"], null)
  record_version = try(local.m930["record_version"], null)
  results = try(local.m930["results"], null)
  shared_scope = try(local.m930["shared_scope"], null)
  site_name = try(local.m930["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m930["ancestors"], null) == null ? [] : local.m930["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m930["parent"], null) == null ? [] : local.m930["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m930["permission_resources"], null) == null ? [] : local.m930["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m930["registered_device"], null) == null ? [] : local.m930["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m930["tags"], null) == null ? [] : local.m930["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m930["version_context"], null) == null ? [] : local.m930["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
