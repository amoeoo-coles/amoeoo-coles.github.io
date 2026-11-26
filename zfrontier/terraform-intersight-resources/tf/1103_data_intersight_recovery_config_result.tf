# Sample data source intersight_recovery_config_result — reads ../models/data_intersight_recovery_config_result.yml
locals { m1103 = yamldecode(file("${path.module}/../models/data_intersight_recovery_config_result.yml"))["data_intersight_recovery_config_result"] }

data "intersight_recovery_config_result" "n1103" {
  account_moid = try(local.m1103["account_moid"], null)
  additional_properties = try(local.m1103["additional_properties"], null)
  class_id = try(local.m1103["class_id"], null)
  config_stage = try(local.m1103["config_stage"], null)
  config_state = try(local.m1103["config_state"], null)
  create_time = try(local.m1103["create_time"], null)
  domain_group_moid = try(local.m1103["domain_group_moid"], null)
  id = try(local.m1103["id"], null)
  mod_time = try(local.m1103["mod_time"], null)
  moid = try(local.m1103["moid"], null)
  object_type = try(local.m1103["object_type"], null)
  owners = try(local.m1103["owners"], null)
  results = try(local.m1103["results"], null)
  shared_scope = try(local.m1103["shared_scope"], null)
  validation_state = try(local.m1103["validation_state"], null)
  dynamic "ancestors" {
    for_each = try(local.m1103["ancestors"], null) == null ? [] : local.m1103["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "applied_policies" {
    for_each = try(local.m1103["applied_policies"], null) == null ? [] : local.m1103["applied_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_profile" {
    for_each = try(local.m1103["backup_profile"], null) == null ? [] : local.m1103["backup_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1103["parent"], null) == null ? [] : local.m1103["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1103["permission_resources"], null) == null ? [] : local.m1103["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "result_entries" {
    for_each = try(local.m1103["result_entries"], null) == null ? [] : local.m1103["result_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1103["tags"], null) == null ? [] : local.m1103["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1103["version_context"], null) == null ? [] : local.m1103["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
