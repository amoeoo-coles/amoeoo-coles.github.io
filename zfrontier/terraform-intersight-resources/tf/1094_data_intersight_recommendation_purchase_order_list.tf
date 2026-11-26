# Sample data source intersight_recommendation_purchase_order_list — reads ../models/data_intersight_recommendation_purchase_order_list.yml
locals { m1094 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_purchase_order_list.yml"))["data_intersight_recommendation_purchase_order_list"] }

data "intersight_recommendation_purchase_order_list" "n1094" {
  account_moid = try(local.m1094["account_moid"], null)
  additional_properties = try(local.m1094["additional_properties"], null)
  class_id = try(local.m1094["class_id"], null)
  create_time = try(local.m1094["create_time"], null)
  domain_group_moid = try(local.m1094["domain_group_moid"], null)
  id = try(local.m1094["id"], null)
  item_list = try(local.m1094["item_list"], null)
  last_updated_time = try(local.m1094["last_updated_time"], null)
  mod_time = try(local.m1094["mod_time"], null)
  moid = try(local.m1094["moid"], null)
  name = try(local.m1094["name"], null)
  object_type = try(local.m1094["object_type"], null)
  owners = try(local.m1094["owners"], null)
  requirement_met = try(local.m1094["requirement_met"], null)
  results = try(local.m1094["results"], null)
  shared_scope = try(local.m1094["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1094["ancestors"], null) == null ? [] : local.m1094["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_expansion" {
    for_each = try(local.m1094["cluster_expansion"], null) == null ? [] : local.m1094["cluster_expansion"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1094["parent"], null) == null ? [] : local.m1094["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1094["permission_resources"], null) == null ? [] : local.m1094["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1094["tags"], null) == null ? [] : local.m1094["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1094["version_context"], null) == null ? [] : local.m1094["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
