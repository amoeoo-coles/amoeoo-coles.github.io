# Sample data source intersight_hyperflex_config_result_entry — reads ../models/data_intersight_hyperflex_config_result_entry.yml
locals { m593 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_config_result_entry.yml"))["data_intersight_hyperflex_config_result_entry"] }

data "intersight_hyperflex_config_result_entry" "n593" {
  account_moid = try(local.m593["account_moid"], null)
  additional_properties = try(local.m593["additional_properties"], null)
  class_id = try(local.m593["class_id"], null)
  completed_time = try(local.m593["completed_time"], null)
  create_time = try(local.m593["create_time"], null)
  domain_group_moid = try(local.m593["domain_group_moid"], null)
  id = try(local.m593["id"], null)
  message = try(local.m593["message"], null)
  mod_time = try(local.m593["mod_time"], null)
  moid = try(local.m593["moid"], null)
  object_type = try(local.m593["object_type"], null)
  owner_id = try(local.m593["owner_id"], null)
  owners = try(local.m593["owners"], null)
  results = try(local.m593["results"], null)
  shared_scope = try(local.m593["shared_scope"], null)
  state = try(local.m593["state"], null)
  type = try(local.m593["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m593["ancestors"], null) == null ? [] : local.m593["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m593["config_result"], null) == null ? [] : local.m593["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "context" {
    for_each = try(local.m593["context"], null) == null ? [] : local.m593["context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m593["parent"], null) == null ? [] : local.m593["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m593["permission_resources"], null) == null ? [] : local.m593["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m593["tags"], null) == null ? [] : local.m593["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m593["version_context"], null) == null ? [] : local.m593["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
