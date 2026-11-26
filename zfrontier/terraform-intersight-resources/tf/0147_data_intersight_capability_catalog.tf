# Sample data source intersight_capability_catalog — reads ../models/data_intersight_capability_catalog.yml
locals { m147 = yamldecode(file("${path.module}/../models/data_intersight_capability_catalog.yml"))["data_intersight_capability_catalog"] }

data "intersight_capability_catalog" "n147" {
  account_moid = try(local.m147["account_moid"], null)
  additional_properties = try(local.m147["additional_properties"], null)
  class_id = try(local.m147["class_id"], null)
  create_time = try(local.m147["create_time"], null)
  domain_group_moid = try(local.m147["domain_group_moid"], null)
  id = try(local.m147["id"], null)
  mod_time = try(local.m147["mod_time"], null)
  moid = try(local.m147["moid"], null)
  name = try(local.m147["name"], null)
  object_type = try(local.m147["object_type"], null)
  owners = try(local.m147["owners"], null)
  results = try(local.m147["results"], null)
  shared_scope = try(local.m147["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m147["ancestors"], null) == null ? [] : local.m147["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m147["organization"], null) == null ? [] : local.m147["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m147["parent"], null) == null ? [] : local.m147["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m147["permission_resources"], null) == null ? [] : local.m147["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m147["tags"], null) == null ? [] : local.m147["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m147["version_context"], null) == null ? [] : local.m147["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
