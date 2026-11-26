# Sample data source intersight_aaa_retention_config — reads ../models/data_intersight_aaa_retention_config.yml
locals { m003 = yamldecode(file("${path.module}/../models/data_intersight_aaa_retention_config.yml"))["data_intersight_aaa_retention_config"] }

data "intersight_aaa_retention_config" "n003" {
  account_moid = try(local.m003["account_moid"], null)
  additional_properties = try(local.m003["additional_properties"], null)
  class_id = try(local.m003["class_id"], null)
  create_time = try(local.m003["create_time"], null)
  domain_group_moid = try(local.m003["domain_group_moid"], null)
  id = try(local.m003["id"], null)
  mod_time = try(local.m003["mod_time"], null)
  moid = try(local.m003["moid"], null)
  object_type = try(local.m003["object_type"], null)
  owners = try(local.m003["owners"], null)
  results = try(local.m003["results"], null)
  retention_period = try(local.m003["retention_period"], null)
  shared_scope = try(local.m003["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m003["ancestors"], null) == null ? [] : local.m003["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m003["parent"], null) == null ? [] : local.m003["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m003["permission_resources"], null) == null ? [] : local.m003["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m003["tags"], null) == null ? [] : local.m003["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m003["version_context"], null) == null ? [] : local.m003["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
