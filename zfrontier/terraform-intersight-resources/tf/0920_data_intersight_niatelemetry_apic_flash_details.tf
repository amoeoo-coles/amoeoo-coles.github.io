# Sample data source intersight_niatelemetry_apic_flash_details — reads ../models/data_intersight_niatelemetry_apic_flash_details.yml
locals { m920 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_flash_details.yml"))["data_intersight_niatelemetry_apic_flash_details"] }

data "intersight_niatelemetry_apic_flash_details" "n920" {
  account_moid = try(local.m920["account_moid"], null)
  additional_properties = try(local.m920["additional_properties"], null)
  class_id = try(local.m920["class_id"], null)
  create_time = try(local.m920["create_time"], null)
  dn = try(local.m920["dn"], null)
  domain_group_moid = try(local.m920["domain_group_moid"], null)
  id = try(local.m920["id"], null)
  mod_time = try(local.m920["mod_time"], null)
  model_number = try(local.m920["model_number"], null)
  moid = try(local.m920["moid"], null)
  object_type = try(local.m920["object_type"], null)
  owners = try(local.m920["owners"], null)
  record_type = try(local.m920["record_type"], null)
  record_version = try(local.m920["record_version"], null)
  results = try(local.m920["results"], null)
  revision = try(local.m920["revision"], null)
  serial_number = try(local.m920["serial_number"], null)
  shared_scope = try(local.m920["shared_scope"], null)
  site_name = try(local.m920["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m920["ancestors"], null) == null ? [] : local.m920["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m920["parent"], null) == null ? [] : local.m920["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m920["permission_resources"], null) == null ? [] : local.m920["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m920["registered_device"], null) == null ? [] : local.m920["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m920["tags"], null) == null ? [] : local.m920["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m920["version_context"], null) == null ? [] : local.m920["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
