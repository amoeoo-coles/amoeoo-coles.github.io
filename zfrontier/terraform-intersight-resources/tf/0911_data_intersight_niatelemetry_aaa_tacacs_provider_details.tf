# Sample data source intersight_niatelemetry_aaa_tacacs_provider_details — reads ../models/data_intersight_niatelemetry_aaa_tacacs_provider_details.yml
locals { m911 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_aaa_tacacs_provider_details.yml"))["data_intersight_niatelemetry_aaa_tacacs_provider_details"] }

data "intersight_niatelemetry_aaa_tacacs_provider_details" "n911" {
  account_moid = try(local.m911["account_moid"], null)
  additional_properties = try(local.m911["additional_properties"], null)
  class_id = try(local.m911["class_id"], null)
  create_time = try(local.m911["create_time"], null)
  dn = try(local.m911["dn"], null)
  domain_group_moid = try(local.m911["domain_group_moid"], null)
  id = try(local.m911["id"], null)
  mod_time = try(local.m911["mod_time"], null)
  moid = try(local.m911["moid"], null)
  object_type = try(local.m911["object_type"], null)
  owner_key = try(var.secrets["data_intersight_niatelemetry_aaa_tacacs_provider_details.owner_key"], local.m911["owner_key"])
  owners = try(local.m911["owners"], null)
  record_type = try(local.m911["record_type"], null)
  record_version = try(local.m911["record_version"], null)
  results = try(local.m911["results"], null)
  shared_scope = try(local.m911["shared_scope"], null)
  site_name = try(local.m911["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m911["ancestors"], null) == null ? [] : local.m911["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m911["parent"], null) == null ? [] : local.m911["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m911["permission_resources"], null) == null ? [] : local.m911["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m911["registered_device"], null) == null ? [] : local.m911["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m911["tags"], null) == null ? [] : local.m911["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m911["version_context"], null) == null ? [] : local.m911["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
