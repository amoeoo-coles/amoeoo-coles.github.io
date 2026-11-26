# Sample data source intersight_hci_esxi_vm — reads ../models/data_intersight_hci_esxi_vm.yml
locals { m529 = yamldecode(file("${path.module}/../models/data_intersight_hci_esxi_vm.yml"))["data_intersight_hci_esxi_vm"] }

data "intersight_hci_esxi_vm" "n529" {
  account_moid = try(local.m529["account_moid"], null)
  additional_properties = try(local.m529["additional_properties"], null)
  class_id = try(local.m529["class_id"], null)
  cluster_ext_id = try(local.m529["cluster_ext_id"], null)
  create_time = try(local.m529["create_time"], null)
  description = try(local.m529["description"], null)
  domain_group_moid = try(local.m529["domain_group_moid"], null)
  guest_os_name = try(local.m529["guest_os_name"], null)
  hypervisor_type = try(local.m529["hypervisor_type"], null)
  id = try(local.m529["id"], null)
  memory_size_bytes = try(local.m529["memory_size_bytes"], null)
  mod_time = try(local.m529["mod_time"], null)
  moid = try(local.m529["moid"], null)
  name = try(local.m529["name"], null)
  node_ext_id = try(local.m529["node_ext_id"], null)
  num_cores_per_socket = try(local.m529["num_cores_per_socket"], null)
  num_cpu_cores = try(local.m529["num_cpu_cores"], null)
  object_type = try(local.m529["object_type"], null)
  owners = try(local.m529["owners"], null)
  power_state = try(local.m529["power_state"], null)
  results = try(local.m529["results"], null)
  shared_scope = try(local.m529["shared_scope"], null)
  virtual_hardware_version = try(local.m529["virtual_hardware_version"], null)
  vm_ext_id = try(local.m529["vm_ext_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m529["ancestors"], null) == null ? [] : local.m529["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m529["cluster"], null) == null ? [] : local.m529["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disks" {
    for_each = try(local.m529["disks"], null) == null ? [] : local.m529["disks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guest_tools" {
    for_each = try(local.m529["guest_tools"], null) == null ? [] : local.m529["guest_tools"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nics" {
    for_each = try(local.m529["nics"], null) == null ? [] : local.m529["nics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node" {
    for_each = try(local.m529["node"], null) == null ? [] : local.m529["node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m529["parent"], null) == null ? [] : local.m529["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m529["permission_resources"], null) == null ? [] : local.m529["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m529["registered_device"], null) == null ? [] : local.m529["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m529["tags"], null) == null ? [] : local.m529["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m529["version_context"], null) == null ? [] : local.m529["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
