# Sample data source intersight_hcl_hw_catalog_info — reads ../models/data_intersight_hcl_hw_catalog_info.yml
locals { m546 = yamldecode(file("${path.module}/../models/data_intersight_hcl_hw_catalog_info.yml"))["data_intersight_hcl_hw_catalog_info"] }

data "intersight_hcl_hw_catalog_info" "n546" {
  account_moid = try(local.m546["account_moid"], null)
  additional_properties = try(local.m546["additional_properties"], null)
  class_id = try(local.m546["class_id"], null)
  create_time = try(local.m546["create_time"], null)
  domain_group_moid = try(local.m546["domain_group_moid"], null)
  id = try(local.m546["id"], null)
  mod_time = try(local.m546["mod_time"], null)
  moid = try(local.m546["moid"], null)
  object_type = try(local.m546["object_type"], null)
  owners = try(local.m546["owners"], null)
  results = try(local.m546["results"], null)
  server_model = try(local.m546["server_model"], null)
  server_type = try(local.m546["server_type"], null)
  shared_scope = try(local.m546["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m546["ancestors"], null) == null ? [] : local.m546["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m546["parent"], null) == null ? [] : local.m546["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m546["permission_resources"], null) == null ? [] : local.m546["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_hw_catalog_info" {
    for_each = try(local.m546["server_hw_catalog_info"], null) == null ? [] : local.m546["server_hw_catalog_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m546["tags"], null) == null ? [] : local.m546["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m546["version_context"], null) == null ? [] : local.m546["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
