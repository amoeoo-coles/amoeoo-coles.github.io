# Sample data source intersight_niatelemetry_supervisor_module_details — reads ../models/data_intersight_niatelemetry_supervisor_module_details.yml
locals { m997 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_supervisor_module_details.yml"))["data_intersight_niatelemetry_supervisor_module_details"] }

data "intersight_niatelemetry_supervisor_module_details" "n997" {
  account_moid = try(local.m997["account_moid"], null)
  additional_properties = try(local.m997["additional_properties"], null)
  class_id = try(local.m997["class_id"], null)
  create_time = try(local.m997["create_time"], null)
  dn = try(local.m997["dn"], null)
  domain_group_moid = try(local.m997["domain_group_moid"], null)
  hw_ver = try(local.m997["hw_ver"], null)
  id = try(local.m997["id"], null)
  mod_time = try(local.m997["mod_time"], null)
  model = try(local.m997["model"], null)
  moid = try(local.m997["moid"], null)
  object_type = try(local.m997["object_type"], null)
  owners = try(local.m997["owners"], null)
  record_type = try(local.m997["record_type"], null)
  record_version = try(local.m997["record_version"], null)
  results = try(local.m997["results"], null)
  serial = try(local.m997["serial"], null)
  shared_scope = try(local.m997["shared_scope"], null)
  site_name = try(local.m997["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m997["ancestors"], null) == null ? [] : local.m997["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m997["parent"], null) == null ? [] : local.m997["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m997["permission_resources"], null) == null ? [] : local.m997["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m997["registered_device"], null) == null ? [] : local.m997["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m997["tags"], null) == null ? [] : local.m997["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m997["version_context"], null) == null ? [] : local.m997["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
