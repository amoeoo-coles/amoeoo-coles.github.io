# Sample data source intersight_hyperflex_cluster_backup_policy_inventory — reads ../models/data_intersight_hyperflex_cluster_backup_policy_inventory.yml
locals { m585 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_backup_policy_inventory.yml"))["data_intersight_hyperflex_cluster_backup_policy_inventory"] }

data "intersight_hyperflex_cluster_backup_policy_inventory" "n585" {
  account_moid = try(local.m585["account_moid"], null)
  action = try(local.m585["action"], null)
  additional_properties = try(local.m585["additional_properties"], null)
  class_id = try(local.m585["class_id"], null)
  cleanup = try(local.m585["cleanup"], null)
  create_time = try(local.m585["create_time"], null)
  domain_group_moid = try(local.m585["domain_group_moid"], null)
  id = try(local.m585["id"], null)
  is_source = try(local.m585["is_source"], null)
  job_details = try(local.m585["job_details"], null)
  job_exception_message = try(local.m585["job_exception_message"], null)
  job_id = try(local.m585["job_id"], null)
  job_state = try(local.m585["job_state"], null)
  mod_time = try(local.m585["mod_time"], null)
  moid = try(local.m585["moid"], null)
  nr_version = try(local.m585["nr_version"], null)
  object_type = try(local.m585["object_type"], null)
  owners = try(local.m585["owners"], null)
  policy_moid = try(local.m585["policy_moid"], null)
  request_id = try(local.m585["request_id"], null)
  results = try(local.m585["results"], null)
  shared_scope = try(local.m585["shared_scope"], null)
  source_uuid = try(local.m585["source_uuid"], null)
  target_uuid = try(local.m585["target_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m585["ancestors"], null) == null ? [] : local.m585["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m585["parent"], null) == null ? [] : local.m585["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m585["permission_resources"], null) == null ? [] : local.m585["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "settings" {
    for_each = try(local.m585["settings"], null) == null ? [] : local.m585["settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_cluster" {
    for_each = try(local.m585["src_cluster"], null) == null ? [] : local.m585["src_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m585["tags"], null) == null ? [] : local.m585["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tgt_cluster" {
    for_each = try(local.m585["tgt_cluster"], null) == null ? [] : local.m585["tgt_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m585["version_context"], null) == null ? [] : local.m585["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
