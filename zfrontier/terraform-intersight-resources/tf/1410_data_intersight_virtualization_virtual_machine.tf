# Sample data source intersight_virtualization_virtual_machine — reads ../models/data_intersight_virtualization_virtual_machine.yml
locals { m1410 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_virtual_machine.yml"))["data_intersight_virtualization_virtual_machine"] }

data "intersight_virtualization_virtual_machine" "n1410" {
  account_moid = try(local.m1410["account_moid"], null)
  action = try(local.m1410["action"], null)
  additional_properties = try(local.m1410["additional_properties"], null)
  class_id = try(local.m1410["class_id"], null)
  cluster_esxi = try(local.m1410["cluster_esxi"], null)
  cpu = try(local.m1410["cpu"], null)
  create_time = try(local.m1410["create_time"], null)
  discovered = try(local.m1410["discovered"], null)
  domain_group_moid = try(local.m1410["domain_group_moid"], null)
  force_delete = try(local.m1410["force_delete"], null)
  guest_os = try(local.m1410["guest_os"], null)
  host_esxi = try(local.m1410["host_esxi"], null)
  hypervisor_type = try(local.m1410["hypervisor_type"], null)
  id = try(local.m1410["id"], null)
  memory = try(local.m1410["memory"], null)
  mod_time = try(local.m1410["mod_time"], null)
  moid = try(local.m1410["moid"], null)
  name = try(local.m1410["name"], null)
  object_type = try(local.m1410["object_type"], null)
  owners = try(local.m1410["owners"], null)
  power_state = try(local.m1410["power_state"], null)
  provision_type = try(local.m1410["provision_type"], null)
  results = try(local.m1410["results"], null)
  shared_scope = try(local.m1410["shared_scope"], null)
  dynamic "action_info" {
    for_each = try(local.m1410["action_info"], null) == null ? [] : local.m1410["action_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "affinity_selectors" {
    for_each = try(local.m1410["affinity_selectors"], null) == null ? [] : local.m1410["affinity_selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1410["ancestors"], null) == null ? [] : local.m1410["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "anti_affinity_selectors" {
    for_each = try(local.m1410["anti_affinity_selectors"], null) == null ? [] : local.m1410["anti_affinity_selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cloud_init_config" {
    for_each = try(local.m1410["cloud_init_config"], null) == null ? [] : local.m1410["cloud_init_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m1410["cluster"], null) == null ? [] : local.m1410["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk" {
    for_each = try(local.m1410["disk"], null) == null ? [] : local.m1410["disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "gpu_configs" {
    for_each = try(local.m1410["gpu_configs"], null) == null ? [] : local.m1410["gpu_configs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1410["host"], null) == null ? [] : local.m1410["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interfaces" {
    for_each = try(local.m1410["interfaces"], null) == null ? [] : local.m1410["interfaces"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory" {
    for_each = try(local.m1410["inventory"], null) == null ? [] : local.m1410["inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "labels" {
    for_each = try(local.m1410["labels"], null) == null ? [] : local.m1410["labels"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1410["parent"], null) == null ? [] : local.m1410["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1410["permission_resources"], null) == null ? [] : local.m1410["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1410["registered_device"], null) == null ? [] : local.m1410["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1410["tags"], null) == null ? [] : local.m1410["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1410["version_context"], null) == null ? [] : local.m1410["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_config" {
    for_each = try(local.m1410["vm_config"], null) == null ? [] : local.m1410["vm_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m1410["workflow_info"], null) == null ? [] : local.m1410["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
