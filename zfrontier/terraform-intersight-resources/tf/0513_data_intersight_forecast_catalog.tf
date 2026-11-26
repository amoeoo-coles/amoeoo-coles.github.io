# Sample data source intersight_forecast_catalog — reads ../models/data_intersight_forecast_catalog.yml
locals { m513 = yamldecode(file("${path.module}/../models/data_intersight_forecast_catalog.yml"))["data_intersight_forecast_catalog"] }

data "intersight_forecast_catalog" "n513" {
  account_moid = try(local.m513["account_moid"], null)
  additional_properties = try(local.m513["additional_properties"], null)
  class_id = try(local.m513["class_id"], null)
  create_time = try(local.m513["create_time"], null)
  domain_group_moid = try(local.m513["domain_group_moid"], null)
  id = try(local.m513["id"], null)
  mod_time = try(local.m513["mod_time"], null)
  moid = try(local.m513["moid"], null)
  nr_version = try(local.m513["nr_version"], null)
  object_type = try(local.m513["object_type"], null)
  owners = try(local.m513["owners"], null)
  results = try(local.m513["results"], null)
  sched_time = try(local.m513["sched_time"], null)
  shared_scope = try(local.m513["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m513["ancestors"], null) == null ? [] : local.m513["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "definition" {
    for_each = try(local.m513["definition"], null) == null ? [] : local.m513["definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m513["parent"], null) == null ? [] : local.m513["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m513["permission_resources"], null) == null ? [] : local.m513["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m513["tags"], null) == null ? [] : local.m513["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m513["version_context"], null) == null ? [] : local.m513["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
