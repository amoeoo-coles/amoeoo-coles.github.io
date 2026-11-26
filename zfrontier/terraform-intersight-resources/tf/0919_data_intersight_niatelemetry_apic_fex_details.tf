# Sample data source intersight_niatelemetry_apic_fex_details — reads ../models/data_intersight_niatelemetry_apic_fex_details.yml
locals { m919 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_fex_details.yml"))["data_intersight_niatelemetry_apic_fex_details"] }

data "intersight_niatelemetry_apic_fex_details" "n919" {
  account_moid = try(local.m919["account_moid"], null)
  additional_properties = try(local.m919["additional_properties"], null)
  class_id = try(local.m919["class_id"], null)
  create_time = try(local.m919["create_time"], null)
  dn = try(local.m919["dn"], null)
  domain_group_moid = try(local.m919["domain_group_moid"], null)
  id = try(local.m919["id"], null)
  mod_time = try(local.m919["mod_time"], null)
  model_number = try(local.m919["model_number"], null)
  moid = try(local.m919["moid"], null)
  node_id = try(local.m919["node_id"], null)
  object_type = try(local.m919["object_type"], null)
  owners = try(local.m919["owners"], null)
  record_type = try(local.m919["record_type"], null)
  record_version = try(local.m919["record_version"], null)
  results = try(local.m919["results"], null)
  serial_number = try(local.m919["serial_number"], null)
  shared_scope = try(local.m919["shared_scope"], null)
  site_name = try(local.m919["site_name"], null)
  vendor_name = try(local.m919["vendor_name"], null)
  vid = try(local.m919["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m919["ancestors"], null) == null ? [] : local.m919["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m919["parent"], null) == null ? [] : local.m919["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m919["permission_resources"], null) == null ? [] : local.m919["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m919["registered_device"], null) == null ? [] : local.m919["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m919["tags"], null) == null ? [] : local.m919["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m919["version_context"], null) == null ? [] : local.m919["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
