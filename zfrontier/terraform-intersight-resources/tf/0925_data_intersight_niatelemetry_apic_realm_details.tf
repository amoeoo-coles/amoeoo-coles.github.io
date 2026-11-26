# Sample data source intersight_niatelemetry_apic_realm_details — reads ../models/data_intersight_niatelemetry_apic_realm_details.yml
locals { m925 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_realm_details.yml"))["data_intersight_niatelemetry_apic_realm_details"] }

data "intersight_niatelemetry_apic_realm_details" "n925" {
  account_moid = try(local.m925["account_moid"], null)
  additional_properties = try(local.m925["additional_properties"], null)
  class_id = try(local.m925["class_id"], null)
  create_time = try(local.m925["create_time"], null)
  dn = try(local.m925["dn"], null)
  domain_group_moid = try(local.m925["domain_group_moid"], null)
  id = try(local.m925["id"], null)
  mod_time = try(local.m925["mod_time"], null)
  moid = try(local.m925["moid"], null)
  object_type = try(local.m925["object_type"], null)
  owners = try(local.m925["owners"], null)
  realm = try(local.m925["realm"], null)
  record_type = try(local.m925["record_type"], null)
  record_version = try(local.m925["record_version"], null)
  results = try(local.m925["results"], null)
  shared_scope = try(local.m925["shared_scope"], null)
  site_name = try(local.m925["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m925["ancestors"], null) == null ? [] : local.m925["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m925["parent"], null) == null ? [] : local.m925["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m925["permission_resources"], null) == null ? [] : local.m925["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m925["registered_device"], null) == null ? [] : local.m925["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m925["tags"], null) == null ? [] : local.m925["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m925["version_context"], null) == null ? [] : local.m925["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
