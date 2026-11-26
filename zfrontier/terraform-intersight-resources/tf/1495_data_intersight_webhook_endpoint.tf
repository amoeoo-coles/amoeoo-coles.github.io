# Sample data source intersight_webhook_endpoint — reads ../models/data_intersight_webhook_endpoint.yml
locals { m1495 = yamldecode(file("${path.module}/../models/data_intersight_webhook_endpoint.yml"))["data_intersight_webhook_endpoint"] }

data "intersight_webhook_endpoint" "n1495" {
  account_moid = try(local.m1495["account_moid"], null)
  additional_properties = try(local.m1495["additional_properties"], null)
  class_id = try(local.m1495["class_id"], null)
  create_time = try(local.m1495["create_time"], null)
  domain_group_moid = try(local.m1495["domain_group_moid"], null)
  id = try(local.m1495["id"], null)
  mod_time = try(local.m1495["mod_time"], null)
  moid = try(local.m1495["moid"], null)
  name = try(local.m1495["name"], null)
  object_type = try(local.m1495["object_type"], null)
  owners = try(local.m1495["owners"], null)
  results = try(local.m1495["results"], null)
  shared_scope = try(local.m1495["shared_scope"], null)
  url = try(local.m1495["url"], null)
  dynamic "account" {
    for_each = try(local.m1495["account"], null) == null ? [] : local.m1495["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1495["ancestors"], null) == null ? [] : local.m1495["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1495["organization"], null) == null ? [] : local.m1495["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1495["parent"], null) == null ? [] : local.m1495["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1495["permission_resources"], null) == null ? [] : local.m1495["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schemas" {
    for_each = try(local.m1495["schemas"], null) == null ? [] : local.m1495["schemas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1495["tags"], null) == null ? [] : local.m1495["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m1495["target"], null) == null ? [] : local.m1495["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1495["version_context"], null) == null ? [] : local.m1495["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
