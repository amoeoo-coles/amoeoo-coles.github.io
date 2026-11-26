# Sample data source intersight_hyperflex_vm_restore_operation — reads ../models/data_intersight_hyperflex_vm_restore_operation.yml
locals { m641 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_vm_restore_operation.yml"))["data_intersight_hyperflex_vm_restore_operation"] }

data "intersight_hyperflex_vm_restore_operation" "n641" {
  account_moid = try(local.m641["account_moid"], null)
  additional_properties = try(local.m641["additional_properties"], null)
  class_id = try(local.m641["class_id"], null)
  create_time = try(local.m641["create_time"], null)
  domain_group_moid = try(local.m641["domain_group_moid"], null)
  id = try(local.m641["id"], null)
  mod_time = try(local.m641["mod_time"], null)
  moid = try(local.m641["moid"], null)
  new_name = try(local.m641["new_name"], null)
  object_type = try(local.m641["object_type"], null)
  owners = try(local.m641["owners"], null)
  power_on = try(local.m641["power_on"], null)
  results = try(local.m641["results"], null)
  shared_scope = try(local.m641["shared_scope"], null)
  start_time = try(local.m641["start_time"], null)
  dynamic "ancestors" {
    for_each = try(local.m641["ancestors"], null) == null ? [] : local.m641["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m641["organization"], null) == null ? [] : local.m641["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m641["parent"], null) == null ? [] : local.m641["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m641["permission_resources"], null) == null ? [] : local.m641["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "restore_edge_cluster_moid" {
    for_each = try(local.m641["restore_edge_cluster_moid"], null) == null ? [] : local.m641["restore_edge_cluster_moid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m641["tags"], null) == null ? [] : local.m641["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m641["version_context"], null) == null ? [] : local.m641["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_backup_info_moid" {
    for_each = try(local.m641["vm_backup_info_moid"], null) == null ? [] : local.m641["vm_backup_info_moid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_snapshot_info_moid" {
    for_each = try(local.m641["vm_snapshot_info_moid"], null) == null ? [] : local.m641["vm_snapshot_info_moid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
