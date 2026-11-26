# Sample data source intersight_niatelemetry_https_acl_epg_contract_map — reads ../models/data_intersight_niatelemetry_https_acl_epg_contract_map.yml
locals { m961 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_https_acl_epg_contract_map.yml"))["data_intersight_niatelemetry_https_acl_epg_contract_map"] }

data "intersight_niatelemetry_https_acl_epg_contract_map" "n961" {
  account_moid = try(local.m961["account_moid"], null)
  additional_properties = try(local.m961["additional_properties"], null)
  class_id = try(local.m961["class_id"], null)
  contract_name = try(local.m961["contract_name"], null)
  create_time = try(local.m961["create_time"], null)
  dn = try(local.m961["dn"], null)
  domain_group_moid = try(local.m961["domain_group_moid"], null)
  epg_name = try(local.m961["epg_name"], null)
  id = try(local.m961["id"], null)
  mod_time = try(local.m961["mod_time"], null)
  moid = try(local.m961["moid"], null)
  object_type = try(local.m961["object_type"], null)
  owners = try(local.m961["owners"], null)
  record_type = try(local.m961["record_type"], null)
  record_version = try(local.m961["record_version"], null)
  results = try(local.m961["results"], null)
  shared_scope = try(local.m961["shared_scope"], null)
  site_name = try(local.m961["site_name"], null)
  target_dn = try(local.m961["target_dn"], null)
  dynamic "ancestors" {
    for_each = try(local.m961["ancestors"], null) == null ? [] : local.m961["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m961["parent"], null) == null ? [] : local.m961["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m961["permission_resources"], null) == null ? [] : local.m961["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m961["registered_device"], null) == null ? [] : local.m961["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m961["tags"], null) == null ? [] : local.m961["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m961["version_context"], null) == null ? [] : local.m961["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
