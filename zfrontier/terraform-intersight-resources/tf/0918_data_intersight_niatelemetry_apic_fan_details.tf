# Sample data source intersight_niatelemetry_apic_fan_details — reads ../models/data_intersight_niatelemetry_apic_fan_details.yml
locals { m918 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_fan_details.yml"))["data_intersight_niatelemetry_apic_fan_details"] }

data "intersight_niatelemetry_apic_fan_details" "n918" {
  account_moid = try(local.m918["account_moid"], null)
  additional_properties = try(local.m918["additional_properties"], null)
  class_id = try(local.m918["class_id"], null)
  create_time = try(local.m918["create_time"], null)
  dn = try(local.m918["dn"], null)
  domain_group_moid = try(local.m918["domain_group_moid"], null)
  id = try(local.m918["id"], null)
  mod_time = try(local.m918["mod_time"], null)
  model_number = try(local.m918["model_number"], null)
  moid = try(local.m918["moid"], null)
  node_id = try(local.m918["node_id"], null)
  object_type = try(local.m918["object_type"], null)
  owners = try(local.m918["owners"], null)
  record_type = try(local.m918["record_type"], null)
  record_version = try(local.m918["record_version"], null)
  results = try(local.m918["results"], null)
  serial_number = try(local.m918["serial_number"], null)
  shared_scope = try(local.m918["shared_scope"], null)
  site_name = try(local.m918["site_name"], null)
  vendor_name = try(local.m918["vendor_name"], null)
  vid = try(local.m918["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m918["ancestors"], null) == null ? [] : local.m918["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m918["parent"], null) == null ? [] : local.m918["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m918["permission_resources"], null) == null ? [] : local.m918["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m918["registered_device"], null) == null ? [] : local.m918["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m918["tags"], null) == null ? [] : local.m918["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m918["version_context"], null) == null ? [] : local.m918["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
