# Sample data source intersight_niatelemetry_aaa_radius_provider_details — reads ../models/data_intersight_niatelemetry_aaa_radius_provider_details.yml
locals { m910 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_aaa_radius_provider_details.yml"))["data_intersight_niatelemetry_aaa_radius_provider_details"] }

data "intersight_niatelemetry_aaa_radius_provider_details" "n910" {
  account_moid = try(local.m910["account_moid"], null)
  additional_properties = try(local.m910["additional_properties"], null)
  class_id = try(local.m910["class_id"], null)
  create_time = try(local.m910["create_time"], null)
  dn = try(local.m910["dn"], null)
  domain_group_moid = try(local.m910["domain_group_moid"], null)
  id = try(local.m910["id"], null)
  mod_time = try(local.m910["mod_time"], null)
  moid = try(local.m910["moid"], null)
  object_type = try(local.m910["object_type"], null)
  owner_key = try(var.secrets["data_intersight_niatelemetry_aaa_radius_provider_details.owner_key"], local.m910["owner_key"])
  owners = try(local.m910["owners"], null)
  record_type = try(local.m910["record_type"], null)
  record_version = try(local.m910["record_version"], null)
  results = try(local.m910["results"], null)
  shared_scope = try(local.m910["shared_scope"], null)
  site_name = try(local.m910["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m910["ancestors"], null) == null ? [] : local.m910["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m910["parent"], null) == null ? [] : local.m910["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m910["permission_resources"], null) == null ? [] : local.m910["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m910["registered_device"], null) == null ? [] : local.m910["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m910["tags"], null) == null ? [] : local.m910["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m910["version_context"], null) == null ? [] : local.m910["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
