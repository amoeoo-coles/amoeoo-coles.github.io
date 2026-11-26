# Sample data source intersight_recommendation_software_item — reads ../models/data_intersight_recommendation_software_item.yml
locals { m1095 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_software_item.yml"))["data_intersight_recommendation_software_item"] }

data "intersight_recommendation_software_item" "n1095" {
  account_moid = try(local.m1095["account_moid"], null)
  additional_properties = try(local.m1095["additional_properties"], null)
  class_id = try(local.m1095["class_id"], null)
  create_time = try(local.m1095["create_time"], null)
  domain_group_moid = try(local.m1095["domain_group_moid"], null)
  id = try(local.m1095["id"], null)
  message = try(local.m1095["message"], null)
  mod_time = try(local.m1095["mod_time"], null)
  moid = try(local.m1095["moid"], null)
  name = try(local.m1095["name"], null)
  object_type = try(local.m1095["object_type"], null)
  owners = try(local.m1095["owners"], null)
  personality = try(local.m1095["personality"], null)
  recommendation_type = try(local.m1095["recommendation_type"], null)
  results = try(local.m1095["results"], null)
  shared_scope = try(local.m1095["shared_scope"], null)
  type = try(local.m1095["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1095["ancestors"], null) == null ? [] : local.m1095["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_expansion" {
    for_each = try(local.m1095["cluster_expansion"], null) == null ? [] : local.m1095["cluster_expansion"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1095["parent"], null) == null ? [] : local.m1095["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1095["permission_resources"], null) == null ? [] : local.m1095["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1095["tags"], null) == null ? [] : local.m1095["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1095["version_context"], null) == null ? [] : local.m1095["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
