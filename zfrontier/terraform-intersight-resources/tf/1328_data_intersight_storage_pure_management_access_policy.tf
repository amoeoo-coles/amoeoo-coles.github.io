# Sample data source intersight_storage_pure_management_access_policy — reads ../models/data_intersight_storage_pure_management_access_policy.yml
locals { m1328 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_management_access_policy.yml"))["data_intersight_storage_pure_management_access_policy"] }

data "intersight_storage_pure_management_access_policy" "n1328" {
  account_moid = try(local.m1328["account_moid"], null)
  additional_properties = try(local.m1328["additional_properties"], null)
  aggregation_strategy = try(local.m1328["aggregation_strategy"], null)
  class_id = try(local.m1328["class_id"], null)
  create_time = try(local.m1328["create_time"], null)
  domain_group_moid = try(local.m1328["domain_group_moid"], null)
  enabled = try(local.m1328["enabled"], null)
  id = try(local.m1328["id"], null)
  mod_time = try(local.m1328["mod_time"], null)
  moid = try(local.m1328["moid"], null)
  name = try(local.m1328["name"], null)
  object_type = try(local.m1328["object_type"], null)
  owners = try(local.m1328["owners"], null)
  policy_type = try(local.m1328["policy_type"], null)
  results = try(local.m1328["results"], null)
  shared_scope = try(local.m1328["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1328["ancestors"], null) == null ? [] : local.m1328["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1328["array"], null) == null ? [] : local.m1328["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1328["parent"], null) == null ? [] : local.m1328["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1328["permission_resources"], null) == null ? [] : local.m1328["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1328["registered_device"], null) == null ? [] : local.m1328["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1328["tags"], null) == null ? [] : local.m1328["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1328["version_context"], null) == null ? [] : local.m1328["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
