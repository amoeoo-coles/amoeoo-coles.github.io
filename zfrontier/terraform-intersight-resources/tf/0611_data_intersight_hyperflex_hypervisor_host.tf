# Sample data source intersight_hyperflex_hypervisor_host — reads ../models/data_intersight_hyperflex_hypervisor_host.yml
locals { m611 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_hypervisor_host.yml"))["data_intersight_hyperflex_hypervisor_host"] }

data "intersight_hyperflex_hypervisor_host" "n611" {
  account_moid = try(local.m611["account_moid"], null)
  additional_properties = try(local.m611["additional_properties"], null)
  class_id = try(local.m611["class_id"], null)
  configured_memory = try(local.m611["configured_memory"], null)
  controller_vm_display_version = try(local.m611["controller_vm_display_version"], null)
  controller_vm_hxdp_display_version = try(local.m611["controller_vm_hxdp_display_version"], null)
  controller_vm_hxdp_version = try(local.m611["controller_vm_hxdp_version"], null)
  controller_vm_uuid = try(local.m611["controller_vm_uuid"], null)
  controller_vm_version = try(local.m611["controller_vm_version"], null)
  create_time = try(local.m611["create_time"], null)
  domain_group_moid = try(local.m611["domain_group_moid"], null)
  host_status = try(local.m611["host_status"], null)
  hypervisor = try(local.m611["hypervisor"], null)
  hypervisor_type = try(local.m611["hypervisor_type"], null)
  id = try(local.m611["id"], null)
  identity = try(local.m611["identity"], null)
  lockdown = try(local.m611["lockdown"], null)
  maintenance_mode = try(local.m611["maintenance_mode"], null)
  mod_time = try(local.m611["mod_time"], null)
  model = try(local.m611["model"], null)
  moid = try(local.m611["moid"], null)
  name = try(local.m611["name"], null)
  object_type = try(local.m611["object_type"], null)
  os_version = try(local.m611["os_version"], null)
  owners = try(local.m611["owners"], null)
  results = try(local.m611["results"], null)
  role = try(local.m611["role"], null)
  serial = try(local.m611["serial"], null)
  shared_scope = try(local.m611["shared_scope"], null)
  status = try(local.m611["status"], null)
  template_version = try(local.m611["template_version"], null)
  up_time = try(local.m611["up_time"], null)
  uuid = try(local.m611["uuid"], null)
  vendor = try(local.m611["vendor"], null)
  virtual_cpus = try(local.m611["virtual_cpus"], null)
  dynamic "ancestors" {
    for_each = try(local.m611["ancestors"], null) == null ? [] : local.m611["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m611["cluster"], null) == null ? [] : local.m611["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cpu_info" {
    for_each = try(local.m611["cpu_info"], null) == null ? [] : local.m611["cpu_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "data_ip" {
    for_each = try(local.m611["data_ip"], null) == null ? [] : local.m611["data_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hardware_info" {
    for_each = try(local.m611["hardware_info"], null) == null ? [] : local.m611["hardware_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip" {
    for_each = try(local.m611["ip"], null) == null ? [] : local.m611["ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_capacity" {
    for_each = try(local.m611["memory_capacity"], null) == null ? [] : local.m611["memory_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mgmt_ip" {
    for_each = try(local.m611["mgmt_ip"], null) == null ? [] : local.m611["mgmt_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node" {
    for_each = try(local.m611["node"], null) == null ? [] : local.m611["node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m611["parent"], null) == null ? [] : local.m611["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m611["permission_resources"], null) == null ? [] : local.m611["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processor_capacity" {
    for_each = try(local.m611["processor_capacity"], null) == null ? [] : local.m611["processor_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "product_info" {
    for_each = try(local.m611["product_info"], null) == null ? [] : local.m611["product_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m611["registered_device"], null) == null ? [] : local.m611["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m611["tags"], null) == null ? [] : local.m611["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m611["version_context"], null) == null ? [] : local.m611["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
