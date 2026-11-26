# Sample data source intersight_capability_hsu_iso_file_support_meta — reads ../models/data_intersight_capability_hsu_iso_file_support_meta.yml
locals { m165 = yamldecode(file("${path.module}/../models/data_intersight_capability_hsu_iso_file_support_meta.yml"))["data_intersight_capability_hsu_iso_file_support_meta"] }

data "intersight_capability_hsu_iso_file_support_meta" "n165" {
  account_moid = try(local.m165["account_moid"], null)
  additional_properties = try(local.m165["additional_properties"], null)
  class_id = try(local.m165["class_id"], null)
  create_time = try(local.m165["create_time"], null)
  default_file_name = try(local.m165["default_file_name"], null)
  default_min_version = try(local.m165["default_min_version"], null)
  domain_group_moid = try(local.m165["domain_group_moid"], null)
  id = try(local.m165["id"], null)
  mod_time = try(local.m165["mod_time"], null)
  moid = try(local.m165["moid"], null)
  name = try(local.m165["name"], null)
  object_type = try(local.m165["object_type"], null)
  owners = try(local.m165["owners"], null)
  results = try(local.m165["results"], null)
  series = try(local.m165["series"], null)
  shared_scope = try(local.m165["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m165["ancestors"], null) == null ? [] : local.m165["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "model_specific_constraint" {
    for_each = try(local.m165["model_specific_constraint"], null) == null ? [] : local.m165["model_specific_constraint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m165["parent"], null) == null ? [] : local.m165["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m165["permission_resources"], null) == null ? [] : local.m165["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m165["tags"], null) == null ? [] : local.m165["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m165["version_context"], null) == null ? [] : local.m165["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
