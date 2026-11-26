# Sample data source intersight_capability_switch_upgrade_support_meta — reads ../models/data_intersight_capability_switch_upgrade_support_meta.yml
locals { m193 = yamldecode(file("${path.module}/../models/data_intersight_capability_switch_upgrade_support_meta.yml"))["data_intersight_capability_switch_upgrade_support_meta"] }

data "intersight_capability_switch_upgrade_support_meta" "n193" {
  account_moid = try(local.m193["account_moid"], null)
  additional_properties = try(local.m193["additional_properties"], null)
  class_id = try(local.m193["class_id"], null)
  create_time = try(local.m193["create_time"], null)
  description = try(local.m193["description"], null)
  domain_group_moid = try(local.m193["domain_group_moid"], null)
  id = try(local.m193["id"], null)
  max_version = try(local.m193["max_version"], null)
  min_version = try(local.m193["min_version"], null)
  mod_time = try(local.m193["mod_time"], null)
  moid = try(local.m193["moid"], null)
  name = try(local.m193["name"], null)
  object_type = try(local.m193["object_type"], null)
  owners = try(local.m193["owners"], null)
  results = try(local.m193["results"], null)
  series_id = try(local.m193["series_id"], null)
  shared_scope = try(local.m193["shared_scope"], null)
  supported_models = try(local.m193["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m193["ancestors"], null) == null ? [] : local.m193["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m193["parent"], null) == null ? [] : local.m193["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m193["permission_resources"], null) == null ? [] : local.m193["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m193["tags"], null) == null ? [] : local.m193["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m193["version_context"], null) == null ? [] : local.m193["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
