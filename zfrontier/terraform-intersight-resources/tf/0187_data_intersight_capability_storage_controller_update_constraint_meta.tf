# Sample data source intersight_capability_storage_controller_update_constraint_meta — reads ../models/data_intersight_capability_storage_controller_update_constraint_meta.yml
locals { m187 = yamldecode(file("${path.module}/../models/data_intersight_capability_storage_controller_update_constraint_meta.yml"))["data_intersight_capability_storage_controller_update_constraint_meta"] }

data "intersight_capability_storage_controller_update_constraint_meta" "n187" {
  account_moid = try(local.m187["account_moid"], null)
  additional_properties = try(local.m187["additional_properties"], null)
  class_id = try(local.m187["class_id"], null)
  create_time = try(local.m187["create_time"], null)
  domain_group_moid = try(local.m187["domain_group_moid"], null)
  id = try(local.m187["id"], null)
  is_secure_boot_supported = try(local.m187["is_secure_boot_supported"], null)
  min_supported_version = try(local.m187["min_supported_version"], null)
  mod_time = try(local.m187["mod_time"], null)
  model = try(local.m187["model"], null)
  moid = try(local.m187["moid"], null)
  name = try(local.m187["name"], null)
  object_type = try(local.m187["object_type"], null)
  owners = try(local.m187["owners"], null)
  platform_type = try(local.m187["platform_type"], null)
  results = try(local.m187["results"], null)
  shared_scope = try(local.m187["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m187["ancestors"], null) == null ? [] : local.m187["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m187["parent"], null) == null ? [] : local.m187["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m187["permission_resources"], null) == null ? [] : local.m187["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_specific_constraint" {
    for_each = try(local.m187["server_specific_constraint"], null) == null ? [] : local.m187["server_specific_constraint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m187["tags"], null) == null ? [] : local.m187["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m187["version_context"], null) == null ? [] : local.m187["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
