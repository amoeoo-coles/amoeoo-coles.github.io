# Sample data source intersight_appliance_release_note — reads ../models/data_intersight_appliance_release_note.yml
locals { m073 = yamldecode(file("${path.module}/../models/data_intersight_appliance_release_note.yml"))["data_intersight_appliance_release_note"] }

data "intersight_appliance_release_note" "n073" {
  account_moid = try(local.m073["account_moid"], null)
  additional_properties = try(local.m073["additional_properties"], null)
  class_id = try(local.m073["class_id"], null)
  create_time = try(local.m073["create_time"], null)
  domain_group_moid = try(local.m073["domain_group_moid"], null)
  id = try(local.m073["id"], null)
  mod_time = try(local.m073["mod_time"], null)
  moid = try(local.m073["moid"], null)
  nr_version = try(local.m073["nr_version"], null)
  object_type = try(local.m073["object_type"], null)
  owners = try(local.m073["owners"], null)
  results = try(local.m073["results"], null)
  shared_scope = try(local.m073["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m073["ancestors"], null) == null ? [] : local.m073["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "notes" {
    for_each = try(local.m073["notes"], null) == null ? [] : local.m073["notes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m073["parent"], null) == null ? [] : local.m073["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m073["permission_resources"], null) == null ? [] : local.m073["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m073["tags"], null) == null ? [] : local.m073["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m073["version_context"], null) == null ? [] : local.m073["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
