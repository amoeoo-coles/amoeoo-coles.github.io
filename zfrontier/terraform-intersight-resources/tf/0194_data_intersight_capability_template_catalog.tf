# Sample data source intersight_capability_template_catalog — reads ../models/data_intersight_capability_template_catalog.yml
locals { m194 = yamldecode(file("${path.module}/../models/data_intersight_capability_template_catalog.yml"))["data_intersight_capability_template_catalog"] }

data "intersight_capability_template_catalog" "n194" {
  account_moid = try(local.m194["account_moid"], null)
  additional_properties = try(local.m194["additional_properties"], null)
  allowed_override_list = try(local.m194["allowed_override_list"], null)
  class_id = try(local.m194["class_id"], null)
  create_time = try(local.m194["create_time"], null)
  domain_group_moid = try(local.m194["domain_group_moid"], null)
  id = try(local.m194["id"], null)
  mod_time = try(local.m194["mod_time"], null)
  moid = try(local.m194["moid"], null)
  name = try(local.m194["name"], null)
  object_type = try(local.m194["object_type"], null)
  owners = try(local.m194["owners"], null)
  results = try(local.m194["results"], null)
  shared_scope = try(local.m194["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m194["ancestors"], null) == null ? [] : local.m194["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m194["parent"], null) == null ? [] : local.m194["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m194["permission_resources"], null) == null ? [] : local.m194["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m194["tags"], null) == null ? [] : local.m194["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m194["version_context"], null) == null ? [] : local.m194["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
