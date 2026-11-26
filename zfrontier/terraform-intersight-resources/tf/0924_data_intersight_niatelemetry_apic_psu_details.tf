# Sample data source intersight_niatelemetry_apic_psu_details — reads ../models/data_intersight_niatelemetry_apic_psu_details.yml
locals { m924 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_psu_details.yml"))["data_intersight_niatelemetry_apic_psu_details"] }

data "intersight_niatelemetry_apic_psu_details" "n924" {
  account_moid = try(local.m924["account_moid"], null)
  additional_properties = try(local.m924["additional_properties"], null)
  class_id = try(local.m924["class_id"], null)
  create_time = try(local.m924["create_time"], null)
  dn = try(local.m924["dn"], null)
  domain_group_moid = try(local.m924["domain_group_moid"], null)
  id = try(local.m924["id"], null)
  mod_time = try(local.m924["mod_time"], null)
  model_number = try(local.m924["model_number"], null)
  moid = try(local.m924["moid"], null)
  node_id = try(local.m924["node_id"], null)
  object_type = try(local.m924["object_type"], null)
  owners = try(local.m924["owners"], null)
  record_type = try(local.m924["record_type"], null)
  record_version = try(local.m924["record_version"], null)
  results = try(local.m924["results"], null)
  serial_number = try(local.m924["serial_number"], null)
  shared_scope = try(local.m924["shared_scope"], null)
  site_name = try(local.m924["site_name"], null)
  vendor_name = try(local.m924["vendor_name"], null)
  vid = try(local.m924["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m924["ancestors"], null) == null ? [] : local.m924["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m924["parent"], null) == null ? [] : local.m924["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m924["permission_resources"], null) == null ? [] : local.m924["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m924["registered_device"], null) == null ? [] : local.m924["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m924["tags"], null) == null ? [] : local.m924["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m924["version_context"], null) == null ? [] : local.m924["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
