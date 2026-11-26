# Sample data source intersight_compute_scrub_policy — reads ../models/data_intersight_compute_scrub_policy.yml
locals { m247 = yamldecode(file("${path.module}/../models/data_intersight_compute_scrub_policy.yml"))["data_intersight_compute_scrub_policy"] }

data "intersight_compute_scrub_policy" "n247" {
  account_moid = try(local.m247["account_moid"], null)
  additional_properties = try(local.m247["additional_properties"], null)
  class_id = try(local.m247["class_id"], null)
  create_time = try(local.m247["create_time"], null)
  description = try(local.m247["description"], null)
  domain_group_moid = try(local.m247["domain_group_moid"], null)
  id = try(local.m247["id"], null)
  mod_time = try(local.m247["mod_time"], null)
  moid = try(local.m247["moid"], null)
  name = try(local.m247["name"], null)
  object_type = try(local.m247["object_type"], null)
  owners = try(local.m247["owners"], null)
  results = try(local.m247["results"], null)
  scrub_targets = try(local.m247["scrub_targets"], null)
  shared_scope = try(local.m247["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m247["ancestors"], null) == null ? [] : local.m247["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m247["organization"], null) == null ? [] : local.m247["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m247["parent"], null) == null ? [] : local.m247["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m247["permission_resources"], null) == null ? [] : local.m247["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m247["profiles"], null) == null ? [] : local.m247["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m247["tags"], null) == null ? [] : local.m247["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m247["version_context"], null) == null ? [] : local.m247["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
