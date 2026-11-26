# Sample data source intersight_recommendation_purchase_order_estimate — reads ../models/data_intersight_recommendation_purchase_order_estimate.yml
locals { m1093 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_purchase_order_estimate.yml"))["data_intersight_recommendation_purchase_order_estimate"] }

data "intersight_recommendation_purchase_order_estimate" "n1093" {
  account_moid = try(local.m1093["account_moid"], null)
  action = try(local.m1093["action"], null)
  additional_properties = try(local.m1093["additional_properties"], null)
  class_id = try(local.m1093["class_id"], null)
  create_time = try(local.m1093["create_time"], null)
  domain_group_moid = try(local.m1093["domain_group_moid"], null)
  estimate_id = try(local.m1093["estimate_id"], null)
  id = try(local.m1093["id"], null)
  last_updated_time = try(local.m1093["last_updated_time"], null)
  message = try(local.m1093["message"], null)
  mod_time = try(local.m1093["mod_time"], null)
  moid = try(local.m1093["moid"], null)
  name = try(local.m1093["name"], null)
  object_type = try(local.m1093["object_type"], null)
  owners = try(local.m1093["owners"], null)
  requirement_met = try(local.m1093["requirement_met"], null)
  results = try(local.m1093["results"], null)
  shared_scope = try(local.m1093["shared_scope"], null)
  status = try(local.m1093["status"], null)
  total_cost = try(local.m1093["total_cost"], null)
  dynamic "ancestors" {
    for_each = try(local.m1093["ancestors"], null) == null ? [] : local.m1093["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_expansion" {
    for_each = try(local.m1093["cluster_expansion"], null) == null ? [] : local.m1093["cluster_expansion"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "estimate_owner" {
    for_each = try(local.m1093["estimate_owner"], null) == null ? [] : local.m1093["estimate_owner"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1093["parent"], null) == null ? [] : local.m1093["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1093["permission_resources"], null) == null ? [] : local.m1093["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1093["tags"], null) == null ? [] : local.m1093["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1093["version_context"], null) == null ? [] : local.m1093["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
