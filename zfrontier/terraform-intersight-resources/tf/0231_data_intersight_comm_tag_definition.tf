# Sample data source intersight_comm_tag_definition — reads ../models/data_intersight_comm_tag_definition.yml
locals { m231 = yamldecode(file("${path.module}/../models/data_intersight_comm_tag_definition.yml"))["data_intersight_comm_tag_definition"] }

data "intersight_comm_tag_definition" "n231" {
  account_moid = try(local.m231["account_moid"], null)
  additional_properties = try(local.m231["additional_properties"], null)
  allowed_values = try(local.m231["allowed_values"], null)
  class_id = try(local.m231["class_id"], null)
  create_time = try(local.m231["create_time"], null)
  domain_group_moid = try(local.m231["domain_group_moid"], null)
  enable_propagation = try(local.m231["enable_propagation"], null)
  id = try(local.m231["id"], null)
  key = try(var.secrets["data_intersight_comm_tag_definition.key"], local.m231["key"])
  mod_time = try(local.m231["mod_time"], null)
  moid = try(local.m231["moid"], null)
  object_type = try(local.m231["object_type"], null)
  owners = try(local.m231["owners"], null)
  restrict_allowed_values = try(local.m231["restrict_allowed_values"], null)
  results = try(local.m231["results"], null)
  shared_scope = try(local.m231["shared_scope"], null)
  sys_tag = try(local.m231["sys_tag"], null)
  type = try(local.m231["type"], null)
  dynamic "account" {
    for_each = try(local.m231["account"], null) == null ? [] : local.m231["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m231["ancestors"], null) == null ? [] : local.m231["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m231["parent"], null) == null ? [] : local.m231["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_tag" {
    for_each = try(local.m231["parent_tag"], null) == null ? [] : local.m231["parent_tag"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m231["permission_resources"], null) == null ? [] : local.m231["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m231["tags"], null) == null ? [] : local.m231["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usage" {
    for_each = try(local.m231["usage"], null) == null ? [] : local.m231["usage"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m231["version_context"], null) == null ? [] : local.m231["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
