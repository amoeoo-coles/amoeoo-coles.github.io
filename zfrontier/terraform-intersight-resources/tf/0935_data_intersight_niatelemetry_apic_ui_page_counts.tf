# Sample data source intersight_niatelemetry_apic_ui_page_counts — reads ../models/data_intersight_niatelemetry_apic_ui_page_counts.yml
locals { m935 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_ui_page_counts.yml"))["data_intersight_niatelemetry_apic_ui_page_counts"] }

data "intersight_niatelemetry_apic_ui_page_counts" "n935" {
  account_moid = try(local.m935["account_moid"], null)
  additional_properties = try(local.m935["additional_properties"], null)
  class_id = try(local.m935["class_id"], null)
  create_time = try(local.m935["create_time"], null)
  dn = try(local.m935["dn"], null)
  domain_group_moid = try(local.m935["domain_group_moid"], null)
  id = try(local.m935["id"], null)
  mod_time = try(local.m935["mod_time"], null)
  moid = try(local.m935["moid"], null)
  object_type = try(local.m935["object_type"], null)
  owners = try(local.m935["owners"], null)
  page_count = try(local.m935["page_count"], null)
  page_name = try(local.m935["page_name"], null)
  record_type = try(local.m935["record_type"], null)
  record_version = try(local.m935["record_version"], null)
  results = try(local.m935["results"], null)
  shared_scope = try(local.m935["shared_scope"], null)
  site_name = try(local.m935["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m935["ancestors"], null) == null ? [] : local.m935["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m935["parent"], null) == null ? [] : local.m935["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m935["permission_resources"], null) == null ? [] : local.m935["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m935["registered_device"], null) == null ? [] : local.m935["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m935["tags"], null) == null ? [] : local.m935["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m935["version_context"], null) == null ? [] : local.m935["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
