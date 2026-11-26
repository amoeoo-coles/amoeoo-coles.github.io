# Sample data source intersight_niatelemetry_aaa_ldap_provider_details — reads ../models/data_intersight_niatelemetry_aaa_ldap_provider_details.yml
locals { m909 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_aaa_ldap_provider_details.yml"))["data_intersight_niatelemetry_aaa_ldap_provider_details"] }

data "intersight_niatelemetry_aaa_ldap_provider_details" "n909" {
  account_moid = try(local.m909["account_moid"], null)
  additional_properties = try(local.m909["additional_properties"], null)
  base_dn = try(local.m909["base_dn"], null)
  class_id = try(local.m909["class_id"], null)
  create_time = try(local.m909["create_time"], null)
  dn = try(local.m909["dn"], null)
  domain_group_moid = try(local.m909["domain_group_moid"], null)
  id = try(local.m909["id"], null)
  mod_time = try(local.m909["mod_time"], null)
  moid = try(local.m909["moid"], null)
  object_type = try(local.m909["object_type"], null)
  owners = try(local.m909["owners"], null)
  port = try(local.m909["port"], null)
  record_type = try(local.m909["record_type"], null)
  record_version = try(local.m909["record_version"], null)
  results = try(local.m909["results"], null)
  root_dn = try(local.m909["root_dn"], null)
  shared_scope = try(local.m909["shared_scope"], null)
  site_name = try(local.m909["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m909["ancestors"], null) == null ? [] : local.m909["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m909["parent"], null) == null ? [] : local.m909["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m909["permission_resources"], null) == null ? [] : local.m909["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m909["registered_device"], null) == null ? [] : local.m909["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m909["tags"], null) == null ? [] : local.m909["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m909["version_context"], null) == null ? [] : local.m909["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
