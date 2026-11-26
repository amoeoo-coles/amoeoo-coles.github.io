# Sample data source intersight_capability_server_actions_meta — reads ../models/data_intersight_capability_server_actions_meta.yml
locals { m176 = yamldecode(file("${path.module}/../models/data_intersight_capability_server_actions_meta.yml"))["data_intersight_capability_server_actions_meta"] }

data "intersight_capability_server_actions_meta" "n176" {
  account_moid = try(local.m176["account_moid"], null)
  action_name = try(local.m176["action_name"], null)
  additional_properties = try(local.m176["additional_properties"], null)
  class_id = try(local.m176["class_id"], null)
  create_time = try(local.m176["create_time"], null)
  domain_group_moid = try(local.m176["domain_group_moid"], null)
  id = try(local.m176["id"], null)
  min_supported_version = try(local.m176["min_supported_version"], null)
  mod_time = try(local.m176["mod_time"], null)
  moid = try(local.m176["moid"], null)
  name = try(local.m176["name"], null)
  object_type = try(local.m176["object_type"], null)
  owners = try(local.m176["owners"], null)
  results = try(local.m176["results"], null)
  shared_scope = try(local.m176["shared_scope"], null)
  target_type = try(local.m176["target_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m176["ancestors"], null) == null ? [] : local.m176["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m176["parent"], null) == null ? [] : local.m176["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m176["permission_resources"], null) == null ? [] : local.m176["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m176["tags"], null) == null ? [] : local.m176["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m176["version_context"], null) == null ? [] : local.m176["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
