# Sample data source intersight_cli_cli_policy — reads ../models/data_intersight_cli_cli_policy.yml
locals { m223 = yamldecode(file("${path.module}/../models/data_intersight_cli_cli_policy.yml"))["data_intersight_cli_cli_policy"] }

data "intersight_cli_cli_policy" "n223" {
  account_moid = try(local.m223["account_moid"], null)
  additional_properties = try(local.m223["additional_properties"], null)
  class_id = try(local.m223["class_id"], null)
  create_time = try(local.m223["create_time"], null)
  domain_group_moid = try(local.m223["domain_group_moid"], null)
  fi_and_unified_edge_ecmc_cli_launch = try(local.m223["fi_and_unified_edge_ecmc_cli_launch"], null)
  id = try(local.m223["id"], null)
  mod_time = try(local.m223["mod_time"], null)
  moid = try(local.m223["moid"], null)
  object_type = try(local.m223["object_type"], null)
  owners = try(local.m223["owners"], null)
  results = try(local.m223["results"], null)
  shared_scope = try(local.m223["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m223["account"], null) == null ? [] : local.m223["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m223["ancestors"], null) == null ? [] : local.m223["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m223["parent"], null) == null ? [] : local.m223["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m223["permission_resources"], null) == null ? [] : local.m223["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m223["tags"], null) == null ? [] : local.m223["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m223["version_context"], null) == null ? [] : local.m223["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
