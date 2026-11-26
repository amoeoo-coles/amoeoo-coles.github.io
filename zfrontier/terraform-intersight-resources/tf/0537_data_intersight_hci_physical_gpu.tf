# Sample data source intersight_hci_physical_gpu — reads ../models/data_intersight_hci_physical_gpu.yml
locals { m537 = yamldecode(file("${path.module}/../models/data_intersight_hci_physical_gpu.yml"))["data_intersight_hci_physical_gpu"] }

data "intersight_hci_physical_gpu" "n537" {
  account_moid = try(local.m537["account_moid"], null)
  additional_properties = try(local.m537["additional_properties"], null)
  allocated_vm_ext_ids = try(local.m537["allocated_vm_ext_ids"], null)
  assignable = try(local.m537["assignable"], null)
  class_id = try(local.m537["class_id"], null)
  cluster_ext_id = try(local.m537["cluster_ext_id"], null)
  create_time = try(local.m537["create_time"], null)
  device_id = try(local.m537["device_id"], null)
  device_name = try(local.m537["device_name"], null)
  domain_group_moid = try(local.m537["domain_group_moid"], null)
  frame_buffer_size_bytes = try(local.m537["frame_buffer_size_bytes"], null)
  id = try(local.m537["id"], null)
  is_in_use = try(local.m537["is_in_use"], null)
  mod_time = try(local.m537["mod_time"], null)
  mode = try(local.m537["mode"], null)
  moid = try(local.m537["moid"], null)
  numa_node = try(local.m537["numa_node"], null)
  object_type = try(local.m537["object_type"], null)
  owners = try(local.m537["owners"], null)
  physical_gpu_ext_id = try(local.m537["physical_gpu_ext_id"], null)
  results = try(local.m537["results"], null)
  sbdf = try(local.m537["sbdf"], null)
  shared_scope = try(local.m537["shared_scope"], null)
  type = try(local.m537["type"], null)
  vendor = try(local.m537["vendor"], null)
  dynamic "allocated_vms" {
    for_each = try(local.m537["allocated_vms"], null) == null ? [] : local.m537["allocated_vms"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m537["ancestors"], null) == null ? [] : local.m537["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m537["cluster"], null) == null ? [] : local.m537["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m537["parent"], null) == null ? [] : local.m537["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m537["permission_resources"], null) == null ? [] : local.m537["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m537["registered_device"], null) == null ? [] : local.m537["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m537["tags"], null) == null ? [] : local.m537["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m537["version_context"], null) == null ? [] : local.m537["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
