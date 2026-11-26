# Sample data source intersight_niatelemetry_system_controller_details — reads ../models/data_intersight_niatelemetry_system_controller_details.yml
locals { m1003 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_system_controller_details.yml"))["data_intersight_niatelemetry_system_controller_details"] }

data "intersight_niatelemetry_system_controller_details" "n1003" {
  account_moid = try(local.m1003["account_moid"], null)
  additional_properties = try(local.m1003["additional_properties"], null)
  class_id = try(local.m1003["class_id"], null)
  create_time = try(local.m1003["create_time"], null)
  dn = try(local.m1003["dn"], null)
  domain_group_moid = try(local.m1003["domain_group_moid"], null)
  hw_ver = try(local.m1003["hw_ver"], null)
  id = try(local.m1003["id"], null)
  mod_time = try(local.m1003["mod_time"], null)
  model = try(local.m1003["model"], null)
  moid = try(local.m1003["moid"], null)
  object_type = try(local.m1003["object_type"], null)
  owners = try(local.m1003["owners"], null)
  record_type = try(local.m1003["record_type"], null)
  record_version = try(local.m1003["record_version"], null)
  results = try(local.m1003["results"], null)
  serial = try(local.m1003["serial"], null)
  shared_scope = try(local.m1003["shared_scope"], null)
  site_name = try(local.m1003["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1003["ancestors"], null) == null ? [] : local.m1003["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1003["parent"], null) == null ? [] : local.m1003["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1003["permission_resources"], null) == null ? [] : local.m1003["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1003["registered_device"], null) == null ? [] : local.m1003["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1003["tags"], null) == null ? [] : local.m1003["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1003["version_context"], null) == null ? [] : local.m1003["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
