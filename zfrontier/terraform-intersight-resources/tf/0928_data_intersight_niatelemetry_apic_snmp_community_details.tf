# Sample data source intersight_niatelemetry_apic_snmp_community_details — reads ../models/data_intersight_niatelemetry_apic_snmp_community_details.yml
locals { m928 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_snmp_community_details.yml"))["data_intersight_niatelemetry_apic_snmp_community_details"] }

data "intersight_niatelemetry_apic_snmp_community_details" "n928" {
  account_moid = try(local.m928["account_moid"], null)
  additional_properties = try(local.m928["additional_properties"], null)
  class_id = try(local.m928["class_id"], null)
  create_time = try(local.m928["create_time"], null)
  dn = try(local.m928["dn"], null)
  domain_group_moid = try(local.m928["domain_group_moid"], null)
  id = try(local.m928["id"], null)
  mod_time = try(local.m928["mod_time"], null)
  moid = try(local.m928["moid"], null)
  name = try(local.m928["name"], null)
  object_type = try(local.m928["object_type"], null)
  owners = try(local.m928["owners"], null)
  record_type = try(local.m928["record_type"], null)
  record_version = try(local.m928["record_version"], null)
  results = try(local.m928["results"], null)
  shared_scope = try(local.m928["shared_scope"], null)
  site_name = try(local.m928["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m928["ancestors"], null) == null ? [] : local.m928["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m928["parent"], null) == null ? [] : local.m928["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m928["permission_resources"], null) == null ? [] : local.m928["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m928["registered_device"], null) == null ? [] : local.m928["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m928["tags"], null) == null ? [] : local.m928["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m928["version_context"], null) == null ? [] : local.m928["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
