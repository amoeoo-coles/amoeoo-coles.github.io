# Sample data source intersight_hci_gpu — reads ../models/data_intersight_hci_gpu.yml
locals { m533 = yamldecode(file("${path.module}/../models/data_intersight_hci_gpu.yml"))["data_intersight_hci_gpu"] }

data "intersight_hci_gpu" "n533" {
  account_moid = try(local.m533["account_moid"], null)
  additional_properties = try(local.m533["additional_properties"], null)
  class_id = try(local.m533["class_id"], null)
  cluster_ext_id = try(local.m533["cluster_ext_id"], null)
  cluster_name = try(local.m533["cluster_name"], null)
  controller_vm_id = try(local.m533["controller_vm_id"], null)
  create_time = try(local.m533["create_time"], null)
  domain_group_moid = try(local.m533["domain_group_moid"], null)
  gpu_ext_id = try(local.m533["gpu_ext_id"], null)
  id = try(local.m533["id"], null)
  mod_time = try(local.m533["mod_time"], null)
  moid = try(local.m533["moid"], null)
  node_ext_id = try(local.m533["node_ext_id"], null)
  number_of_vgpus_allocated = try(local.m533["number_of_vgpus_allocated"], null)
  object_type = try(local.m533["object_type"], null)
  owners = try(local.m533["owners"], null)
  results = try(local.m533["results"], null)
  shared_scope = try(local.m533["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m533["ancestors"], null) == null ? [] : local.m533["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node" {
    for_each = try(local.m533["node"], null) == null ? [] : local.m533["node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m533["parent"], null) == null ? [] : local.m533["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m533["permission_resources"], null) == null ? [] : local.m533["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m533["registered_device"], null) == null ? [] : local.m533["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m533["tags"], null) == null ? [] : local.m533["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m533["version_context"], null) == null ? [] : local.m533["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_gpu_config" {
    for_each = try(local.m533["virtual_gpu_config"], null) == null ? [] : local.m533["virtual_gpu_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
