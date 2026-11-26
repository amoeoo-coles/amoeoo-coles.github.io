# Sample data source intersight_hyperflex_feature_limit_internal — reads ../models/data_intersight_hyperflex_feature_limit_internal.yml
locals { m602 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_feature_limit_internal.yml"))["data_intersight_hyperflex_feature_limit_internal"] }

data "intersight_hyperflex_feature_limit_internal" "n602" {
  account_moid = try(local.m602["account_moid"], null)
  additional_properties = try(local.m602["additional_properties"], null)
  class_id = try(local.m602["class_id"], null)
  create_time = try(local.m602["create_time"], null)
  domain_group_moid = try(local.m602["domain_group_moid"], null)
  id = try(local.m602["id"], null)
  mod_time = try(local.m602["mod_time"], null)
  moid = try(local.m602["moid"], null)
  object_type = try(local.m602["object_type"], null)
  owners = try(local.m602["owners"], null)
  results = try(local.m602["results"], null)
  shared_scope = try(local.m602["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m602["ancestors"], null) == null ? [] : local.m602["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m602["app_catalog"], null) == null ? [] : local.m602["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "feature_limit_entries" {
    for_each = try(local.m602["feature_limit_entries"], null) == null ? [] : local.m602["feature_limit_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m602["parent"], null) == null ? [] : local.m602["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m602["permission_resources"], null) == null ? [] : local.m602["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m602["tags"], null) == null ? [] : local.m602["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m602["version_context"], null) == null ? [] : local.m602["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
