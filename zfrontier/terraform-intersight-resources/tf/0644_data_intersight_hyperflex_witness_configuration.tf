# Sample data source intersight_hyperflex_witness_configuration — reads ../models/data_intersight_hyperflex_witness_configuration.yml
locals { m644 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_witness_configuration.yml"))["data_intersight_hyperflex_witness_configuration"] }

data "intersight_hyperflex_witness_configuration" "n644" {
  account_moid = try(local.m644["account_moid"], null)
  additional_properties = try(local.m644["additional_properties"], null)
  class_id = try(local.m644["class_id"], null)
  connection_error = try(local.m644["connection_error"], null)
  create_time = try(local.m644["create_time"], null)
  custom_witness_enabled = try(local.m644["custom_witness_enabled"], null)
  domain_group_moid = try(local.m644["domain_group_moid"], null)
  fingerprint = try(local.m644["fingerprint"], null)
  id = try(local.m644["id"], null)
  mod_time = try(local.m644["mod_time"], null)
  moid = try(local.m644["moid"], null)
  nr_version = try(local.m644["nr_version"], null)
  object_type = try(local.m644["object_type"], null)
  owners = try(local.m644["owners"], null)
  results = try(local.m644["results"], null)
  shared_scope = try(local.m644["shared_scope"], null)
  status = try(local.m644["status"], null)
  witness_url = try(local.m644["witness_url"], null)
  dynamic "ancestors" {
    for_each = try(local.m644["ancestors"], null) == null ? [] : local.m644["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m644["cluster"], null) == null ? [] : local.m644["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m644["parent"], null) == null ? [] : local.m644["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m644["permission_resources"], null) == null ? [] : local.m644["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m644["tags"], null) == null ? [] : local.m644["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m644["version_context"], null) == null ? [] : local.m644["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
