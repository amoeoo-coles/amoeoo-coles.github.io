# Sample data source intersight_softwarerepository_release — reads ../models/data_intersight_softwarerepository_release.yml
locals { m1208 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_release.yml"))["data_intersight_softwarerepository_release"] }

data "intersight_softwarerepository_release" "n1208" {
  account_moid = try(local.m1208["account_moid"], null)
  additional_properties = try(local.m1208["additional_properties"], null)
  class_id = try(local.m1208["class_id"], null)
  create_time = try(local.m1208["create_time"], null)
  domain_group_moid = try(local.m1208["domain_group_moid"], null)
  id = try(local.m1208["id"], null)
  mod_time = try(local.m1208["mod_time"], null)
  moid = try(local.m1208["moid"], null)
  nr_version = try(local.m1208["nr_version"], null)
  object_type = try(local.m1208["object_type"], null)
  owners = try(local.m1208["owners"], null)
  release_date = try(local.m1208["release_date"], null)
  release_notes_url = try(local.m1208["release_notes_url"], null)
  results = try(local.m1208["results"], null)
  shared_scope = try(local.m1208["shared_scope"], null)
  supported_models = try(local.m1208["supported_models"], null)
  type = try(local.m1208["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1208["ancestors"], null) == null ? [] : local.m1208["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1208["catalog"], null) == null ? [] : local.m1208["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1208["parent"], null) == null ? [] : local.m1208["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1208["permission_resources"], null) == null ? [] : local.m1208["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1208["tags"], null) == null ? [] : local.m1208["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1208["version_context"], null) == null ? [] : local.m1208["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
