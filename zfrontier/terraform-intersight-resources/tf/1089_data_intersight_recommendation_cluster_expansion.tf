# Sample data source intersight_recommendation_cluster_expansion — reads ../models/data_intersight_recommendation_cluster_expansion.yml
locals { m1089 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_cluster_expansion.yml"))["data_intersight_recommendation_cluster_expansion"] }

data "intersight_recommendation_cluster_expansion" "n1089" {
  account_moid = try(local.m1089["account_moid"], null)
  additional_properties = try(local.m1089["additional_properties"], null)
  class_id = try(local.m1089["class_id"], null)
  cluster_name = try(local.m1089["cluster_name"], null)
  create_time = try(local.m1089["create_time"], null)
  domain_group_moid = try(local.m1089["domain_group_moid"], null)
  id = try(local.m1089["id"], null)
  last_updated_time = try(local.m1089["last_updated_time"], null)
  mod_time = try(local.m1089["mod_time"], null)
  moid = try(local.m1089["moid"], null)
  name = try(local.m1089["name"], null)
  object_type = try(local.m1089["object_type"], null)
  owners = try(local.m1089["owners"], null)
  requirement_met = try(local.m1089["requirement_met"], null)
  results = try(local.m1089["results"], null)
  shared_scope = try(local.m1089["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1089["ancestors"], null) == null ? [] : local.m1089["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hardware_expansion_request" {
    for_each = try(local.m1089["hardware_expansion_request"], null) == null ? [] : local.m1089["hardware_expansion_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1089["parent"], null) == null ? [] : local.m1089["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1089["permission_resources"], null) == null ? [] : local.m1089["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_item" {
    for_each = try(local.m1089["physical_item"], null) == null ? [] : local.m1089["physical_item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1089["registered_device"], null) == null ? [] : local.m1089["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "software_item" {
    for_each = try(local.m1089["software_item"], null) == null ? [] : local.m1089["software_item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1089["tags"], null) == null ? [] : local.m1089["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1089["version_context"], null) == null ? [] : local.m1089["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
