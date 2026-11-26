# Sample data source intersight_capability_processor_unit_update_constraint_meta — reads ../models/data_intersight_capability_processor_unit_update_constraint_meta.yml
locals { m173 = yamldecode(file("${path.module}/../models/data_intersight_capability_processor_unit_update_constraint_meta.yml"))["data_intersight_capability_processor_unit_update_constraint_meta"] }

data "intersight_capability_processor_unit_update_constraint_meta" "n173" {
  account_moid = try(local.m173["account_moid"], null)
  additional_properties = try(local.m173["additional_properties"], null)
  class_id = try(local.m173["class_id"], null)
  create_time = try(local.m173["create_time"], null)
  domain_group_moid = try(local.m173["domain_group_moid"], null)
  id = try(local.m173["id"], null)
  is_secure_boot_supported = try(local.m173["is_secure_boot_supported"], null)
  min_supported_version = try(local.m173["min_supported_version"], null)
  mod_time = try(local.m173["mod_time"], null)
  model = try(local.m173["model"], null)
  moid = try(local.m173["moid"], null)
  name = try(local.m173["name"], null)
  object_type = try(local.m173["object_type"], null)
  owners = try(local.m173["owners"], null)
  platform_type = try(local.m173["platform_type"], null)
  results = try(local.m173["results"], null)
  shared_scope = try(local.m173["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m173["ancestors"], null) == null ? [] : local.m173["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m173["parent"], null) == null ? [] : local.m173["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m173["permission_resources"], null) == null ? [] : local.m173["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_specific_constraint" {
    for_each = try(local.m173["server_specific_constraint"], null) == null ? [] : local.m173["server_specific_constraint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m173["tags"], null) == null ? [] : local.m173["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m173["version_context"], null) == null ? [] : local.m173["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
