# Sample data source intersight_webhook_schema — reads ../models/data_intersight_webhook_schema.yml
locals { m1496 = yamldecode(file("${path.module}/../models/data_intersight_webhook_schema.yml"))["data_intersight_webhook_schema"] }

data "intersight_webhook_schema" "n1496" {
  account_moid = try(local.m1496["account_moid"], null)
  additional_properties = try(local.m1496["additional_properties"], null)
  class_id = try(local.m1496["class_id"], null)
  create_time = try(local.m1496["create_time"], null)
  data = try(local.m1496["data"], null)
  description = try(local.m1496["description"], null)
  domain_group_moid = try(local.m1496["domain_group_moid"], null)
  event_type = try(local.m1496["event_type"], null)
  id = try(local.m1496["id"], null)
  mod_time = try(local.m1496["mod_time"], null)
  moid = try(local.m1496["moid"], null)
  nr_source = try(local.m1496["nr_source"], null)
  object_type = try(local.m1496["object_type"], null)
  owners = try(local.m1496["owners"], null)
  results = try(local.m1496["results"], null)
  shared_scope = try(local.m1496["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1496["account"], null) == null ? [] : local.m1496["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1496["ancestors"], null) == null ? [] : local.m1496["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1496["parent"], null) == null ? [] : local.m1496["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1496["permission_resources"], null) == null ? [] : local.m1496["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1496["tags"], null) == null ? [] : local.m1496["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1496["version_context"], null) == null ? [] : local.m1496["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
