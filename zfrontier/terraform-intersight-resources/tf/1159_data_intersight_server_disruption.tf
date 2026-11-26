# Sample data source intersight_server_disruption — reads ../models/data_intersight_server_disruption.yml
locals { m1159 = yamldecode(file("${path.module}/../models/data_intersight_server_disruption.yml"))["data_intersight_server_disruption"] }

data "intersight_server_disruption" "n1159" {
  account_moid = try(local.m1159["account_moid"], null)
  additional_properties = try(local.m1159["additional_properties"], null)
  class_id = try(local.m1159["class_id"], null)
  create_time = try(local.m1159["create_time"], null)
  domain_group_moid = try(local.m1159["domain_group_moid"], null)
  id = try(local.m1159["id"], null)
  label = try(local.m1159["label"], null)
  mod_time = try(local.m1159["mod_time"], null)
  moid = try(local.m1159["moid"], null)
  name = try(local.m1159["name"], null)
  object_type = try(local.m1159["object_type"], null)
  owners = try(local.m1159["owners"], null)
  results = try(local.m1159["results"], null)
  severity = try(local.m1159["severity"], null)
  shared_scope = try(local.m1159["shared_scope"], null)
  type = try(local.m1159["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1159["ancestors"], null) == null ? [] : local.m1159["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1159["organization"], null) == null ? [] : local.m1159["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1159["parent"], null) == null ? [] : local.m1159["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1159["permission_resources"], null) == null ? [] : local.m1159["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1159["tags"], null) == null ? [] : local.m1159["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1159["version_context"], null) == null ? [] : local.m1159["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
