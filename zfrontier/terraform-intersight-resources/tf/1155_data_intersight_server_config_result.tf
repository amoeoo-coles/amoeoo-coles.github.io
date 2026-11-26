# Sample data source intersight_server_config_result — reads ../models/data_intersight_server_config_result.yml
locals { m1155 = yamldecode(file("${path.module}/../models/data_intersight_server_config_result.yml"))["data_intersight_server_config_result"] }

data "intersight_server_config_result" "n1155" {
  account_moid = try(local.m1155["account_moid"], null)
  additional_properties = try(local.m1155["additional_properties"], null)
  class_id = try(local.m1155["class_id"], null)
  config_stage = try(local.m1155["config_stage"], null)
  config_state = try(local.m1155["config_state"], null)
  create_time = try(local.m1155["create_time"], null)
  domain_group_moid = try(local.m1155["domain_group_moid"], null)
  id = try(local.m1155["id"], null)
  mod_time = try(local.m1155["mod_time"], null)
  moid = try(local.m1155["moid"], null)
  object_type = try(local.m1155["object_type"], null)
  owners = try(local.m1155["owners"], null)
  results = try(local.m1155["results"], null)
  shared_scope = try(local.m1155["shared_scope"], null)
  validation_state = try(local.m1155["validation_state"], null)
  dynamic "ancestors" {
    for_each = try(local.m1155["ancestors"], null) == null ? [] : local.m1155["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "applied_policies" {
    for_each = try(local.m1155["applied_policies"], null) == null ? [] : local.m1155["applied_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1155["parent"], null) == null ? [] : local.m1155["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1155["permission_resources"], null) == null ? [] : local.m1155["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1155["profile"], null) == null ? [] : local.m1155["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "result_entries" {
    for_each = try(local.m1155["result_entries"], null) == null ? [] : local.m1155["result_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1155["tags"], null) == null ? [] : local.m1155["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1155["version_context"], null) == null ? [] : local.m1155["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
