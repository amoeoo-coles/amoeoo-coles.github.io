# Sample data source intersight_niatelemetry_apic_snmp_community_access_details — reads ../models/data_intersight_niatelemetry_apic_snmp_community_access_details.yml
locals { m927 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_snmp_community_access_details.yml"))["data_intersight_niatelemetry_apic_snmp_community_access_details"] }

data "intersight_niatelemetry_apic_snmp_community_access_details" "n927" {
  account_moid = try(local.m927["account_moid"], null)
  additional_properties = try(local.m927["additional_properties"], null)
  addr = try(local.m927["addr"], null)
  class_id = try(local.m927["class_id"], null)
  create_time = try(local.m927["create_time"], null)
  dn = try(local.m927["dn"], null)
  domain_group_moid = try(local.m927["domain_group_moid"], null)
  id = try(local.m927["id"], null)
  mod_time = try(local.m927["mod_time"], null)
  moid = try(local.m927["moid"], null)
  object_type = try(local.m927["object_type"], null)
  owners = try(local.m927["owners"], null)
  record_type = try(local.m927["record_type"], null)
  record_version = try(local.m927["record_version"], null)
  results = try(local.m927["results"], null)
  shared_scope = try(local.m927["shared_scope"], null)
  site_name = try(local.m927["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m927["ancestors"], null) == null ? [] : local.m927["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m927["parent"], null) == null ? [] : local.m927["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m927["permission_resources"], null) == null ? [] : local.m927["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m927["registered_device"], null) == null ? [] : local.m927["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m927["tags"], null) == null ? [] : local.m927["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m927["version_context"], null) == null ? [] : local.m927["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
