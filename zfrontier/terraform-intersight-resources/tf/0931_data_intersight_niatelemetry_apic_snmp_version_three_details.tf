# Sample data source intersight_niatelemetry_apic_snmp_version_three_details — reads ../models/data_intersight_niatelemetry_apic_snmp_version_three_details.yml
locals { m931 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_snmp_version_three_details.yml"))["data_intersight_niatelemetry_apic_snmp_version_three_details"] }

data "intersight_niatelemetry_apic_snmp_version_three_details" "n931" {
  account_moid = try(local.m931["account_moid"], null)
  additional_properties = try(local.m931["additional_properties"], null)
  auth_type = try(local.m931["auth_type"], null)
  class_id = try(local.m931["class_id"], null)
  create_time = try(local.m931["create_time"], null)
  dn = try(local.m931["dn"], null)
  domain_group_moid = try(local.m931["domain_group_moid"], null)
  id = try(local.m931["id"], null)
  mod_time = try(local.m931["mod_time"], null)
  moid = try(local.m931["moid"], null)
  name = try(local.m931["name"], null)
  object_type = try(local.m931["object_type"], null)
  owners = try(local.m931["owners"], null)
  priv_type = try(local.m931["priv_type"], null)
  record_type = try(local.m931["record_type"], null)
  record_version = try(local.m931["record_version"], null)
  results = try(local.m931["results"], null)
  shared_scope = try(local.m931["shared_scope"], null)
  site_name = try(local.m931["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m931["ancestors"], null) == null ? [] : local.m931["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m931["parent"], null) == null ? [] : local.m931["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m931["permission_resources"], null) == null ? [] : local.m931["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m931["registered_device"], null) == null ? [] : local.m931["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m931["tags"], null) == null ? [] : local.m931["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m931["version_context"], null) == null ? [] : local.m931["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
