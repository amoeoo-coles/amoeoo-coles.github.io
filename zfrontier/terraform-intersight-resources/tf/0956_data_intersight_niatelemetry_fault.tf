# Sample data source intersight_niatelemetry_fault — reads ../models/data_intersight_niatelemetry_fault.yml
locals { m956 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_fault.yml"))["data_intersight_niatelemetry_fault"] }

data "intersight_niatelemetry_fault" "n956" {
  account_moid = try(local.m956["account_moid"], null)
  additional_properties = try(local.m956["additional_properties"], null)
  cause = try(local.m956["cause"], null)
  class_id = try(local.m956["class_id"], null)
  code = try(local.m956["code"], null)
  create_time = try(local.m956["create_time"], null)
  created_time = try(local.m956["created_time"], null)
  description = try(local.m956["description"], null)
  dn = try(local.m956["dn"], null)
  domain_group_moid = try(local.m956["domain_group_moid"], null)
  id = try(local.m956["id"], null)
  mod_time = try(local.m956["mod_time"], null)
  moid = try(local.m956["moid"], null)
  object_type = try(local.m956["object_type"], null)
  owners = try(local.m956["owners"], null)
  record_type = try(local.m956["record_type"], null)
  record_version = try(local.m956["record_version"], null)
  results = try(local.m956["results"], null)
  severity = try(local.m956["severity"], null)
  shared_scope = try(local.m956["shared_scope"], null)
  site_name = try(local.m956["site_name"], null)
  type = try(local.m956["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m956["ancestors"], null) == null ? [] : local.m956["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m956["parent"], null) == null ? [] : local.m956["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m956["permission_resources"], null) == null ? [] : local.m956["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m956["registered_device"], null) == null ? [] : local.m956["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m956["tags"], null) == null ? [] : local.m956["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m956["version_context"], null) == null ? [] : local.m956["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
