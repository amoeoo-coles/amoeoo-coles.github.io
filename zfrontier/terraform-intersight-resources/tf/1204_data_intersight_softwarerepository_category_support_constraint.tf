# Sample data source intersight_softwarerepository_category_support_constraint — reads ../models/data_intersight_softwarerepository_category_support_constraint.yml
locals { m1204 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_category_support_constraint.yml"))["data_intersight_softwarerepository_category_support_constraint"] }

data "intersight_softwarerepository_category_support_constraint" "n1204" {
  account_moid = try(local.m1204["account_moid"], null)
  additional_properties = try(local.m1204["additional_properties"], null)
  class_id = try(local.m1204["class_id"], null)
  constraint_id = try(local.m1204["constraint_id"], null)
  create_time = try(local.m1204["create_time"], null)
  domain_group_moid = try(local.m1204["domain_group_moid"], null)
  id = try(local.m1204["id"], null)
  mdf_id = try(local.m1204["mdf_id"], null)
  min_version = try(local.m1204["min_version"], null)
  mod_time = try(local.m1204["mod_time"], null)
  moid = try(local.m1204["moid"], null)
  name = try(local.m1204["name"], null)
  object_type = try(local.m1204["object_type"], null)
  owners = try(local.m1204["owners"], null)
  parse_from_image_name = try(local.m1204["parse_from_image_name"], null)
  results = try(local.m1204["results"], null)
  shared_scope = try(local.m1204["shared_scope"], null)
  supported_models = try(local.m1204["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m1204["ancestors"], null) == null ? [] : local.m1204["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "filtered_models" {
    for_each = try(local.m1204["filtered_models"], null) == null ? [] : local.m1204["filtered_models"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1204["parent"], null) == null ? [] : local.m1204["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1204["permission_resources"], null) == null ? [] : local.m1204["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1204["tags"], null) == null ? [] : local.m1204["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1204["version_context"], null) == null ? [] : local.m1204["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
