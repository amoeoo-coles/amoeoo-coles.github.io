# Sample data source intersight_hyperflex_feature_limit_external — reads ../models/data_intersight_hyperflex_feature_limit_external.yml
locals { m601 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_feature_limit_external.yml"))["data_intersight_hyperflex_feature_limit_external"] }

data "intersight_hyperflex_feature_limit_external" "n601" {
  account_moid = try(local.m601["account_moid"], null)
  additional_properties = try(local.m601["additional_properties"], null)
  class_id = try(local.m601["class_id"], null)
  create_time = try(local.m601["create_time"], null)
  domain_group_moid = try(local.m601["domain_group_moid"], null)
  id = try(local.m601["id"], null)
  mod_time = try(local.m601["mod_time"], null)
  moid = try(local.m601["moid"], null)
  object_type = try(local.m601["object_type"], null)
  owners = try(local.m601["owners"], null)
  results = try(local.m601["results"], null)
  shared_scope = try(local.m601["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m601["ancestors"], null) == null ? [] : local.m601["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m601["app_catalog"], null) == null ? [] : local.m601["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "feature_limit_entries" {
    for_each = try(local.m601["feature_limit_entries"], null) == null ? [] : local.m601["feature_limit_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m601["parent"], null) == null ? [] : local.m601["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m601["permission_resources"], null) == null ? [] : local.m601["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m601["tags"], null) == null ? [] : local.m601["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m601["version_context"], null) == null ? [] : local.m601["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
