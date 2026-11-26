# Sample data source intersight_niatelemetry_https_acl_contract_filter_map — reads ../models/data_intersight_niatelemetry_https_acl_contract_filter_map.yml
locals { m960 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_https_acl_contract_filter_map.yml"))["data_intersight_niatelemetry_https_acl_contract_filter_map"] }

data "intersight_niatelemetry_https_acl_contract_filter_map" "n960" {
  account_moid = try(local.m960["account_moid"], null)
  additional_properties = try(local.m960["additional_properties"], null)
  class_id = try(local.m960["class_id"], null)
  contract_name = try(local.m960["contract_name"], null)
  create_time = try(local.m960["create_time"], null)
  dn = try(local.m960["dn"], null)
  domain_group_moid = try(local.m960["domain_group_moid"], null)
  filter_name = try(local.m960["filter_name"], null)
  id = try(local.m960["id"], null)
  mod_time = try(local.m960["mod_time"], null)
  moid = try(local.m960["moid"], null)
  object_type = try(local.m960["object_type"], null)
  owners = try(local.m960["owners"], null)
  record_type = try(local.m960["record_type"], null)
  record_version = try(local.m960["record_version"], null)
  results = try(local.m960["results"], null)
  shared_scope = try(local.m960["shared_scope"], null)
  site_name = try(local.m960["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m960["ancestors"], null) == null ? [] : local.m960["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m960["parent"], null) == null ? [] : local.m960["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m960["permission_resources"], null) == null ? [] : local.m960["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m960["registered_device"], null) == null ? [] : local.m960["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m960["tags"], null) == null ? [] : local.m960["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m960["version_context"], null) == null ? [] : local.m960["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
