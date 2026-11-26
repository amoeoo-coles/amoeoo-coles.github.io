# Sample data source intersight_hyperflex_reduce_re_sync — reads ../models/data_intersight_hyperflex_reduce_re_sync.yml
locals { m624 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_reduce_re_sync.yml"))["data_intersight_hyperflex_reduce_re_sync"] }

data "intersight_hyperflex_reduce_re_sync" "n624" {
  account_moid = try(local.m624["account_moid"], null)
  additional_properties = try(local.m624["additional_properties"], null)
  class_id = try(local.m624["class_id"], null)
  completion_status = try(local.m624["completion_status"], null)
  create_time = try(local.m624["create_time"], null)
  domain_group_moid = try(local.m624["domain_group_moid"], null)
  execution_output = try(local.m624["execution_output"], null)
  id = try(local.m624["id"], null)
  mod_time = try(local.m624["mod_time"], null)
  moid = try(local.m624["moid"], null)
  object_type = try(local.m624["object_type"], null)
  owners = try(local.m624["owners"], null)
  results = try(local.m624["results"], null)
  shared_scope = try(local.m624["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m624["ancestors"], null) == null ? [] : local.m624["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m624["cluster"], null) == null ? [] : local.m624["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m624["parent"], null) == null ? [] : local.m624["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m624["permission_resources"], null) == null ? [] : local.m624["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m624["tags"], null) == null ? [] : local.m624["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m624["version_context"], null) == null ? [] : local.m624["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
