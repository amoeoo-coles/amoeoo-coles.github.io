# Sample data source intersight_hyperflex_capability_info — reads ../models/data_intersight_hyperflex_capability_info.yml
locals { m581 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_capability_info.yml"))["data_intersight_hyperflex_capability_info"] }

data "intersight_hyperflex_capability_info" "n581" {
  account_moid = try(local.m581["account_moid"], null)
  additional_properties = try(local.m581["additional_properties"], null)
  class_id = try(local.m581["class_id"], null)
  create_time = try(local.m581["create_time"], null)
  domain_group_moid = try(local.m581["domain_group_moid"], null)
  id = try(local.m581["id"], null)
  mod_time = try(local.m581["mod_time"], null)
  moid = try(local.m581["moid"], null)
  name = try(local.m581["name"], null)
  object_type = try(local.m581["object_type"], null)
  owners = try(local.m581["owners"], null)
  results = try(local.m581["results"], null)
  shared_scope = try(local.m581["shared_scope"], null)
  value = try(local.m581["value"], null)
  dynamic "ancestors" {
    for_each = try(local.m581["ancestors"], null) == null ? [] : local.m581["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m581["app_catalog"], null) == null ? [] : local.m581["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capability_constraints" {
    for_each = try(local.m581["capability_constraints"], null) == null ? [] : local.m581["capability_constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m581["parent"], null) == null ? [] : local.m581["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m581["permission_resources"], null) == null ? [] : local.m581["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m581["tags"], null) == null ? [] : local.m581["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m581["version_context"], null) == null ? [] : local.m581["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
