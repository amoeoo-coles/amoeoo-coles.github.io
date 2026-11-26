# Sample data source intersight_niatelemetry_apic_ntp_auth — reads ../models/data_intersight_niatelemetry_apic_ntp_auth.yml
locals { m921 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_ntp_auth.yml"))["data_intersight_niatelemetry_apic_ntp_auth"] }

data "intersight_niatelemetry_apic_ntp_auth" "n921" {
  account_moid = try(local.m921["account_moid"], null)
  additional_properties = try(local.m921["additional_properties"], null)
  auth_st = try(local.m921["auth_st"], null)
  class_id = try(local.m921["class_id"], null)
  create_time = try(local.m921["create_time"], null)
  dn = try(local.m921["dn"], null)
  domain_group_moid = try(local.m921["domain_group_moid"], null)
  id = try(local.m921["id"], null)
  mod_time = try(local.m921["mod_time"], null)
  moid = try(local.m921["moid"], null)
  object_type = try(local.m921["object_type"], null)
  owners = try(local.m921["owners"], null)
  record_type = try(local.m921["record_type"], null)
  record_version = try(local.m921["record_version"], null)
  results = try(local.m921["results"], null)
  shared_scope = try(local.m921["shared_scope"], null)
  site_name = try(local.m921["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m921["ancestors"], null) == null ? [] : local.m921["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m921["parent"], null) == null ? [] : local.m921["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m921["permission_resources"], null) == null ? [] : local.m921["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m921["registered_device"], null) == null ? [] : local.m921["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m921["tags"], null) == null ? [] : local.m921["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m921["version_context"], null) == null ? [] : local.m921["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
