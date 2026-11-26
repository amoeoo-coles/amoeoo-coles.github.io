# Sample data source intersight_hci_ahv_vm — reads ../models/data_intersight_hci_ahv_vm.yml
locals { m518 = yamldecode(file("${path.module}/../models/data_intersight_hci_ahv_vm.yml"))["data_intersight_hci_ahv_vm"] }

data "intersight_hci_ahv_vm" "n518" {
  account_moid = try(local.m518["account_moid"], null)
  additional_properties = try(local.m518["additional_properties"], null)
  bios_uuid = try(local.m518["bios_uuid"], null)
  class_id = try(local.m518["class_id"], null)
  cluster_ext_id = try(local.m518["cluster_ext_id"], null)
  create_time = try(local.m518["create_time"], null)
  creation_time = try(local.m518["creation_time"], null)
  description = try(local.m518["description"], null)
  domain_group_moid = try(local.m518["domain_group_moid"], null)
  enabled_cpu_features = try(local.m518["enabled_cpu_features"], null)
  generation_uuid = try(local.m518["generation_uuid"], null)
  guest_os_name = try(local.m518["guest_os_name"], null)
  hardware_clock_timezone = try(local.m518["hardware_clock_timezone"], null)
  hypervisor_type = try(local.m518["hypervisor_type"], null)
  id = try(local.m518["id"], null)
  is_agent_vm = try(local.m518["is_agent_vm"], null)
  is_branding_enabled = try(local.m518["is_branding_enabled"], null)
  is_cpu_hotplug_enabled = try(local.m518["is_cpu_hotplug_enabled"], null)
  is_cpu_passthrough_enabled = try(local.m518["is_cpu_passthrough_enabled"], null)
  is_cross_cluster_migration_in_progress = try(local.m518["is_cross_cluster_migration_in_progress"], null)
  is_gpu_console_enabled = try(local.m518["is_gpu_console_enabled"], null)
  is_live_migrate_capable = try(local.m518["is_live_migrate_capable"], null)
  is_memory_overcommit_enabled = try(local.m518["is_memory_overcommit_enabled"], null)
  is_scsi_controller_enabled = try(local.m518["is_scsi_controller_enabled"], null)
  is_vcpu_hard_pinning_enabled = try(local.m518["is_vcpu_hard_pinning_enabled"], null)
  is_vga_console_enabled = try(local.m518["is_vga_console_enabled"], null)
  is_vtpm_enabled = try(local.m518["is_vtpm_enabled"], null)
  machine_type = try(local.m518["machine_type"], null)
  memory_size_bytes = try(local.m518["memory_size_bytes"], null)
  mod_time = try(local.m518["mod_time"], null)
  moid = try(local.m518["moid"], null)
  name = try(local.m518["name"], null)
  node_ext_id = try(local.m518["node_ext_id"], null)
  num_cores_per_socket = try(local.m518["num_cores_per_socket"], null)
  num_cpu_cores = try(local.m518["num_cpu_cores"], null)
  num_numa_nodes = try(local.m518["num_numa_nodes"], null)
  num_sockets = try(local.m518["num_sockets"], null)
  num_threads_per_core = try(local.m518["num_threads_per_core"], null)
  object_type = try(local.m518["object_type"], null)
  owners = try(local.m518["owners"], null)
  power_state = try(local.m518["power_state"], null)
  protection_type = try(local.m518["protection_type"], null)
  results = try(local.m518["results"], null)
  shared_scope = try(local.m518["shared_scope"], null)
  source_uuid = try(local.m518["source_uuid"], null)
  update_time = try(local.m518["update_time"], null)
  vm_ext_id = try(local.m518["vm_ext_id"], null)
  vtpm_module_version = try(local.m518["vtpm_module_version"], null)
  dynamic "ancestors" {
    for_each = try(local.m518["ancestors"], null) == null ? [] : local.m518["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m518["cluster"], null) == null ? [] : local.m518["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disks" {
    for_each = try(local.m518["disks"], null) == null ? [] : local.m518["disks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "gpus" {
    for_each = try(local.m518["gpus"], null) == null ? [] : local.m518["gpus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guest_tools" {
    for_each = try(local.m518["guest_tools"], null) == null ? [] : local.m518["guest_tools"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nics" {
    for_each = try(local.m518["nics"], null) == null ? [] : local.m518["nics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node" {
    for_each = try(local.m518["node"], null) == null ? [] : local.m518["node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m518["parent"], null) == null ? [] : local.m518["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m518["permission_resources"], null) == null ? [] : local.m518["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m518["registered_device"], null) == null ? [] : local.m518["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m518["tags"], null) == null ? [] : local.m518["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m518["version_context"], null) == null ? [] : local.m518["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
