# Sample data source intersight_hci_ahv_vm_disk — reads ../models/data_intersight_hci_ahv_vm_disk.yml
locals { m519 = yamldecode(file("${path.module}/../models/data_intersight_hci_ahv_vm_disk.yml"))["data_intersight_hci_ahv_vm_disk"] }

data "intersight_hci_ahv_vm_disk" "n519" {
  account_moid = try(local.m519["account_moid"], null)
  additional_properties = try(local.m519["additional_properties"], null)
  adsf_volume_group_ext_id = try(local.m519["adsf_volume_group_ext_id"], null)
  bus_type = try(local.m519["bus_type"], null)
  class_id = try(local.m519["class_id"], null)
  create_time = try(local.m519["create_time"], null)
  disk_ext_id = try(local.m519["disk_ext_id"], null)
  disk_size_bytes = try(local.m519["disk_size_bytes"], null)
  domain_group_moid = try(local.m519["domain_group_moid"], null)
  id = try(local.m519["id"], null)
  index = try(local.m519["index"], null)
  is_external_storage = try(local.m519["is_external_storage"], null)
  is_flash_mode_enabled = try(local.m519["is_flash_mode_enabled"], null)
  is_migration_in_progress = try(local.m519["is_migration_in_progress"], null)
  mod_time = try(local.m519["mod_time"], null)
  moid = try(local.m519["moid"], null)
  object_type = try(local.m519["object_type"], null)
  owners = try(local.m519["owners"], null)
  results = try(local.m519["results"], null)
  shared_scope = try(local.m519["shared_scope"], null)
  storage_container_ext_id = try(local.m519["storage_container_ext_id"], null)
  vm_ext_id = try(local.m519["vm_ext_id"], null)
  volume_ext_id = try(local.m519["volume_ext_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m519["ancestors"], null) == null ? [] : local.m519["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m519["parent"], null) == null ? [] : local.m519["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m519["permission_resources"], null) == null ? [] : local.m519["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m519["registered_device"], null) == null ? [] : local.m519["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m519["storage_container"], null) == null ? [] : local.m519["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m519["tags"], null) == null ? [] : local.m519["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m519["version_context"], null) == null ? [] : local.m519["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm" {
    for_each = try(local.m519["vm"], null) == null ? [] : local.m519["vm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volume" {
    for_each = try(local.m519["volume"], null) == null ? [] : local.m519["volume"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
