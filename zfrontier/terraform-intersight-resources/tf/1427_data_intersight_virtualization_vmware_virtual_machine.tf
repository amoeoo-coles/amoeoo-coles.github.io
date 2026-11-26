# Sample data source intersight_virtualization_vmware_virtual_machine — reads ../models/data_intersight_virtualization_vmware_virtual_machine.yml
locals { m1427 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_virtual_machine.yml"))["data_intersight_virtualization_vmware_virtual_machine"] }

data "intersight_virtualization_vmware_virtual_machine" "n1427" {
  account_moid = try(local.m1427["account_moid"], null)
  additional_properties = try(local.m1427["additional_properties"], null)
  annotation = try(local.m1427["annotation"], null)
  boot_time = try(local.m1427["boot_time"], null)
  class_id = try(local.m1427["class_id"], null)
  config_name = try(local.m1427["config_name"], null)
  connection_state = try(local.m1427["connection_state"], null)
  cpu_hot_add_enabled = try(local.m1427["cpu_hot_add_enabled"], null)
  cpu_utilization = try(local.m1427["cpu_utilization"], null)
  create_time = try(local.m1427["create_time"], null)
  custom_attributes = try(local.m1427["custom_attributes"], null)
  default_power_off_type = try(local.m1427["default_power_off_type"], null)
  dhcp_enabled = try(local.m1427["dhcp_enabled"], null)
  dns_server_list = try(local.m1427["dns_server_list"], null)
  dns_suffix_list = try(local.m1427["dns_suffix_list"], null)
  domain_group_moid = try(local.m1427["domain_group_moid"], null)
  extra_config = try(local.m1427["extra_config"], null)
  folder = try(local.m1427["folder"], null)
  guest_state = try(local.m1427["guest_state"], null)
  host_compatibility = try(local.m1427["host_compatibility"], null)
  hypervisor_type = try(local.m1427["hypervisor_type"], null)
  id = try(local.m1427["id"], null)
  identity = try(local.m1427["identity"], null)
  instance_uuid = try(local.m1427["instance_uuid"], null)
  inventory_path = try(local.m1427["inventory_path"], null)
  ip_address = try(local.m1427["ip_address"], null)
  is_template = try(local.m1427["is_template"], null)
  mac_address = try(local.m1427["mac_address"], null)
  memory_hot_add_enabled = try(local.m1427["memory_hot_add_enabled"], null)
  memory_utilization = try(local.m1427["memory_utilization"], null)
  mod_time = try(local.m1427["mod_time"], null)
  moid = try(local.m1427["moid"], null)
  name = try(local.m1427["name"], null)
  network_count = try(local.m1427["network_count"], null)
  nr_provider = try(local.m1427["nr_provider"], null)
  object_type = try(local.m1427["object_type"], null)
  owners = try(local.m1427["owners"], null)
  passthrough_devices = try(local.m1427["passthrough_devices"], null)
  port_groups = try(local.m1427["port_groups"], null)
  power_state = try(local.m1427["power_state"], null)
  protected_vm = try(local.m1427["protected_vm"], null)
  remote_display_vnc_enabled = try(local.m1427["remote_display_vnc_enabled"], null)
  resource_pool = try(local.m1427["resource_pool"], null)
  resource_pool_owner = try(local.m1427["resource_pool_owner"], null)
  resource_pool_parent = try(local.m1427["resource_pool_parent"], null)
  results = try(local.m1427["results"], null)
  shared_scope = try(local.m1427["shared_scope"], null)
  state = try(local.m1427["state"], null)
  tool_running_status = try(local.m1427["tool_running_status"], null)
  tools_version = try(local.m1427["tools_version"], null)
  uuid = try(local.m1427["uuid"], null)
  virtual_disks = try(local.m1427["virtual_disks"], null)
  virtual_network_interfaces = try(local.m1427["virtual_network_interfaces"], null)
  vm_creation_time = try(local.m1427["vm_creation_time"], null)
  vm_disk_count = try(local.m1427["vm_disk_count"], null)
  vm_overall_status = try(local.m1427["vm_overall_status"], null)
  vm_path = try(local.m1427["vm_path"], null)
  vm_version = try(local.m1427["vm_version"], null)
  vm_vnic_count = try(local.m1427["vm_vnic_count"], null)
  vnic_device_config_id = try(local.m1427["vnic_device_config_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1427["ancestors"], null) == null ? [] : local.m1427["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attached_resource_tags" {
    for_each = try(local.m1427["attached_resource_tags"], null) == null ? [] : local.m1427["attached_resource_tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capacity" {
    for_each = try(local.m1427["capacity"], null) == null ? [] : local.m1427["capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m1427["cluster"], null) == null ? [] : local.m1427["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cpu_shares" {
    for_each = try(local.m1427["cpu_shares"], null) == null ? [] : local.m1427["cpu_shares"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cpu_socket_info" {
    for_each = try(local.m1427["cpu_socket_info"], null) == null ? [] : local.m1427["cpu_socket_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datacenter" {
    for_each = try(local.m1427["datacenter"], null) == null ? [] : local.m1427["datacenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datastores" {
    for_each = try(local.m1427["datastores"], null) == null ? [] : local.m1427["datastores"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_commit_info" {
    for_each = try(local.m1427["disk_commit_info"], null) == null ? [] : local.m1427["disk_commit_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guest_info" {
    for_each = try(local.m1427["guest_info"], null) == null ? [] : local.m1427["guest_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1427["host"], null) == null ? [] : local.m1427["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mem_shares" {
    for_each = try(local.m1427["mem_shares"], null) == null ? [] : local.m1427["mem_shares"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_capacity" {
    for_each = try(local.m1427["memory_capacity"], null) == null ? [] : local.m1427["memory_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "networks" {
    for_each = try(local.m1427["networks"], null) == null ? [] : local.m1427["networks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1427["parent"], null) == null ? [] : local.m1427["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_folder" {
    for_each = try(local.m1427["parent_folder"], null) == null ? [] : local.m1427["parent_folder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1427["permission_resources"], null) == null ? [] : local.m1427["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processor_capacity" {
    for_each = try(local.m1427["processor_capacity"], null) == null ? [] : local.m1427["processor_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1427["registered_device"], null) == null ? [] : local.m1427["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "remote_display_info" {
    for_each = try(local.m1427["remote_display_info"], null) == null ? [] : local.m1427["remote_display_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1427["tags"], null) == null ? [] : local.m1427["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1427["version_context"], null) == null ? [] : local.m1427["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
