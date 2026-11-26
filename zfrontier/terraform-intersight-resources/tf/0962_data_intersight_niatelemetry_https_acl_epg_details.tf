# Sample data source intersight_niatelemetry_https_acl_epg_details — reads ../models/data_intersight_niatelemetry_https_acl_epg_details.yml
locals { m962 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_https_acl_epg_details.yml"))["data_intersight_niatelemetry_https_acl_epg_details"] }

data "intersight_niatelemetry_https_acl_epg_details" "n962" {
  account_moid = try(local.m962["account_moid"], null)
  additional_properties = try(local.m962["additional_properties"], null)
  class_id = try(local.m962["class_id"], null)
  create_time = try(local.m962["create_time"], null)
  dn = try(local.m962["dn"], null)
  domain_group_moid = try(local.m962["domain_group_moid"], null)
  epg_name = try(local.m962["epg_name"], null)
  id = try(local.m962["id"], null)
  mod_time = try(local.m962["mod_time"], null)
  moid = try(local.m962["moid"], null)
  object_type = try(local.m962["object_type"], null)
  owners = try(local.m962["owners"], null)
  record_type = try(local.m962["record_type"], null)
  record_version = try(local.m962["record_version"], null)
  results = try(local.m962["results"], null)
  shared_scope = try(local.m962["shared_scope"], null)
  site_name = try(local.m962["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m962["ancestors"], null) == null ? [] : local.m962["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m962["parent"], null) == null ? [] : local.m962["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m962["permission_resources"], null) == null ? [] : local.m962["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m962["registered_device"], null) == null ? [] : local.m962["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m962["tags"], null) == null ? [] : local.m962["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m962["version_context"], null) == null ? [] : local.m962["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
