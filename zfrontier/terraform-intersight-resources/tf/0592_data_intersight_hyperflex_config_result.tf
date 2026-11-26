# Sample data source intersight_hyperflex_config_result — reads ../models/data_intersight_hyperflex_config_result.yml
locals { m592 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_config_result.yml"))["data_intersight_hyperflex_config_result"] }

data "intersight_hyperflex_config_result" "n592" {
  account_moid = try(local.m592["account_moid"], null)
  additional_properties = try(local.m592["additional_properties"], null)
  class_id = try(local.m592["class_id"], null)
  config_progress = try(local.m592["config_progress"], null)
  config_stage = try(local.m592["config_stage"], null)
  config_state = try(local.m592["config_state"], null)
  create_time = try(local.m592["create_time"], null)
  domain_group_moid = try(local.m592["domain_group_moid"], null)
  duration = try(local.m592["duration"], null)
  id = try(local.m592["id"], null)
  mod_time = try(local.m592["mod_time"], null)
  moid = try(local.m592["moid"], null)
  object_type = try(local.m592["object_type"], null)
  owners = try(local.m592["owners"], null)
  results = try(local.m592["results"], null)
  shared_scope = try(local.m592["shared_scope"], null)
  start_time = try(local.m592["start_time"], null)
  validation_state = try(local.m592["validation_state"], null)
  dynamic "ancestors" {
    for_each = try(local.m592["ancestors"], null) == null ? [] : local.m592["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "applied_policies" {
    for_each = try(local.m592["applied_policies"], null) == null ? [] : local.m592["applied_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profile" {
    for_each = try(local.m592["cluster_profile"], null) == null ? [] : local.m592["cluster_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m592["parent"], null) == null ? [] : local.m592["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m592["permission_resources"], null) == null ? [] : local.m592["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "result_entries" {
    for_each = try(local.m592["result_entries"], null) == null ? [] : local.m592["result_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m592["tags"], null) == null ? [] : local.m592["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m592["version_context"], null) == null ? [] : local.m592["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
