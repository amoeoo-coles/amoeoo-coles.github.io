# Sample data source intersight_openapi_api_method_meta — reads ../models/data_intersight_openapi_api_method_meta.yml
locals { m1021 = yamldecode(file("${path.module}/../models/data_intersight_openapi_api_method_meta.yml"))["data_intersight_openapi_api_method_meta"] }

data "intersight_openapi_api_method_meta" "n1021" {
  account_moid = try(local.m1021["account_moid"], null)
  additional_properties = try(local.m1021["additional_properties"], null)
  class_id = try(local.m1021["class_id"], null)
  create_time = try(local.m1021["create_time"], null)
  description = try(local.m1021["description"], null)
  display_label = try(local.m1021["display_label"], null)
  domain_group_moid = try(local.m1021["domain_group_moid"], null)
  id = try(local.m1021["id"], null)
  method = try(local.m1021["method"], null)
  mod_time = try(local.m1021["mod_time"], null)
  moid = try(local.m1021["moid"], null)
  name = try(local.m1021["name"], null)
  object_type = try(local.m1021["object_type"], null)
  owners = try(local.m1021["owners"], null)
  path = try(local.m1021["path"], null)
  results = try(local.m1021["results"], null)
  shared_scope = try(local.m1021["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1021["ancestors"], null) == null ? [] : local.m1021["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m1021["nr_source"], null) == null ? [] : local.m1021["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1021["parent"], null) == null ? [] : local.m1021["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1021["permission_resources"], null) == null ? [] : local.m1021["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1021["tags"], null) == null ? [] : local.m1021["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1021["version_context"], null) == null ? [] : local.m1021["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
