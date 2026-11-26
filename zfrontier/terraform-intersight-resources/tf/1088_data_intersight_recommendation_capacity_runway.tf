# Sample data source intersight_recommendation_capacity_runway — reads ../models/data_intersight_recommendation_capacity_runway.yml
locals { m1088 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_capacity_runway.yml"))["data_intersight_recommendation_capacity_runway"] }

data "intersight_recommendation_capacity_runway" "n1088" {
  account_moid = try(local.m1088["account_moid"], null)
  additional_capacity = try(local.m1088["additional_capacity"], null)
  additional_properties = try(local.m1088["additional_properties"], null)
  class_id = try(local.m1088["class_id"], null)
  create_time = try(local.m1088["create_time"], null)
  domain_group_moid = try(local.m1088["domain_group_moid"], null)
  id = try(local.m1088["id"], null)
  last_updated_time = try(local.m1088["last_updated_time"], null)
  mod_time = try(local.m1088["mod_time"], null)
  moid = try(local.m1088["moid"], null)
  name = try(local.m1088["name"], null)
  object_type = try(local.m1088["object_type"], null)
  owners = try(local.m1088["owners"], null)
  period = try(local.m1088["period"], null)
  requirement_met = try(local.m1088["requirement_met"], null)
  results = try(local.m1088["results"], null)
  runway = try(local.m1088["runway"], null)
  shared_scope = try(local.m1088["shared_scope"], null)
  total_capacity = try(local.m1088["total_capacity"], null)
  unit = try(local.m1088["unit"], null)
  dynamic "ancestors" {
    for_each = try(local.m1088["ancestors"], null) == null ? [] : local.m1088["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "forecast_instance" {
    for_each = try(local.m1088["forecast_instance"], null) == null ? [] : local.m1088["forecast_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1088["parent"], null) == null ? [] : local.m1088["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1088["permission_resources"], null) == null ? [] : local.m1088["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_item" {
    for_each = try(local.m1088["physical_item"], null) == null ? [] : local.m1088["physical_item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1088["registered_device"], null) == null ? [] : local.m1088["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1088["tags"], null) == null ? [] : local.m1088["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1088["version_context"], null) == null ? [] : local.m1088["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
