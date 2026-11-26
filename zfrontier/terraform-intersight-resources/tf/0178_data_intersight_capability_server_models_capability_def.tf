# Sample data source intersight_capability_server_models_capability_def — reads ../models/data_intersight_capability_server_models_capability_def.yml
locals { m178 = yamldecode(file("${path.module}/../models/data_intersight_capability_server_models_capability_def.yml"))["data_intersight_capability_server_models_capability_def"] }

data "intersight_capability_server_models_capability_def" "n178" {
  account_moid = try(local.m178["account_moid"], null)
  additional_properties = try(local.m178["additional_properties"], null)
  class_id = try(local.m178["class_id"], null)
  create_time = try(local.m178["create_time"], null)
  domain_group_moid = try(local.m178["domain_group_moid"], null)
  id = try(local.m178["id"], null)
  mod_time = try(local.m178["mod_time"], null)
  models = try(local.m178["models"], null)
  moid = try(local.m178["moid"], null)
  name = try(local.m178["name"], null)
  object_type = try(local.m178["object_type"], null)
  owners = try(local.m178["owners"], null)
  results = try(local.m178["results"], null)
  server_type = try(local.m178["server_type"], null)
  shared_scope = try(local.m178["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m178["ancestors"], null) == null ? [] : local.m178["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m178["parent"], null) == null ? [] : local.m178["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m178["permission_resources"], null) == null ? [] : local.m178["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m178["tags"], null) == null ? [] : local.m178["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m178["version_context"], null) == null ? [] : local.m178["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
