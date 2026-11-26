# Sample data source intersight_meta_definition — reads ../models/data_intersight_meta_definition.yml
locals { m839 = yamldecode(file("${path.module}/../models/data_intersight_meta_definition.yml"))["data_intersight_meta_definition"] }

data "intersight_meta_definition" "n839" {
  account_moid = try(local.m839["account_moid"], null)
  additional_properties = try(local.m839["additional_properties"], null)
  ancestor_classes = try(local.m839["ancestor_classes"], null)
  class_id = try(local.m839["class_id"], null)
  create_time = try(local.m839["create_time"], null)
  domain_group_moid = try(local.m839["domain_group_moid"], null)
  enable_previous_mo = try(local.m839["enable_previous_mo"], null)
  id = try(local.m839["id"], null)
  is_concrete = try(local.m839["is_concrete"], null)
  meta_type = try(local.m839["meta_type"], null)
  mod_time = try(local.m839["mod_time"], null)
  moid = try(local.m839["moid"], null)
  name = try(local.m839["name"], null)
  namespace = try(local.m839["namespace"], null)
  nr_version = try(local.m839["nr_version"], null)
  object_type = try(local.m839["object_type"], null)
  owner = try(local.m839["owner"], null)
  owners = try(local.m839["owners"], null)
  parent_class = try(local.m839["parent_class"], null)
  permission_supported = try(local.m839["permission_supported"], null)
  rbac_resource = try(local.m839["rbac_resource"], null)
  resource_pool_types = try(local.m839["resource_pool_types"], null)
  rest_path = try(local.m839["rest_path"], null)
  results = try(local.m839["results"], null)
  shared_scope = try(local.m839["shared_scope"], null)
  dynamic "access_privileges" {
    for_each = try(local.m839["access_privileges"], null) == null ? [] : local.m839["access_privileges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m839["ancestors"], null) == null ? [] : local.m839["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "display_name_metas" {
    for_each = try(local.m839["display_name_metas"], null) == null ? [] : local.m839["display_name_metas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "identity_constraints" {
    for_each = try(local.m839["identity_constraints"], null) == null ? [] : local.m839["identity_constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m839["parent"], null) == null ? [] : local.m839["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m839["permission_resources"], null) == null ? [] : local.m839["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "properties" {
    for_each = try(local.m839["properties"], null) == null ? [] : local.m839["properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "relationships" {
    for_each = try(local.m839["relationships"], null) == null ? [] : local.m839["relationships"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m839["tags"], null) == null ? [] : local.m839["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m839["version_context"], null) == null ? [] : local.m839["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
