# Sample data source intersight_forecast_instance — reads ../models/data_intersight_forecast_instance.yml
locals { m515 = yamldecode(file("${path.module}/../models/data_intersight_forecast_instance.yml"))["data_intersight_forecast_instance"] }

data "intersight_forecast_instance" "n515" {
  account_moid = try(local.m515["account_moid"], null)
  action = try(local.m515["action"], null)
  additional_properties = try(local.m515["additional_properties"], null)
  alt_model = try(local.m515["alt_model"], null)
  class_id = try(local.m515["class_id"], null)
  create_time = try(local.m515["create_time"], null)
  data_interval = try(local.m515["data_interval"], null)
  data_start_date = try(local.m515["data_start_date"], null)
  device_id = try(local.m515["device_id"], null)
  domain_group_moid = try(local.m515["domain_group_moid"], null)
  full_cap_days = try(local.m515["full_cap_days"], null)
  id = try(local.m515["id"], null)
  last_model_update_time = try(local.m515["last_model_update_time"], null)
  metric_name = try(local.m515["metric_name"], null)
  min_days_for_forecast = try(local.m515["min_days_for_forecast"], null)
  mod_time = try(local.m515["mod_time"], null)
  moid = try(local.m515["moid"], null)
  object_type = try(local.m515["object_type"], null)
  owners = try(local.m515["owners"], null)
  results = try(local.m515["results"], null)
  shared_scope = try(local.m515["shared_scope"], null)
  threshold_days = try(local.m515["threshold_days"], null)
  dynamic "ancestors" {
    for_each = try(local.m515["ancestors"], null) == null ? [] : local.m515["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "forecast_def" {
    for_each = try(local.m515["forecast_def"], null) == null ? [] : local.m515["forecast_def"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "model" {
    for_each = try(local.m515["model"], null) == null ? [] : local.m515["model"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m515["parent"], null) == null ? [] : local.m515["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m515["permission_resources"], null) == null ? [] : local.m515["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m515["registered_device"], null) == null ? [] : local.m515["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m515["tags"], null) == null ? [] : local.m515["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m515["version_context"], null) == null ? [] : local.m515["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
