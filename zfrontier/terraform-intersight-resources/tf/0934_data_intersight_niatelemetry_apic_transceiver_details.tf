# Sample data source intersight_niatelemetry_apic_transceiver_details — reads ../models/data_intersight_niatelemetry_apic_transceiver_details.yml
locals { m934 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_transceiver_details.yml"))["data_intersight_niatelemetry_apic_transceiver_details"] }

data "intersight_niatelemetry_apic_transceiver_details" "n934" {
  account_moid = try(local.m934["account_moid"], null)
  additional_properties = try(local.m934["additional_properties"], null)
  class_id = try(local.m934["class_id"], null)
  create_time = try(local.m934["create_time"], null)
  dn = try(local.m934["dn"], null)
  domain_group_moid = try(local.m934["domain_group_moid"], null)
  id = try(local.m934["id"], null)
  mod_time = try(local.m934["mod_time"], null)
  model = try(local.m934["model"], null)
  moid = try(local.m934["moid"], null)
  object_type = try(local.m934["object_type"], null)
  owners = try(local.m934["owners"], null)
  part_number = try(local.m934["part_number"], null)
  record_type = try(local.m934["record_type"], null)
  record_version = try(local.m934["record_version"], null)
  results = try(local.m934["results"], null)
  serial_number = try(local.m934["serial_number"], null)
  shared_scope = try(local.m934["shared_scope"], null)
  site_name = try(local.m934["site_name"], null)
  vendor = try(local.m934["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m934["ancestors"], null) == null ? [] : local.m934["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m934["parent"], null) == null ? [] : local.m934["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m934["permission_resources"], null) == null ? [] : local.m934["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m934["registered_device"], null) == null ? [] : local.m934["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m934["tags"], null) == null ? [] : local.m934["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m934["version_context"], null) == null ? [] : local.m934["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
