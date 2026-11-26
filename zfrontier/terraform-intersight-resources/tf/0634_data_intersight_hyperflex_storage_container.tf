# Sample data source intersight_hyperflex_storage_container — reads ../models/data_intersight_hyperflex_storage_container.yml
locals { m634 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_storage_container.yml"))["data_intersight_hyperflex_storage_container"] }

data "intersight_hyperflex_storage_container" "n634" {
  accessibility_summary = try(local.m634["accessibility_summary"], null)
  account_moid = try(local.m634["account_moid"], null)
  additional_properties = try(local.m634["additional_properties"], null)
  class_id = try(local.m634["class_id"], null)
  create_time = try(local.m634["create_time"], null)
  created_time = try(local.m634["created_time"], null)
  data_block_size = try(local.m634["data_block_size"], null)
  domain_group_moid = try(local.m634["domain_group_moid"], null)
  encryption_enabled = try(local.m634["encryption_enabled"], null)
  id = try(local.m634["id"], null)
  in_use = try(local.m634["in_use"], null)
  kind = try(local.m634["kind"], null)
  last_access_time = try(local.m634["last_access_time"], null)
  last_modified_time = try(local.m634["last_modified_time"], null)
  mod_time = try(local.m634["mod_time"], null)
  moid = try(local.m634["moid"], null)
  mount_status = try(local.m634["mount_status"], null)
  mount_summary = try(local.m634["mount_summary"], null)
  name = try(local.m634["name"], null)
  object_type = try(local.m634["object_type"], null)
  owners = try(local.m634["owners"], null)
  provisioned_capacity = try(local.m634["provisioned_capacity"], null)
  provisioned_volume_capacity_utilization = try(local.m634["provisioned_volume_capacity_utilization"], null)
  results = try(local.m634["results"], null)
  shared_scope = try(local.m634["shared_scope"], null)
  type = try(local.m634["type"], null)
  un_compressed_used_bytes = try(local.m634["un_compressed_used_bytes"], null)
  uuid = try(local.m634["uuid"], null)
  volume_count = try(local.m634["volume_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m634["ancestors"], null) == null ? [] : local.m634["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m634["cluster"], null) == null ? [] : local.m634["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_mount_status" {
    for_each = try(local.m634["host_mount_status"], null) == null ? [] : local.m634["host_mount_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m634["parent"], null) == null ? [] : local.m634["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m634["permission_resources"], null) == null ? [] : local.m634["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m634["storage_utilization"], null) == null ? [] : local.m634["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m634["tags"], null) == null ? [] : local.m634["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m634["version_context"], null) == null ? [] : local.m634["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volumes" {
    for_each = try(local.m634["volumes"], null) == null ? [] : local.m634["volumes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
