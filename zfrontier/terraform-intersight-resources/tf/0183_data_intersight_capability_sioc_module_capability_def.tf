# Sample data source intersight_capability_sioc_module_capability_def — reads ../models/data_intersight_capability_sioc_module_capability_def.yml
locals { m183 = yamldecode(file("${path.module}/../models/data_intersight_capability_sioc_module_capability_def.yml"))["data_intersight_capability_sioc_module_capability_def"] }

data "intersight_capability_sioc_module_capability_def" "n183" {
  account_moid = try(local.m183["account_moid"], null)
  additional_properties = try(local.m183["additional_properties"], null)
  class_id = try(local.m183["class_id"], null)
  create_time = try(local.m183["create_time"], null)
  dc_supported = try(local.m183["dc_supported"], null)
  domain_group_moid = try(local.m183["domain_group_moid"], null)
  id = try(local.m183["id"], null)
  mod_time = try(local.m183["mod_time"], null)
  moid = try(local.m183["moid"], null)
  name = try(local.m183["name"], null)
  object_type = try(local.m183["object_type"], null)
  owners = try(local.m183["owners"], null)
  results = try(local.m183["results"], null)
  shared_scope = try(local.m183["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m183["ancestors"], null) == null ? [] : local.m183["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m183["parent"], null) == null ? [] : local.m183["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m183["permission_resources"], null) == null ? [] : local.m183["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m183["tags"], null) == null ? [] : local.m183["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m183["version_context"], null) == null ? [] : local.m183["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
