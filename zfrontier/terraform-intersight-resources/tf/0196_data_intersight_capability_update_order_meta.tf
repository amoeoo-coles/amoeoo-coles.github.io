# Sample data source intersight_capability_update_order_meta — reads ../models/data_intersight_capability_update_order_meta.yml
locals { m196 = yamldecode(file("${path.module}/../models/data_intersight_capability_update_order_meta.yml"))["data_intersight_capability_update_order_meta"] }

data "intersight_capability_update_order_meta" "n196" {
  account_moid = try(local.m196["account_moid"], null)
  additional_properties = try(local.m196["additional_properties"], null)
  category = try(local.m196["category"], null)
  class_id = try(local.m196["class_id"], null)
  create_time = try(local.m196["create_time"], null)
  description = try(local.m196["description"], null)
  domain_group_moid = try(local.m196["domain_group_moid"], null)
  id = try(local.m196["id"], null)
  mod_time = try(local.m196["mod_time"], null)
  moid = try(local.m196["moid"], null)
  name = try(local.m196["name"], null)
  object_type = try(local.m196["object_type"], null)
  owners = try(local.m196["owners"], null)
  platform_tag = try(local.m196["platform_tag"], null)
  results = try(local.m196["results"], null)
  shared_scope = try(local.m196["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m196["ancestors"], null) == null ? [] : local.m196["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m196["parent"], null) == null ? [] : local.m196["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m196["permission_resources"], null) == null ? [] : local.m196["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m196["tags"], null) == null ? [] : local.m196["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "update_order" {
    for_each = try(local.m196["update_order"], null) == null ? [] : local.m196["update_order"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m196["version_context"], null) == null ? [] : local.m196["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
