# Sample data source intersight_hyperflex_datastore_statistic — reads ../models/data_intersight_hyperflex_datastore_statistic.yml
locals { m595 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_datastore_statistic.yml"))["data_intersight_hyperflex_datastore_statistic"] }

data "intersight_hyperflex_datastore_statistic" "n595" {
  accessibility_summary = try(local.m595["accessibility_summary"], null)
  account_moid = try(local.m595["account_moid"], null)
  additional_properties = try(local.m595["additional_properties"], null)
  class_id = try(local.m595["class_id"], null)
  create_time = try(local.m595["create_time"], null)
  creation_time = try(local.m595["creation_time"], null)
  datastore_kind = try(local.m595["datastore_kind"], null)
  datastore_status = try(local.m595["datastore_status"], null)
  domain_group_moid = try(local.m595["domain_group_moid"], null)
  free_capacity_in_bytes = try(local.m595["free_capacity_in_bytes"], null)
  id = try(local.m595["id"], null)
  is_encrypted = try(local.m595["is_encrypted"], null)
  last_access_time = try(local.m595["last_access_time"], null)
  last_modified_time = try(local.m595["last_modified_time"], null)
  mod_time = try(local.m595["mod_time"], null)
  moid = try(local.m595["moid"], null)
  mount_summary = try(local.m595["mount_summary"], null)
  object_type = try(local.m595["object_type"], null)
  owners = try(local.m595["owners"], null)
  parent_uuid = try(local.m595["parent_uuid"], null)
  results = try(local.m595["results"], null)
  shared_scope = try(local.m595["shared_scope"], null)
  total_capacity_in_bytes = try(local.m595["total_capacity_in_bytes"], null)
  un_compressed_used_bytes = try(local.m595["un_compressed_used_bytes"], null)
  unshared_used_bytes = try(local.m595["unshared_used_bytes"], null)
  uuid = try(local.m595["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m595["ancestors"], null) == null ? [] : local.m595["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "data_protection_peer" {
    for_each = try(local.m595["data_protection_peer"], null) == null ? [] : local.m595["data_protection_peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dsconfig" {
    for_each = try(local.m595["dsconfig"], null) == null ? [] : local.m595["dsconfig"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_mount_status" {
    for_each = try(local.m595["host_mount_status"], null) == null ? [] : local.m595["host_mount_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m595["parent"], null) == null ? [] : local.m595["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m595["permission_resources"], null) == null ? [] : local.m595["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "site" {
    for_each = try(local.m595["site"], null) == null ? [] : local.m595["site"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_cluster" {
    for_each = try(local.m595["src_cluster"], null) == null ? [] : local.m595["src_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m595["tags"], null) == null ? [] : local.m595["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tgt_cluster" {
    for_each = try(local.m595["tgt_cluster"], null) == null ? [] : local.m595["tgt_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m595["version_context"], null) == null ? [] : local.m595["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
