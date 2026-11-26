# Sample data source intersight_niatelemetry_fabric_module_details — reads ../models/data_intersight_niatelemetry_fabric_module_details.yml
locals { m952 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_fabric_module_details.yml"))["data_intersight_niatelemetry_fabric_module_details"] }

data "intersight_niatelemetry_fabric_module_details" "n952" {
  account_moid = try(local.m952["account_moid"], null)
  additional_properties = try(local.m952["additional_properties"], null)
  class_id = try(local.m952["class_id"], null)
  create_time = try(local.m952["create_time"], null)
  dn = try(local.m952["dn"], null)
  domain_group_moid = try(local.m952["domain_group_moid"], null)
  hw_ver = try(local.m952["hw_ver"], null)
  id = try(local.m952["id"], null)
  mod_time = try(local.m952["mod_time"], null)
  model = try(local.m952["model"], null)
  moid = try(local.m952["moid"], null)
  object_type = try(local.m952["object_type"], null)
  owners = try(local.m952["owners"], null)
  record_type = try(local.m952["record_type"], null)
  record_version = try(local.m952["record_version"], null)
  results = try(local.m952["results"], null)
  revision = try(local.m952["revision"], null)
  serial = try(local.m952["serial"], null)
  shared_scope = try(local.m952["shared_scope"], null)
  site_name = try(local.m952["site_name"], null)
  type = try(local.m952["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m952["ancestors"], null) == null ? [] : local.m952["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m952["parent"], null) == null ? [] : local.m952["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m952["permission_resources"], null) == null ? [] : local.m952["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m952["registered_device"], null) == null ? [] : local.m952["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m952["tags"], null) == null ? [] : local.m952["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m952["version_context"], null) == null ? [] : local.m952["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
