# Sample data source intersight_partnerintegration_etl — reads ../models/data_intersight_partnerintegration_etl.yml
locals { m1054 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_etl.yml"))["data_intersight_partnerintegration_etl"] }

data "intersight_partnerintegration_etl" "n1054" {
  account_moid = try(local.m1054["account_moid"], null)
  additional_properties = try(local.m1054["additional_properties"], null)
  class_id = try(local.m1054["class_id"], null)
  create_time = try(local.m1054["create_time"], null)
  data = try(local.m1054["data"], null)
  domain_group_moid = try(local.m1054["domain_group_moid"], null)
  id = try(local.m1054["id"], null)
  mod_time = try(local.m1054["mod_time"], null)
  moid = try(local.m1054["moid"], null)
  name = try(local.m1054["name"], null)
  object_type = try(local.m1054["object_type"], null)
  owners = try(local.m1054["owners"], null)
  results = try(local.m1054["results"], null)
  shared_scope = try(local.m1054["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1054["ancestors"], null) == null ? [] : local.m1054["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory" {
    for_each = try(local.m1054["inventory"], null) == null ? [] : local.m1054["inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1054["parent"], null) == null ? [] : local.m1054["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1054["permission_resources"], null) == null ? [] : local.m1054["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1054["tags"], null) == null ? [] : local.m1054["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1054["version_context"], null) == null ? [] : local.m1054["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
