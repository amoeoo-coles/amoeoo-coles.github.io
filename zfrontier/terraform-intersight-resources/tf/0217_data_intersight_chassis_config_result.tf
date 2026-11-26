# Sample data source intersight_chassis_config_result — reads ../models/data_intersight_chassis_config_result.yml
locals { m217 = yamldecode(file("${path.module}/../models/data_intersight_chassis_config_result.yml"))["data_intersight_chassis_config_result"] }

data "intersight_chassis_config_result" "n217" {
  account_moid = try(local.m217["account_moid"], null)
  additional_properties = try(local.m217["additional_properties"], null)
  class_id = try(local.m217["class_id"], null)
  config_stage = try(local.m217["config_stage"], null)
  config_state = try(local.m217["config_state"], null)
  create_time = try(local.m217["create_time"], null)
  domain_group_moid = try(local.m217["domain_group_moid"], null)
  id = try(local.m217["id"], null)
  mod_time = try(local.m217["mod_time"], null)
  moid = try(local.m217["moid"], null)
  object_type = try(local.m217["object_type"], null)
  owners = try(local.m217["owners"], null)
  results = try(local.m217["results"], null)
  shared_scope = try(local.m217["shared_scope"], null)
  validation_state = try(local.m217["validation_state"], null)
  dynamic "ancestors" {
    for_each = try(local.m217["ancestors"], null) == null ? [] : local.m217["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "applied_policies" {
    for_each = try(local.m217["applied_policies"], null) == null ? [] : local.m217["applied_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iom_profile" {
    for_each = try(local.m217["iom_profile"], null) == null ? [] : local.m217["iom_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m217["parent"], null) == null ? [] : local.m217["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m217["permission_resources"], null) == null ? [] : local.m217["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m217["profile"], null) == null ? [] : local.m217["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "result_entries" {
    for_each = try(local.m217["result_entries"], null) == null ? [] : local.m217["result_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m217["tags"], null) == null ? [] : local.m217["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m217["version_context"], null) == null ? [] : local.m217["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
