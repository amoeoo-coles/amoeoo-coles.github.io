# Sample data source intersight_resource_group — reads ../models/data_intersight_resource_group.yml
locals { m1111 = yamldecode(file("${path.module}/../models/data_intersight_resource_group.yml"))["data_intersight_resource_group"] }

data "intersight_resource_group" "n1111" {
  account_moid = try(local.m1111["account_moid"], null)
  additional_properties = try(local.m1111["additional_properties"], null)
  class_id = try(local.m1111["class_id"], null)
  create_time = try(local.m1111["create_time"], null)
  description = try(local.m1111["description"], null)
  domain_group_moid = try(local.m1111["domain_group_moid"], null)
  id = try(local.m1111["id"], null)
  mod_time = try(local.m1111["mod_time"], null)
  moid = try(local.m1111["moid"], null)
  name = try(local.m1111["name"], null)
  object_type = try(local.m1111["object_type"], null)
  owners = try(local.m1111["owners"], null)
  qualifier = try(local.m1111["qualifier"], null)
  reevaluate = try(local.m1111["reevaluate"], null)
  results = try(local.m1111["results"], null)
  shared_scope = try(local.m1111["shared_scope"], null)
  type = try(local.m1111["type"], null)
  dynamic "account" {
    for_each = try(local.m1111["account"], null) == null ? [] : local.m1111["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1111["ancestors"], null) == null ? [] : local.m1111["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exported_selectors" {
    for_each = try(local.m1111["exported_selectors"], null) == null ? [] : local.m1111["exported_selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organizations" {
    for_each = try(local.m1111["organizations"], null) == null ? [] : local.m1111["organizations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1111["parent"], null) == null ? [] : local.m1111["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "per_type_combined_selector" {
    for_each = try(local.m1111["per_type_combined_selector"], null) == null ? [] : local.m1111["per_type_combined_selector"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1111["permission_resources"], null) == null ? [] : local.m1111["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selectors" {
    for_each = try(local.m1111["selectors"], null) == null ? [] : local.m1111["selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1111["tags"], null) == null ? [] : local.m1111["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1111["version_context"], null) == null ? [] : local.m1111["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
