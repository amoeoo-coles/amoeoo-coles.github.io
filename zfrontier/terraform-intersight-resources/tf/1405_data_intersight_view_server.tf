# Sample data source intersight_view_server — reads ../models/data_intersight_view_server.yml
locals { m1405 = yamldecode(file("${path.module}/../models/data_intersight_view_server.yml"))["data_intersight_view_server"] }

data "intersight_view_server" "n1405" {
  account_moid = try(local.m1405["account_moid"], null)
  additional_properties = try(local.m1405["additional_properties"], null)
  class_id = try(local.m1405["class_id"], null)
  create_time = try(local.m1405["create_time"], null)
  domain_group_moid = try(local.m1405["domain_group_moid"], null)
  id = try(local.m1405["id"], null)
  mod_time = try(local.m1405["mod_time"], null)
  moid = try(local.m1405["moid"], null)
  object_type = try(local.m1405["object_type"], null)
  owners = try(local.m1405["owners"], null)
  results = try(local.m1405["results"], null)
  shared_scope = try(local.m1405["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1405["ancestors"], null) == null ? [] : local.m1405["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1405["parent"], null) == null ? [] : local.m1405["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1405["permission_resources"], null) == null ? [] : local.m1405["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1405["tags"], null) == null ? [] : local.m1405["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1405["version_context"], null) == null ? [] : local.m1405["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
