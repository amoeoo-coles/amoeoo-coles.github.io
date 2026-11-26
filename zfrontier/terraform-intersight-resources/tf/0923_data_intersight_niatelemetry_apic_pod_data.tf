# Sample data source intersight_niatelemetry_apic_pod_data — reads ../models/data_intersight_niatelemetry_apic_pod_data.yml
locals { m923 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_pod_data.yml"))["data_intersight_niatelemetry_apic_pod_data"] }

data "intersight_niatelemetry_apic_pod_data" "n923" {
  account_moid = try(local.m923["account_moid"], null)
  additional_properties = try(local.m923["additional_properties"], null)
  class_id = try(local.m923["class_id"], null)
  create_time = try(local.m923["create_time"], null)
  dn = try(local.m923["dn"], null)
  domain_group_moid = try(local.m923["domain_group_moid"], null)
  health = try(local.m923["health"], null)
  id = try(local.m923["id"], null)
  mod_time = try(local.m923["mod_time"], null)
  moid = try(local.m923["moid"], null)
  object_type = try(local.m923["object_type"], null)
  owners = try(local.m923["owners"], null)
  pod_id = try(local.m923["pod_id"], null)
  record_type = try(local.m923["record_type"], null)
  record_version = try(local.m923["record_version"], null)
  results = try(local.m923["results"], null)
  shared_scope = try(local.m923["shared_scope"], null)
  site_name = try(local.m923["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m923["ancestors"], null) == null ? [] : local.m923["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m923["parent"], null) == null ? [] : local.m923["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m923["permission_resources"], null) == null ? [] : local.m923["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m923["registered_device"], null) == null ? [] : local.m923["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m923["tags"], null) == null ? [] : local.m923["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m923["version_context"], null) == null ? [] : local.m923["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
