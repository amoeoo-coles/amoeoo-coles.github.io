# Sample data source intersight_niatelemetry_apic_snmp_client_grp_details — reads ../models/data_intersight_niatelemetry_apic_snmp_client_grp_details.yml
locals { m926 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_snmp_client_grp_details.yml"))["data_intersight_niatelemetry_apic_snmp_client_grp_details"] }

data "intersight_niatelemetry_apic_snmp_client_grp_details" "n926" {
  account_moid = try(local.m926["account_moid"], null)
  additional_properties = try(local.m926["additional_properties"], null)
  class_id = try(local.m926["class_id"], null)
  create_time = try(local.m926["create_time"], null)
  dn = try(local.m926["dn"], null)
  domain_group_moid = try(local.m926["domain_group_moid"], null)
  id = try(local.m926["id"], null)
  mod_time = try(local.m926["mod_time"], null)
  moid = try(local.m926["moid"], null)
  name = try(local.m926["name"], null)
  object_type = try(local.m926["object_type"], null)
  owners = try(local.m926["owners"], null)
  pol_dn = try(local.m926["pol_dn"], null)
  record_type = try(local.m926["record_type"], null)
  record_version = try(local.m926["record_version"], null)
  restricted_clients = try(local.m926["restricted_clients"], null)
  results = try(local.m926["results"], null)
  shared_scope = try(local.m926["shared_scope"], null)
  site_name = try(local.m926["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m926["ancestors"], null) == null ? [] : local.m926["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m926["parent"], null) == null ? [] : local.m926["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m926["permission_resources"], null) == null ? [] : local.m926["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m926["registered_device"], null) == null ? [] : local.m926["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m926["tags"], null) == null ? [] : local.m926["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m926["version_context"], null) == null ? [] : local.m926["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
