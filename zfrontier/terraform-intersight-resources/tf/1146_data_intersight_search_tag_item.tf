# Sample data source intersight_search_tag_item — reads ../models/data_intersight_search_tag_item.yml
locals { m1146 = yamldecode(file("${path.module}/../models/data_intersight_search_tag_item.yml"))["data_intersight_search_tag_item"] }

data "intersight_search_tag_item" "n1146" {
  account_moid = try(local.m1146["account_moid"], null)
  account_moids = try(local.m1146["account_moids"], null)
  additional_properties = try(local.m1146["additional_properties"], null)
  class_id = try(local.m1146["class_id"], null)
  create_time = try(local.m1146["create_time"], null)
  domain_group_moid = try(local.m1146["domain_group_moid"], null)
  id = try(local.m1146["id"], null)
  key = try(var.secrets["data_intersight_search_tag_item.key"], local.m1146["key"])
  mod_time = try(local.m1146["mod_time"], null)
  moid = try(local.m1146["moid"], null)
  nr_count = try(local.m1146["nr_count"], null)
  object_type = try(local.m1146["object_type"], null)
  owners = try(local.m1146["owners"], null)
  results = try(local.m1146["results"], null)
  shared_scope = try(local.m1146["shared_scope"], null)
  tagged_object_types = try(local.m1146["tagged_object_types"], null)
  type = try(local.m1146["type"], null)
  values = try(local.m1146["values"], null)
  dynamic "ancestors" {
    for_each = try(local.m1146["ancestors"], null) == null ? [] : local.m1146["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1146["parent"], null) == null ? [] : local.m1146["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1146["permission_resources"], null) == null ? [] : local.m1146["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1146["tags"], null) == null ? [] : local.m1146["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1146["version_context"], null) == null ? [] : local.m1146["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
