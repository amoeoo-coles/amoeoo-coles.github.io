# Sample data source intersight_hyperflex_backup_cluster — reads ../models/data_intersight_hyperflex_backup_cluster.yml
locals { m580 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_backup_cluster.yml"))["data_intersight_hyperflex_backup_cluster"] }

data "intersight_hyperflex_backup_cluster" "n580" {
  account_moid = try(local.m580["account_moid"], null)
  additional_properties = try(local.m580["additional_properties"], null)
  backup_data_store = try(local.m580["backup_data_store"], null)
  class_id = try(local.m580["class_id"], null)
  create_time = try(local.m580["create_time"], null)
  domain_group_moid = try(local.m580["domain_group_moid"], null)
  id = try(local.m580["id"], null)
  mod_time = try(local.m580["mod_time"], null)
  moid = try(local.m580["moid"], null)
  object_type = try(local.m580["object_type"], null)
  owners = try(local.m580["owners"], null)
  results = try(local.m580["results"], null)
  shared_scope = try(local.m580["shared_scope"], null)
  src_cluster_uuid = try(local.m580["src_cluster_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m580["ancestors"], null) == null ? [] : local.m580["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m580["parent"], null) == null ? [] : local.m580["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m580["permission_resources"], null) == null ? [] : local.m580["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_cluster" {
    for_each = try(local.m580["src_cluster"], null) == null ? [] : local.m580["src_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m580["tags"], null) == null ? [] : local.m580["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tgt_cluster" {
    for_each = try(local.m580["tgt_cluster"], null) == null ? [] : local.m580["tgt_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m580["version_context"], null) == null ? [] : local.m580["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
