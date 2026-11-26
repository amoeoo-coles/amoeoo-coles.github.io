# Sample data source intersight_softwarerepository_category_unsupported_models — reads ../models/data_intersight_softwarerepository_category_unsupported_models.yml
locals { m1205 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_category_unsupported_models.yml"))["data_intersight_softwarerepository_category_unsupported_models"] }

data "intersight_softwarerepository_category_unsupported_models" "n1205" {
  account_moid = try(local.m1205["account_moid"], null)
  additional_properties = try(local.m1205["additional_properties"], null)
  class_id = try(local.m1205["class_id"], null)
  create_time = try(local.m1205["create_time"], null)
  domain_group_moid = try(local.m1205["domain_group_moid"], null)
  id = try(local.m1205["id"], null)
  mdf_id = try(local.m1205["mdf_id"], null)
  mod_time = try(local.m1205["mod_time"], null)
  moid = try(local.m1205["moid"], null)
  name = try(local.m1205["name"], null)
  object_type = try(local.m1205["object_type"], null)
  owners = try(local.m1205["owners"], null)
  results = try(local.m1205["results"], null)
  shared_scope = try(local.m1205["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1205["ancestors"], null) == null ? [] : local.m1205["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "model_constraint" {
    for_each = try(local.m1205["model_constraint"], null) == null ? [] : local.m1205["model_constraint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1205["parent"], null) == null ? [] : local.m1205["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1205["permission_resources"], null) == null ? [] : local.m1205["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1205["tags"], null) == null ? [] : local.m1205["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1205["version_context"], null) == null ? [] : local.m1205["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
