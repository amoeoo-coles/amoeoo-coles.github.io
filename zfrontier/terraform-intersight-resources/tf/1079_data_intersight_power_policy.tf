# Sample data source intersight_power_policy — reads ../models/data_intersight_power_policy.yml
locals { m1079 = yamldecode(file("${path.module}/../models/data_intersight_power_policy.yml"))["data_intersight_power_policy"] }

data "intersight_power_policy" "n1079" {
  account_moid = try(local.m1079["account_moid"], null)
  additional_properties = try(local.m1079["additional_properties"], null)
  allocated_budget = try(local.m1079["allocated_budget"], null)
  class_id = try(local.m1079["class_id"], null)
  create_time = try(local.m1079["create_time"], null)
  description = try(local.m1079["description"], null)
  domain_group_moid = try(local.m1079["domain_group_moid"], null)
  dynamic_rebalancing = try(local.m1079["dynamic_rebalancing"], null)
  extended_power_capacity = try(local.m1079["extended_power_capacity"], null)
  id = try(local.m1079["id"], null)
  mod_time = try(local.m1079["mod_time"], null)
  moid = try(local.m1079["moid"], null)
  name = try(local.m1079["name"], null)
  object_type = try(local.m1079["object_type"], null)
  owners = try(local.m1079["owners"], null)
  power_priority = try(local.m1079["power_priority"], null)
  power_profiling = try(local.m1079["power_profiling"], null)
  power_restore_state = try(local.m1079["power_restore_state"], null)
  power_save_mode = try(local.m1079["power_save_mode"], null)
  processor_package_power_limit = try(local.m1079["processor_package_power_limit"], null)
  redundancy_mode = try(local.m1079["redundancy_mode"], null)
  results = try(local.m1079["results"], null)
  shared_scope = try(local.m1079["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1079["ancestors"], null) == null ? [] : local.m1079["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1079["organization"], null) == null ? [] : local.m1079["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1079["parent"], null) == null ? [] : local.m1079["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1079["permission_resources"], null) == null ? [] : local.m1079["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1079["profiles"], null) == null ? [] : local.m1079["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1079["tags"], null) == null ? [] : local.m1079["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1079["version_context"], null) == null ? [] : local.m1079["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
