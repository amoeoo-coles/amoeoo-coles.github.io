# Sample data source intersight_hyperflex_vm_snapshot_info — reads ../models/data_intersight_hyperflex_vm_snapshot_info.yml
locals { m642 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_vm_snapshot_info.yml"))["data_intersight_hyperflex_vm_snapshot_info"] }

data "intersight_hyperflex_vm_snapshot_info" "n642" {
  account_moid = try(local.m642["account_moid"], null)
  additional_properties = try(local.m642["additional_properties"], null)
  class_id = try(local.m642["class_id"], null)
  create_time = try(local.m642["create_time"], null)
  display_status = try(local.m642["display_status"], null)
  domain_group_moid = try(local.m642["domain_group_moid"], null)
  id = try(local.m642["id"], null)
  label = try(local.m642["label"], null)
  mod_time = try(local.m642["mod_time"], null)
  mode = try(local.m642["mode"], null)
  moid = try(local.m642["moid"], null)
  object_type = try(local.m642["object_type"], null)
  owners = try(local.m642["owners"], null)
  replication_status = try(local.m642["replication_status"], null)
  results = try(local.m642["results"], null)
  shared_scope = try(local.m642["shared_scope"], null)
  snapshot_error_msg = try(local.m642["snapshot_error_msg"], null)
  snapshot_status = try(local.m642["snapshot_status"], null)
  source_timestamp = try(local.m642["source_timestamp"], null)
  src_cluster_name = try(local.m642["src_cluster_name"], null)
  target_completion_timestamp = try(local.m642["target_completion_timestamp"], null)
  tgt_cluster_name = try(local.m642["tgt_cluster_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m642["ancestors"], null) == null ? [] : local.m642["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_id_snap_map" {
    for_each = try(local.m642["cluster_id_snap_map"], null) == null ? [] : local.m642["cluster_id_snap_map"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "error" {
    for_each = try(local.m642["error"], null) == null ? [] : local.m642["error"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m642["parent"], null) == null ? [] : local.m642["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_snapshot" {
    for_each = try(local.m642["parent_snapshot"], null) == null ? [] : local.m642["parent_snapshot"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m642["permission_resources"], null) == null ? [] : local.m642["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_cluster" {
    for_each = try(local.m642["src_cluster"], null) == null ? [] : local.m642["src_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m642["tags"], null) == null ? [] : local.m642["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tgt_cluster" {
    for_each = try(local.m642["tgt_cluster"], null) == null ? [] : local.m642["tgt_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m642["version_context"], null) == null ? [] : local.m642["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_backup_info" {
    for_each = try(local.m642["vm_backup_info"], null) == null ? [] : local.m642["vm_backup_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_entity_reference" {
    for_each = try(local.m642["vm_entity_reference"], null) == null ? [] : local.m642["vm_entity_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_snapshot_entity_reference" {
    for_each = try(local.m642["vm_snapshot_entity_reference"], null) == null ? [] : local.m642["vm_snapshot_entity_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
