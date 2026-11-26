# Sample data source intersight_hci_disk — reads ../models/data_intersight_hci_disk.yml
locals { m526 = yamldecode(file("${path.module}/../models/data_intersight_hci_disk.yml"))["data_intersight_hci_disk"] }

data "intersight_hci_disk" "n526" {
  account_moid = try(local.m526["account_moid"], null)
  additional_properties = try(local.m526["additional_properties"], null)
  class_id = try(local.m526["class_id"], null)
  cluster_ext_id = try(local.m526["cluster_ext_id"], null)
  cluster_name = try(local.m526["cluster_name"], null)
  create_time = try(local.m526["create_time"], null)
  disk_ext_id = try(local.m526["disk_ext_id"], null)
  disk_size_bytes = try(local.m526["disk_size_bytes"], null)
  domain_group_moid = try(local.m526["domain_group_moid"], null)
  firmware_version = try(local.m526["firmware_version"], null)
  has_boot_partitions_only = try(local.m526["has_boot_partitions_only"], null)
  host_name = try(local.m526["host_name"], null)
  id = try(local.m526["id"], null)
  is_boot_disk = try(local.m526["is_boot_disk"], null)
  is_data_migrated = try(local.m526["is_data_migrated"], null)
  is_diagnostic_info_available = try(local.m526["is_diagnostic_info_available"], null)
  is_error_found_in_logs = try(local.m526["is_error_found_in_logs"], null)
  is_marked_for_removal = try(local.m526["is_marked_for_removal"], null)
  is_mounted = try(local.m526["is_mounted"], null)
  is_online = try(local.m526["is_online"], null)
  is_password_protected = try(var.secrets["data_intersight_hci_disk.is_password_protected"], local.m526["is_password_protected"])
  is_planned_outage = try(local.m526["is_planned_outage"], null)
  is_self_encrypting_drive = try(local.m526["is_self_encrypting_drive"], null)
  is_self_managed_nvme = try(local.m526["is_self_managed_nvme"], null)
  is_spdk_managed = try(local.m526["is_spdk_managed"], null)
  is_suspected_unhealthy = try(local.m526["is_suspected_unhealthy"], null)
  is_under_diagnosis = try(local.m526["is_under_diagnosis"], null)
  is_unhealthy = try(local.m526["is_unhealthy"], null)
  location = try(local.m526["location"], null)
  mod_time = try(local.m526["mod_time"], null)
  model = try(local.m526["model"], null)
  moid = try(local.m526["moid"], null)
  mount_path = try(local.m526["mount_path"], null)
  node_ext_id = try(local.m526["node_ext_id"], null)
  nvme_pcie_path = try(local.m526["nvme_pcie_path"], null)
  object_type = try(local.m526["object_type"], null)
  owners = try(local.m526["owners"], null)
  physical_capacity_bytes = try(local.m526["physical_capacity_bytes"], null)
  results = try(local.m526["results"], null)
  serial_number = try(local.m526["serial_number"], null)
  service_vm_id = try(local.m526["service_vm_id"], null)
  shared_scope = try(local.m526["shared_scope"], null)
  status = try(local.m526["status"], null)
  storage_pool_ext_id = try(local.m526["storage_pool_ext_id"], null)
  storage_tier = try(local.m526["storage_tier"], null)
  target_firmware_version = try(local.m526["target_firmware_version"], null)
  vendor = try(local.m526["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m526["ancestors"], null) == null ? [] : local.m526["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cvm_ip_address" {
    for_each = try(local.m526["cvm_ip_address"], null) == null ? [] : local.m526["cvm_ip_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node" {
    for_each = try(local.m526["node"], null) == null ? [] : local.m526["node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_ip_address" {
    for_each = try(local.m526["node_ip_address"], null) == null ? [] : local.m526["node_ip_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m526["parent"], null) == null ? [] : local.m526["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m526["permission_resources"], null) == null ? [] : local.m526["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m526["registered_device"], null) == null ? [] : local.m526["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m526["tags"], null) == null ? [] : local.m526["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m526["version_context"], null) == null ? [] : local.m526["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
