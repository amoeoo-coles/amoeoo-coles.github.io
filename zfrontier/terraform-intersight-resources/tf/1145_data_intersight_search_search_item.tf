# Sample data source intersight_search_search_item — reads ../models/data_intersight_search_search_item.yml
locals { m1145 = yamldecode(file("${path.module}/../models/data_intersight_search_search_item.yml"))["data_intersight_search_search_item"] }

data "intersight_search_search_item" "n1145" {
  account_moid = try(local.m1145["account_moid"], null)
  additional_properties = try(local.m1145["additional_properties"], null)
  class_id = try(local.m1145["class_id"], null)
  create_time = try(local.m1145["create_time"], null)
  domain_group_moid = try(local.m1145["domain_group_moid"], null)
  id = try(local.m1145["id"], null)
  mod_time = try(local.m1145["mod_time"], null)
  moid = try(local.m1145["moid"], null)
  object_type = try(local.m1145["object_type"], null)
  owners = try(local.m1145["owners"], null)
  results = try(local.m1145["results"], null)
  shared_scope = try(local.m1145["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1145["ancestors"], null) == null ? [] : local.m1145["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1145["parent"], null) == null ? [] : local.m1145["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1145["permission_resources"], null) == null ? [] : local.m1145["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1145["tags"], null) == null ? [] : local.m1145["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1145["version_context"], null) == null ? [] : local.m1145["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
