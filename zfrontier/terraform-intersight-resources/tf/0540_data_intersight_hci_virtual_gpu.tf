# Sample data source intersight_hci_virtual_gpu — reads ../models/data_intersight_hci_virtual_gpu.yml
locals { m540 = yamldecode(file("${path.module}/../models/data_intersight_hci_virtual_gpu.yml"))["data_intersight_hci_virtual_gpu"] }

data "intersight_hci_virtual_gpu" "n540" {
  account_moid = try(local.m540["account_moid"], null)
  additional_properties = try(local.m540["additional_properties"], null)
  allocated_vm_ext_ids = try(local.m540["allocated_vm_ext_ids"], null)
  assignable = try(local.m540["assignable"], null)
  class_id = try(local.m540["class_id"], null)
  cluster_ext_id = try(local.m540["cluster_ext_id"], null)
  create_time = try(local.m540["create_time"], null)
  device_id = try(local.m540["device_id"], null)
  device_name = try(local.m540["device_name"], null)
  domain_group_moid = try(local.m540["domain_group_moid"], null)
  fraction = try(local.m540["fraction"], null)
  frame_buffer_size_bytes = try(local.m540["frame_buffer_size_bytes"], null)
  guest_driver_version = try(local.m540["guest_driver_version"], null)
  id = try(local.m540["id"], null)
  is_in_use = try(local.m540["is_in_use"], null)
  licenses = try(local.m540["licenses"], null)
  max_instances_per_vm = try(local.m540["max_instances_per_vm"], null)
  max_resolution = try(local.m540["max_resolution"], null)
  mod_time = try(local.m540["mod_time"], null)
  moid = try(local.m540["moid"], null)
  numa_node = try(local.m540["numa_node"], null)
  number_of_virtual_display_heads = try(local.m540["number_of_virtual_display_heads"], null)
  object_type = try(local.m540["object_type"], null)
  owners = try(local.m540["owners"], null)
  results = try(local.m540["results"], null)
  sbdf = try(local.m540["sbdf"], null)
  shared_scope = try(local.m540["shared_scope"], null)
  type = try(local.m540["type"], null)
  vendor = try(local.m540["vendor"], null)
  virtual_gpu_ext_id = try(local.m540["virtual_gpu_ext_id"], null)
  dynamic "allocated_vms" {
    for_each = try(local.m540["allocated_vms"], null) == null ? [] : local.m540["allocated_vms"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m540["ancestors"], null) == null ? [] : local.m540["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m540["cluster"], null) == null ? [] : local.m540["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m540["parent"], null) == null ? [] : local.m540["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m540["permission_resources"], null) == null ? [] : local.m540["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m540["registered_device"], null) == null ? [] : local.m540["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m540["tags"], null) == null ? [] : local.m540["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m540["version_context"], null) == null ? [] : local.m540["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
