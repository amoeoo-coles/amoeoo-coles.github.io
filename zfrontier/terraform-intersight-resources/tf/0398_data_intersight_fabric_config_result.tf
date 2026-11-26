# Sample data source intersight_fabric_config_result — reads ../models/data_intersight_fabric_config_result.yml
locals { m398 = yamldecode(file("${path.module}/../models/data_intersight_fabric_config_result.yml"))["data_intersight_fabric_config_result"] }

data "intersight_fabric_config_result" "n398" {
  account_moid = try(local.m398["account_moid"], null)
  additional_properties = try(local.m398["additional_properties"], null)
  class_id = try(local.m398["class_id"], null)
  config_stage = try(local.m398["config_stage"], null)
  config_state = try(local.m398["config_state"], null)
  create_time = try(local.m398["create_time"], null)
  domain_group_moid = try(local.m398["domain_group_moid"], null)
  id = try(local.m398["id"], null)
  mod_time = try(local.m398["mod_time"], null)
  moid = try(local.m398["moid"], null)
  object_type = try(local.m398["object_type"], null)
  owners = try(local.m398["owners"], null)
  results = try(local.m398["results"], null)
  shared_scope = try(local.m398["shared_scope"], null)
  validation_state = try(local.m398["validation_state"], null)
  dynamic "ancestors" {
    for_each = try(local.m398["ancestors"], null) == null ? [] : local.m398["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "applied_policies" {
    for_each = try(local.m398["applied_policies"], null) == null ? [] : local.m398["applied_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m398["parent"], null) == null ? [] : local.m398["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m398["permission_resources"], null) == null ? [] : local.m398["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m398["profile"], null) == null ? [] : local.m398["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "result_entries" {
    for_each = try(local.m398["result_entries"], null) == null ? [] : local.m398["result_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m398["tags"], null) == null ? [] : local.m398["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m398["version_context"], null) == null ? [] : local.m398["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
