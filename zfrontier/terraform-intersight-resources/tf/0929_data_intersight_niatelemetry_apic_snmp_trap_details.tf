# Sample data source intersight_niatelemetry_apic_snmp_trap_details — reads ../models/data_intersight_niatelemetry_apic_snmp_trap_details.yml
locals { m929 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_snmp_trap_details.yml"))["data_intersight_niatelemetry_apic_snmp_trap_details"] }

data "intersight_niatelemetry_apic_snmp_trap_details" "n929" {
  account_moid = try(local.m929["account_moid"], null)
  additional_properties = try(local.m929["additional_properties"], null)
  class_id = try(local.m929["class_id"], null)
  create_time = try(local.m929["create_time"], null)
  dn = try(local.m929["dn"], null)
  domain_group_moid = try(local.m929["domain_group_moid"], null)
  id = try(local.m929["id"], null)
  mod_time = try(local.m929["mod_time"], null)
  moid = try(local.m929["moid"], null)
  object_type = try(local.m929["object_type"], null)
  owners = try(local.m929["owners"], null)
  record_type = try(local.m929["record_type"], null)
  record_version = try(local.m929["record_version"], null)
  results = try(local.m929["results"], null)
  shared_scope = try(local.m929["shared_scope"], null)
  site_name = try(local.m929["site_name"], null)
  v3_sec_level = try(local.m929["v3_sec_level"], null)
  ver = try(local.m929["ver"], null)
  dynamic "ancestors" {
    for_each = try(local.m929["ancestors"], null) == null ? [] : local.m929["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m929["parent"], null) == null ? [] : local.m929["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m929["permission_resources"], null) == null ? [] : local.m929["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m929["registered_device"], null) == null ? [] : local.m929["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m929["tags"], null) == null ? [] : local.m929["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m929["version_context"], null) == null ? [] : local.m929["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
