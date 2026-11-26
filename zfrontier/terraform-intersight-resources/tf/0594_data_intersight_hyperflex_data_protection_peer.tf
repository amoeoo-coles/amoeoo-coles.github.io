# Sample data source intersight_hyperflex_data_protection_peer — reads ../models/data_intersight_hyperflex_data_protection_peer.yml
locals { m594 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_data_protection_peer.yml"))["data_intersight_hyperflex_data_protection_peer"] }

data "intersight_hyperflex_data_protection_peer" "n594" {
  account_moid = try(local.m594["account_moid"], null)
  additional_properties = try(local.m594["additional_properties"], null)
  class_id = try(local.m594["class_id"], null)
  create_time = try(local.m594["create_time"], null)
  domain_group_moid = try(local.m594["domain_group_moid"], null)
  id = try(local.m594["id"], null)
  mod_time = try(local.m594["mod_time"], null)
  moid = try(local.m594["moid"], null)
  object_type = try(local.m594["object_type"], null)
  owners = try(local.m594["owners"], null)
  results = try(local.m594["results"], null)
  shared_scope = try(local.m594["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m594["ancestors"], null) == null ? [] : local.m594["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "er" {
    for_each = try(local.m594["er"], null) == null ? [] : local.m594["er"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m594["parent"], null) == null ? [] : local.m594["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_info" {
    for_each = try(local.m594["peer_info"], null) == null ? [] : local.m594["peer_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m594["permission_resources"], null) == null ? [] : local.m594["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_cluster" {
    for_each = try(local.m594["src_cluster"], null) == null ? [] : local.m594["src_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m594["tags"], null) == null ? [] : local.m594["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tgt_cluster" {
    for_each = try(local.m594["tgt_cluster"], null) == null ? [] : local.m594["tgt_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m594["version_context"], null) == null ? [] : local.m594["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
