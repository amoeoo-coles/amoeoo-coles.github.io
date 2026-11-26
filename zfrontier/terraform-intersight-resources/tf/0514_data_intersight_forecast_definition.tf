# Sample data source intersight_forecast_definition — reads ../models/data_intersight_forecast_definition.yml
locals { m514 = yamldecode(file("${path.module}/../models/data_intersight_forecast_definition.yml"))["data_intersight_forecast_definition"] }

data "intersight_forecast_definition" "n514" {
  account_moid = try(local.m514["account_moid"], null)
  additional_properties = try(local.m514["additional_properties"], null)
  alert_threshold_in_percentage = try(local.m514["alert_threshold_in_percentage"], null)
  class_id = try(local.m514["class_id"], null)
  create_time = try(local.m514["create_time"], null)
  data_source = try(local.m514["data_source"], null)
  domain_group_moid = try(local.m514["domain_group_moid"], null)
  id = try(local.m514["id"], null)
  metric_name = try(local.m514["metric_name"], null)
  min_num_of_days_of_data = try(local.m514["min_num_of_days_of_data"], null)
  mod_time = try(local.m514["mod_time"], null)
  moid = try(local.m514["moid"], null)
  num_of_days_of_historical_data = try(local.m514["num_of_days_of_historical_data"], null)
  object_type = try(local.m514["object_type"], null)
  owners = try(local.m514["owners"], null)
  platform_type = try(local.m514["platform_type"], null)
  results = try(local.m514["results"], null)
  shared_scope = try(local.m514["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m514["ancestors"], null) == null ? [] : local.m514["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m514["catalog"], null) == null ? [] : local.m514["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m514["parent"], null) == null ? [] : local.m514["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m514["permission_resources"], null) == null ? [] : local.m514["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m514["tags"], null) == null ? [] : local.m514["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m514["version_context"], null) == null ? [] : local.m514["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
