# Sample data source intersight_virtualization_vmware_host — reads ../models/data_intersight_virtualization_vmware_host.yml
locals { m1418 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_host.yml"))["data_intersight_virtualization_vmware_host"] }

data "intersight_virtualization_vmware_host" "n1418" {
  account_moid = try(local.m1418["account_moid"], null)
  additional_properties = try(local.m1418["additional_properties"], null)
  boot_time = try(local.m1418["boot_time"], null)
  class_id = try(local.m1418["class_id"], null)
  connection_state = try(local.m1418["connection_state"], null)
  create_time = try(local.m1418["create_time"], null)
  dc_inv_path = try(local.m1418["dc_inv_path"], null)
  dns_servers = try(local.m1418["dns_servers"], null)
  domain_group_moid = try(local.m1418["domain_group_moid"], null)
  hw_power_state = try(local.m1418["hw_power_state"], null)
  hypervisor_type = try(local.m1418["hypervisor_type"], null)
  id = try(local.m1418["id"], null)
  identity = try(local.m1418["identity"], null)
  is_ssh_enabled = try(local.m1418["is_ssh_enabled"], null)
  maintenance_mode = try(local.m1418["maintenance_mode"], null)
  mod_time = try(local.m1418["mod_time"], null)
  model = try(local.m1418["model"], null)
  moid = try(local.m1418["moid"], null)
  name = try(local.m1418["name"], null)
  network_adapter_count = try(local.m1418["network_adapter_count"], null)
  ntp_servers = try(local.m1418["ntp_servers"], null)
  object_type = try(local.m1418["object_type"], null)
  owners = try(local.m1418["owners"], null)
  quarantine_mode = try(local.m1418["quarantine_mode"], null)
  results = try(local.m1418["results"], null)
  serial = try(local.m1418["serial"], null)
  shared_scope = try(local.m1418["shared_scope"], null)
  status = try(local.m1418["status"], null)
  storage_adapter_count = try(local.m1418["storage_adapter_count"], null)
  time_zone = try(local.m1418["time_zone"], null)
  up_time = try(local.m1418["up_time"], null)
  uuid = try(local.m1418["uuid"], null)
  vcenter_host_id = try(local.m1418["vcenter_host_id"], null)
  vendor = try(local.m1418["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1418["ancestors"], null) == null ? [] : local.m1418["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attached_resource_tags" {
    for_each = try(local.m1418["attached_resource_tags"], null) == null ? [] : local.m1418["attached_resource_tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m1418["cluster"], null) == null ? [] : local.m1418["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cpu_info" {
    for_each = try(local.m1418["cpu_info"], null) == null ? [] : local.m1418["cpu_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datacenter" {
    for_each = try(local.m1418["datacenter"], null) == null ? [] : local.m1418["datacenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datastores" {
    for_each = try(local.m1418["datastores"], null) == null ? [] : local.m1418["datastores"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributed_networks" {
    for_each = try(local.m1418["distributed_networks"], null) == null ? [] : local.m1418["distributed_networks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributed_switches" {
    for_each = try(local.m1418["distributed_switches"], null) == null ? [] : local.m1418["distributed_switches"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hardware_info" {
    for_each = try(local.m1418["hardware_info"], null) == null ? [] : local.m1418["hardware_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hyper_flex_node" {
    for_each = try(local.m1418["hyper_flex_node"], null) == null ? [] : local.m1418["hyper_flex_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_capacity" {
    for_each = try(local.m1418["memory_capacity"], null) == null ? [] : local.m1418["memory_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1418["parent"], null) == null ? [] : local.m1418["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1418["permission_resources"], null) == null ? [] : local.m1418["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processor_capacity" {
    for_each = try(local.m1418["processor_capacity"], null) == null ? [] : local.m1418["processor_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "product_info" {
    for_each = try(local.m1418["product_info"], null) == null ? [] : local.m1418["product_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1418["registered_device"], null) == null ? [] : local.m1418["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_consumed" {
    for_each = try(local.m1418["resource_consumed"], null) == null ? [] : local.m1418["resource_consumed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m1418["server"], null) == null ? [] : local.m1418["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1418["tags"], null) == null ? [] : local.m1418["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1418["version_context"], null) == null ? [] : local.m1418["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
