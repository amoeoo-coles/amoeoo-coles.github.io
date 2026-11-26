# Sample data source intersight_softwarerepository_category_mapper_model — reads ../models/data_intersight_softwarerepository_category_mapper_model.yml
locals { m1203 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_category_mapper_model.yml"))["data_intersight_softwarerepository_category_mapper_model"] }

data "intersight_softwarerepository_category_mapper_model" "n1203" {
  account_moid = try(local.m1203["account_moid"], null)
  additional_properties = try(local.m1203["additional_properties"], null)
  category = try(local.m1203["category"], null)
  class_id = try(local.m1203["class_id"], null)
  create_time = try(local.m1203["create_time"], null)
  dist_tag = try(local.m1203["dist_tag"], null)
  domain_group_moid = try(local.m1203["domain_group_moid"], null)
  id = try(local.m1203["id"], null)
  image_type = try(local.m1203["image_type"], null)
  is_nfs_upgrade_supported = try(local.m1203["is_nfs_upgrade_supported"], null)
  mod_time = try(local.m1203["mod_time"], null)
  moid = try(local.m1203["moid"], null)
  name = try(local.m1203["name"], null)
  object_type = try(local.m1203["object_type"], null)
  owners = try(local.m1203["owners"], null)
  regex_pattern = try(local.m1203["regex_pattern"], null)
  results = try(local.m1203["results"], null)
  series_id = try(local.m1203["series_id"], null)
  shared_scope = try(local.m1203["shared_scope"], null)
  supported_models = try(local.m1203["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m1203["ancestors"], null) == null ? [] : local.m1203["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1203["parent"], null) == null ? [] : local.m1203["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1203["permission_resources"], null) == null ? [] : local.m1203["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1203["tags"], null) == null ? [] : local.m1203["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1203["version_context"], null) == null ? [] : local.m1203["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
