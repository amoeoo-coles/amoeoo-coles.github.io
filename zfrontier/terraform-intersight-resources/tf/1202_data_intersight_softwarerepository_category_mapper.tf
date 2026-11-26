# Sample data source intersight_softwarerepository_category_mapper — reads ../models/data_intersight_softwarerepository_category_mapper.yml
locals { m1202 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_category_mapper.yml"))["data_intersight_softwarerepository_category_mapper"] }

data "intersight_softwarerepository_category_mapper" "n1202" {
  account_moid = try(local.m1202["account_moid"], null)
  additional_properties = try(local.m1202["additional_properties"], null)
  category = try(local.m1202["category"], null)
  class_id = try(local.m1202["class_id"], null)
  create_time = try(local.m1202["create_time"], null)
  domain_group_moid = try(local.m1202["domain_group_moid"], null)
  file_type = try(local.m1202["file_type"], null)
  id = try(local.m1202["id"], null)
  image_type = try(local.m1202["image_type"], null)
  is_nfs_upgrade_supported = try(local.m1202["is_nfs_upgrade_supported"], null)
  mdf_id = try(local.m1202["mdf_id"], null)
  mod_time = try(local.m1202["mod_time"], null)
  moid = try(local.m1202["moid"], null)
  name = try(local.m1202["name"], null)
  nr_source = try(local.m1202["nr_source"], null)
  nr_version = try(local.m1202["nr_version"], null)
  object_type = try(local.m1202["object_type"], null)
  owners = try(local.m1202["owners"], null)
  regex_pattern = try(local.m1202["regex_pattern"], null)
  results = try(local.m1202["results"], null)
  shared_scope = try(local.m1202["shared_scope"], null)
  supported_models = try(local.m1202["supported_models"], null)
  sw_id = try(local.m1202["sw_id"], null)
  tag_types = try(local.m1202["tag_types"], null)
  dynamic "ancestors" {
    for_each = try(local.m1202["ancestors"], null) == null ? [] : local.m1202["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1202["parent"], null) == null ? [] : local.m1202["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1202["permission_resources"], null) == null ? [] : local.m1202["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1202["tags"], null) == null ? [] : local.m1202["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1202["version_context"], null) == null ? [] : local.m1202["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
