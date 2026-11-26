# Sample data source intersight_hci_storage_container — reads ../models/data_intersight_hci_storage_container.yml
locals { m538 = yamldecode(file("${path.module}/../models/data_intersight_hci_storage_container.yml"))["data_intersight_hci_storage_container"] }

data "intersight_hci_storage_container" "n538" {
  account_moid = try(local.m538["account_moid"], null)
  additional_properties = try(local.m538["additional_properties"], null)
  cache_deduplication = try(local.m538["cache_deduplication"], null)
  class_id = try(local.m538["class_id"], null)
  cluster_ext_id = try(local.m538["cluster_ext_id"], null)
  cluster_name = try(local.m538["cluster_name"], null)
  compression_delay_secs = try(local.m538["compression_delay_secs"], null)
  create_time = try(local.m538["create_time"], null)
  domain_group_moid = try(local.m538["domain_group_moid"], null)
  erasure_code = try(local.m538["erasure_code"], null)
  erasure_code_delay_secs = try(local.m538["erasure_code_delay_secs"], null)
  external_storage_ext_id = try(local.m538["external_storage_ext_id"], null)
  has_higher_ec_fault_domain_preference = try(local.m538["has_higher_ec_fault_domain_preference"], null)
  id = try(local.m538["id"], null)
  is_compression_enabled = try(local.m538["is_compression_enabled"], null)
  is_encrypted = try(local.m538["is_encrypted"], null)
  is_external_storage = try(local.m538["is_external_storage"], null)
  is_inline_ec_enabled = try(local.m538["is_inline_ec_enabled"], null)
  is_internal = try(local.m538["is_internal"], null)
  is_marked_for_removal = try(local.m538["is_marked_for_removal"], null)
  is_nfs_allowlist_inherited = try(local.m538["is_nfs_allowlist_inherited"], null)
  is_shared = try(local.m538["is_shared"], null)
  is_software_encryption_enabled = try(local.m538["is_software_encryption_enabled"], null)
  logical_advertised_capacity_bytes = try(local.m538["logical_advertised_capacity_bytes"], null)
  logical_explicit_reserved_capacity_bytes = try(local.m538["logical_explicit_reserved_capacity_bytes"], null)
  logical_implicit_reserved_capacity_bytes = try(local.m538["logical_implicit_reserved_capacity_bytes"], null)
  max_capacity_bytes = try(local.m538["max_capacity_bytes"], null)
  mod_time = try(local.m538["mod_time"], null)
  moid = try(local.m538["moid"], null)
  name = try(local.m538["name"], null)
  object_type = try(local.m538["object_type"], null)
  on_disk_dedup = try(local.m538["on_disk_dedup"], null)
  owners = try(local.m538["owners"], null)
  replication_factor = try(local.m538["replication_factor"], null)
  results = try(local.m538["results"], null)
  shared_scope = try(local.m538["shared_scope"], null)
  storage_container_ext_id = try(local.m538["storage_container_ext_id"], null)
  storage_pool_ext_id = try(local.m538["storage_pool_ext_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m538["ancestors"], null) == null ? [] : local.m538["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m538["cluster"], null) == null ? [] : local.m538["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "external_storage" {
    for_each = try(local.m538["external_storage"], null) == null ? [] : local.m538["external_storage"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m538["parent"], null) == null ? [] : local.m538["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m538["permission_resources"], null) == null ? [] : local.m538["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m538["registered_device"], null) == null ? [] : local.m538["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m538["tags"], null) == null ? [] : local.m538["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m538["version_context"], null) == null ? [] : local.m538["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
