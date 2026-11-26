# Sample data source intersight_capability_chassis_descriptor — reads ../models/data_intersight_capability_chassis_descriptor.yml
locals { m148 = yamldecode(file("${path.module}/../models/data_intersight_capability_chassis_descriptor.yml"))["data_intersight_capability_chassis_descriptor"] }

data "intersight_capability_chassis_descriptor" "n148" {
  account_moid = try(local.m148["account_moid"], null)
  additional_properties = try(local.m148["additional_properties"], null)
  class_id = try(local.m148["class_id"], null)
  create_time = try(local.m148["create_time"], null)
  description = try(local.m148["description"], null)
  domain_group_moid = try(local.m148["domain_group_moid"], null)
  id = try(local.m148["id"], null)
  mod_time = try(local.m148["mod_time"], null)
  model = try(local.m148["model"], null)
  moid = try(local.m148["moid"], null)
  nr_version = try(local.m148["nr_version"], null)
  object_type = try(local.m148["object_type"], null)
  owners = try(local.m148["owners"], null)
  results = try(local.m148["results"], null)
  revision = try(local.m148["revision"], null)
  shared_scope = try(local.m148["shared_scope"], null)
  vendor = try(local.m148["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m148["ancestors"], null) == null ? [] : local.m148["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m148["capabilities"], null) == null ? [] : local.m148["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m148["parent"], null) == null ? [] : local.m148["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m148["permission_resources"], null) == null ? [] : local.m148["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m148["tags"], null) == null ? [] : local.m148["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m148["version_context"], null) == null ? [] : local.m148["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
