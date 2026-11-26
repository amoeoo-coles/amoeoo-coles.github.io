# Sample data source intersight_niatelemetry_https_acl_filter_details — reads ../models/data_intersight_niatelemetry_https_acl_filter_details.yml
locals { m963 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_https_acl_filter_details.yml"))["data_intersight_niatelemetry_https_acl_filter_details"] }

data "intersight_niatelemetry_https_acl_filter_details" "n963" {
  account_moid = try(local.m963["account_moid"], null)
  additional_properties = try(local.m963["additional_properties"], null)
  class_id = try(local.m963["class_id"], null)
  create_time = try(local.m963["create_time"], null)
  dest_from_port = try(local.m963["dest_from_port"], null)
  dest_to_port = try(local.m963["dest_to_port"], null)
  dn = try(local.m963["dn"], null)
  domain_group_moid = try(local.m963["domain_group_moid"], null)
  filter_name = try(local.m963["filter_name"], null)
  id = try(local.m963["id"], null)
  mod_time = try(local.m963["mod_time"], null)
  moid = try(local.m963["moid"], null)
  object_type = try(local.m963["object_type"], null)
  owners = try(local.m963["owners"], null)
  prot = try(local.m963["prot"], null)
  record_type = try(local.m963["record_type"], null)
  record_version = try(local.m963["record_version"], null)
  results = try(local.m963["results"], null)
  shared_scope = try(local.m963["shared_scope"], null)
  site_name = try(local.m963["site_name"], null)
  src_from_port = try(local.m963["src_from_port"], null)
  src_to_port = try(local.m963["src_to_port"], null)
  dynamic "ancestors" {
    for_each = try(local.m963["ancestors"], null) == null ? [] : local.m963["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m963["parent"], null) == null ? [] : local.m963["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m963["permission_resources"], null) == null ? [] : local.m963["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m963["registered_device"], null) == null ? [] : local.m963["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m963["tags"], null) == null ? [] : local.m963["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m963["version_context"], null) == null ? [] : local.m963["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
