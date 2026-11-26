# Sample data source intersight_hyperflex_vm_backup_info — reads ../models/data_intersight_hyperflex_vm_backup_info.yml
locals { m639 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_vm_backup_info.yml"))["data_intersight_hyperflex_vm_backup_info"] }

data "intersight_hyperflex_vm_backup_info" "n639" {
  account_moid = try(local.m639["account_moid"], null)
  additional_properties = try(local.m639["additional_properties"], null)
  backup_status = try(local.m639["backup_status"], null)
  class_id = try(local.m639["class_id"], null)
  create_time = try(local.m639["create_time"], null)
  domain_group_moid = try(local.m639["domain_group_moid"], null)
  id = try(local.m639["id"], null)
  local_snapshot_retention_count = try(local.m639["local_snapshot_retention_count"], null)
  mod_time = try(local.m639["mod_time"], null)
  moid = try(local.m639["moid"], null)
  object_type = try(local.m639["object_type"], null)
  owners = try(local.m639["owners"], null)
  power_on = try(local.m639["power_on"], null)
  protection_status = try(local.m639["protection_status"], null)
  results = try(local.m639["results"], null)
  shared_scope = try(local.m639["shared_scope"], null)
  snapshot_retention_count = try(local.m639["snapshot_retention_count"], null)
  src_cluster_name = try(local.m639["src_cluster_name"], null)
  tgt_cluster_name = try(local.m639["tgt_cluster_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m639["ancestors"], null) == null ? [] : local.m639["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_entity_reference" {
    for_each = try(local.m639["cluster_entity_reference"], null) == null ? [] : local.m639["cluster_entity_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_id_protection_info_map" {
    for_each = try(local.m639["cluster_id_protection_info_map"], null) == null ? [] : local.m639["cluster_id_protection_info_map"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "error" {
    for_each = try(local.m639["error"], null) == null ? [] : local.m639["error"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m639["parent"], null) == null ? [] : local.m639["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m639["permission_resources"], null) == null ? [] : local.m639["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule" {
    for_each = try(local.m639["schedule"], null) == null ? [] : local.m639["schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_backup_cluster" {
    for_each = try(local.m639["src_backup_cluster"], null) == null ? [] : local.m639["src_backup_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_cluster" {
    for_each = try(local.m639["src_cluster"], null) == null ? [] : local.m639["src_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m639["tags"], null) == null ? [] : local.m639["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tgt_cluster" {
    for_each = try(local.m639["tgt_cluster"], null) == null ? [] : local.m639["tgt_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m639["version_context"], null) == null ? [] : local.m639["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_entity_reference" {
    for_each = try(local.m639["vm_entity_reference"], null) == null ? [] : local.m639["vm_entity_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_info" {
    for_each = try(local.m639["vm_info"], null) == null ? [] : local.m639["vm_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
