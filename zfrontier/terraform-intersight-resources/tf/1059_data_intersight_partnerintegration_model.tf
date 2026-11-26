# Sample data source intersight_partnerintegration_model — reads ../models/data_intersight_partnerintegration_model.yml
locals { m1059 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_model.yml"))["data_intersight_partnerintegration_model"] }

data "intersight_partnerintegration_model" "n1059" {
  account_moid = try(local.m1059["account_moid"], null)
  additional_properties = try(local.m1059["additional_properties"], null)
  class_id = try(local.m1059["class_id"], null)
  create_time = try(local.m1059["create_time"], null)
  data = try(local.m1059["data"], null)
  domain_group_moid = try(local.m1059["domain_group_moid"], null)
  id = try(local.m1059["id"], null)
  mod_time = try(local.m1059["mod_time"], null)
  moid = try(local.m1059["moid"], null)
  name = try(local.m1059["name"], null)
  object_type = try(local.m1059["object_type"], null)
  owners = try(local.m1059["owners"], null)
  results = try(local.m1059["results"], null)
  shared_scope = try(local.m1059["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1059["ancestors"], null) == null ? [] : local.m1059["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory" {
    for_each = try(local.m1059["inventory"], null) == null ? [] : local.m1059["inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1059["parent"], null) == null ? [] : local.m1059["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1059["permission_resources"], null) == null ? [] : local.m1059["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1059["tags"], null) == null ? [] : local.m1059["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1059["version_context"], null) == null ? [] : local.m1059["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
