# Sample data source intersight_hci_node — reads ../models/data_intersight_hci_node.yml
locals { m536 = yamldecode(file("${path.module}/../models/data_intersight_hci_node.yml"))["data_intersight_hci_node"] }

data "intersight_hci_node" "n536" {
  account_moid = try(local.m536["account_moid"], null)
  additional_properties = try(local.m536["additional_properties"], null)
  block_model = try(local.m536["block_model"], null)
  block_serial = try(local.m536["block_serial"], null)
  boot_time_usecs = try(local.m536["boot_time_usecs"], null)
  class_id = try(local.m536["class_id"], null)
  cluster_ext_id = try(local.m536["cluster_ext_id"], null)
  cluster_name = try(local.m536["cluster_name"], null)
  controller_vm_id = try(local.m536["controller_vm_id"], null)
  controller_vm_maintanence_mode = try(local.m536["controller_vm_maintanence_mode"], null)
  controller_vm_nat_port = try(local.m536["controller_vm_nat_port"], null)
  controller_vm_server_uuid = try(local.m536["controller_vm_server_uuid"], null)
  cpu_capacity_hz = try(local.m536["cpu_capacity_hz"], null)
  cpu_frequency_hz = try(local.m536["cpu_frequency_hz"], null)
  cpu_model = try(local.m536["cpu_model"], null)
  cpu_usage_hz = try(local.m536["cpu_usage_hz"], null)
  create_time = try(local.m536["create_time"], null)
  default_vhd_container_uuid = try(local.m536["default_vhd_container_uuid"], null)
  default_vhd_location = try(local.m536["default_vhd_location"], null)
  default_vm_container_uuid = try(local.m536["default_vm_container_uuid"], null)
  default_vm_location = try(local.m536["default_vm_location"], null)
  disk_count = try(local.m536["disk_count"], null)
  domain_group_moid = try(local.m536["domain_group_moid"], null)
  failover_cluster_fqdn = try(local.m536["failover_cluster_fqdn"], null)
  failover_cluster_node_status = try(local.m536["failover_cluster_node_status"], null)
  gpu_count = try(local.m536["gpu_count"], null)
  gpu_driver_version = try(local.m536["gpu_driver_version"], null)
  has_csr = try(local.m536["has_csr"], null)
  host_name = try(local.m536["host_name"], null)
  host_type = try(local.m536["host_type"], null)
  hypervisor_acropolis_connection_state = try(local.m536["hypervisor_acropolis_connection_state"], null)
  hypervisor_number_of_vms = try(local.m536["hypervisor_number_of_vms"], null)
  hypervisor_state = try(local.m536["hypervisor_state"], null)
  hypervisor_type = try(local.m536["hypervisor_type"], null)
  hypervisor_user_name = try(local.m536["hypervisor_user_name"], null)
  hypervisor_version = try(local.m536["hypervisor_version"], null)
  id = try(local.m536["id"], null)
  ipmi_username = try(local.m536["ipmi_username"], null)
  is_degraded = try(local.m536["is_degraded"], null)
  is_hardware_virtualized = try(local.m536["is_hardware_virtualized"], null)
  is_secure_booted = try(local.m536["is_secure_booted"], null)
  maintenance_state = try(local.m536["maintenance_state"], null)
  memory_capacity_bytes = try(local.m536["memory_capacity_bytes"], null)
  memory_size_bytes = try(local.m536["memory_size_bytes"], null)
  memory_usage_bytes = try(local.m536["memory_usage_bytes"], null)
  mod_time = try(local.m536["mod_time"], null)
  moid = try(local.m536["moid"], null)
  node_ext_id = try(local.m536["node_ext_id"], null)
  node_serial = try(local.m536["node_serial"], null)
  node_status = try(local.m536["node_status"], null)
  number_of_cpu_cores = try(local.m536["number_of_cpu_cores"], null)
  number_of_cpu_sockets = try(local.m536["number_of_cpu_sockets"], null)
  number_of_cpu_threads = try(local.m536["number_of_cpu_threads"], null)
  object_type = try(local.m536["object_type"], null)
  owners = try(local.m536["owners"], null)
  reboot_pending = try(local.m536["reboot_pending"], null)
  results = try(local.m536["results"], null)
  shared_scope = try(local.m536["shared_scope"], null)
  storage_capacity_bytes = try(local.m536["storage_capacity_bytes"], null)
  storage_usage_bytes = try(local.m536["storage_usage_bytes"], null)
  dynamic "ancestors" {
    for_each = try(local.m536["ancestors"], null) == null ? [] : local.m536["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m536["cluster"], null) == null ? [] : local.m536["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller_vm_backplane_address" {
    for_each = try(local.m536["controller_vm_backplane_address"], null) == null ? [] : local.m536["controller_vm_backplane_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller_vm_external_address" {
    for_each = try(local.m536["controller_vm_external_address"], null) == null ? [] : local.m536["controller_vm_external_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller_vm_nat_ip" {
    for_each = try(local.m536["controller_vm_nat_ip"], null) == null ? [] : local.m536["controller_vm_nat_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller_vm_rdma_backplane_address" {
    for_each = try(local.m536["controller_vm_rdma_backplane_address"], null) == null ? [] : local.m536["controller_vm_rdma_backplane_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disks" {
    for_each = try(local.m536["disks"], null) == null ? [] : local.m536["disks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "gpus" {
    for_each = try(local.m536["gpus"], null) == null ? [] : local.m536["gpus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hypervisor_external_address" {
    for_each = try(local.m536["hypervisor_external_address"], null) == null ? [] : local.m536["hypervisor_external_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ipmi_ip" {
    for_each = try(local.m536["ipmi_ip"], null) == null ? [] : local.m536["ipmi_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "key_management_device_to_cert_status" {
    for_each = try(local.m536["key_management_device_to_cert_status"], null) == null ? [] : local.m536["key_management_device_to_cert_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m536["parent"], null) == null ? [] : local.m536["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m536["permission_resources"], null) == null ? [] : local.m536["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_server" {
    for_each = try(local.m536["physical_server"], null) == null ? [] : local.m536["physical_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m536["registered_device"], null) == null ? [] : local.m536["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m536["tags"], null) == null ? [] : local.m536["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m536["version_context"], null) == null ? [] : local.m536["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vms" {
    for_each = try(local.m536["vms"], null) == null ? [] : local.m536["vms"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
