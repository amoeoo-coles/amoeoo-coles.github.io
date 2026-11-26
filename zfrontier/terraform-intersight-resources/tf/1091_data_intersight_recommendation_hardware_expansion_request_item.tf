# Sample data source intersight_recommendation_hardware_expansion_request_item — reads ../models/data_intersight_recommendation_hardware_expansion_request_item.yml
locals { m1091 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_hardware_expansion_request_item.yml"))["data_intersight_recommendation_hardware_expansion_request_item"] }

data "intersight_recommendation_hardware_expansion_request_item" "n1091" {
  account_moid = try(local.m1091["account_moid"], null)
  additional_properties = try(local.m1091["additional_properties"], null)
  class_id = try(local.m1091["class_id"], null)
  create_time = try(local.m1091["create_time"], null)
  domain_group_moid = try(local.m1091["domain_group_moid"], null)
  id = try(local.m1091["id"], null)
  item_type = try(local.m1091["item_type"], null)
  max_value = try(local.m1091["max_value"], null)
  max_value_unit = try(local.m1091["max_value_unit"], null)
  mod_time = try(local.m1091["mod_time"], null)
  moid = try(local.m1091["moid"], null)
  object_type = try(local.m1091["object_type"], null)
  owners = try(local.m1091["owners"], null)
  results = try(local.m1091["results"], null)
  shared_scope = try(local.m1091["shared_scope"], null)
  unit_type = try(local.m1091["unit_type"], null)
  value = try(local.m1091["value"], null)
  dynamic "ancestors" {
    for_each = try(local.m1091["ancestors"], null) == null ? [] : local.m1091["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "expansion_request" {
    for_each = try(local.m1091["expansion_request"], null) == null ? [] : local.m1091["expansion_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1091["parent"], null) == null ? [] : local.m1091["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1091["permission_resources"], null) == null ? [] : local.m1091["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1091["tags"], null) == null ? [] : local.m1091["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1091["version_context"], null) == null ? [] : local.m1091["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
