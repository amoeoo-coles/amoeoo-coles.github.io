# Sample data source intersight_thermal_policy — reads ../models/data_intersight_thermal_policy.yml
locals { m1389 = yamldecode(file("${path.module}/../models/data_intersight_thermal_policy.yml"))["data_intersight_thermal_policy"] }

data "intersight_thermal_policy" "n1389" {
  account_moid = try(local.m1389["account_moid"], null)
  additional_properties = try(local.m1389["additional_properties"], null)
  class_id = try(local.m1389["class_id"], null)
  create_time = try(local.m1389["create_time"], null)
  description = try(local.m1389["description"], null)
  domain_group_moid = try(local.m1389["domain_group_moid"], null)
  fan_control_mode = try(local.m1389["fan_control_mode"], null)
  id = try(local.m1389["id"], null)
  mod_time = try(local.m1389["mod_time"], null)
  moid = try(local.m1389["moid"], null)
  name = try(local.m1389["name"], null)
  object_type = try(local.m1389["object_type"], null)
  owners = try(local.m1389["owners"], null)
  results = try(local.m1389["results"], null)
  shared_scope = try(local.m1389["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1389["ancestors"], null) == null ? [] : local.m1389["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1389["organization"], null) == null ? [] : local.m1389["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1389["parent"], null) == null ? [] : local.m1389["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1389["permission_resources"], null) == null ? [] : local.m1389["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1389["profiles"], null) == null ? [] : local.m1389["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1389["tags"], null) == null ? [] : local.m1389["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1389["version_context"], null) == null ? [] : local.m1389["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
