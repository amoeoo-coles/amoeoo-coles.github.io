# Sample data source intersight_storage_net_app_sensor — reads ../models/data_intersight_storage_net_app_sensor.yml
locals { m1299 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_sensor.yml"))["data_intersight_storage_net_app_sensor"] }

data "intersight_storage_net_app_sensor" "n1299" {
  account_moid = try(local.m1299["account_moid"], null)
  additional_properties = try(local.m1299["additional_properties"], null)
  class_id = try(local.m1299["class_id"], null)
  controller_name = try(local.m1299["controller_name"], null)
  create_time = try(local.m1299["create_time"], null)
  domain_group_moid = try(local.m1299["domain_group_moid"], null)
  id = try(local.m1299["id"], null)
  mod_time = try(local.m1299["mod_time"], null)
  moid = try(local.m1299["moid"], null)
  name = try(local.m1299["name"], null)
  object_type = try(local.m1299["object_type"], null)
  owners = try(local.m1299["owners"], null)
  results = try(local.m1299["results"], null)
  shared_scope = try(local.m1299["shared_scope"], null)
  state = try(local.m1299["state"], null)
  type = try(local.m1299["type"], null)
  units = try(local.m1299["units"], null)
  value = try(local.m1299["value"], null)
  dynamic "ancestors" {
    for_each = try(local.m1299["ancestors"], null) == null ? [] : local.m1299["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1299["array_controller"], null) == null ? [] : local.m1299["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1299["parent"], null) == null ? [] : local.m1299["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1299["permission_resources"], null) == null ? [] : local.m1299["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1299["tags"], null) == null ? [] : local.m1299["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1299["version_context"], null) == null ? [] : local.m1299["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
