# Sample data source intersight_hyperflex_hypervisor_virtual_machine — reads ../models/data_intersight_hyperflex_hypervisor_virtual_machine.yml
locals { m612 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_hypervisor_virtual_machine.yml"))["data_intersight_hyperflex_hypervisor_virtual_machine"] }

data "intersight_hyperflex_hypervisor_virtual_machine" "n612" {
  account_moid = try(local.m612["account_moid"], null)
  additional_properties = try(local.m612["additional_properties"], null)
  boot_time = try(local.m612["boot_time"], null)
  class_id = try(local.m612["class_id"], null)
  connection_state = try(local.m612["connection_state"], null)
  cpu_utilization = try(local.m612["cpu_utilization"], null)
  create_time = try(local.m612["create_time"], null)
  domain_group_moid = try(local.m612["domain_group_moid"], null)
  guest_os_state = try(local.m612["guest_os_state"], null)
  host_uuid = try(local.m612["host_uuid"], null)
  hypervisor_type = try(local.m612["hypervisor_type"], null)
  id = try(local.m612["id"], null)
  identity = try(local.m612["identity"], null)
  ip_address = try(local.m612["ip_address"], null)
  memory_utilization = try(local.m612["memory_utilization"], null)
  mod_time = try(local.m612["mod_time"], null)
  moid = try(local.m612["moid"], null)
  name = try(local.m612["name"], null)
  nr_provider = try(local.m612["nr_provider"], null)
  object_type = try(local.m612["object_type"], null)
  owners = try(local.m612["owners"], null)
  path = try(local.m612["path"], null)
  platform_instance_id = try(local.m612["platform_instance_id"], null)
  power_state = try(local.m612["power_state"], null)
  results = try(local.m612["results"], null)
  shared_scope = try(local.m612["shared_scope"], null)
  state = try(local.m612["state"], null)
  storage_provisioned_in_bytes = try(local.m612["storage_provisioned_in_bytes"], null)
  storage_used_in_bytes = try(local.m612["storage_used_in_bytes"], null)
  template = try(local.m612["template"], null)
  uuid = try(local.m612["uuid"], null)
  vm_creation_time = try(local.m612["vm_creation_time"], null)
  vm_instance_uuid = try(local.m612["vm_instance_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m612["ancestors"], null) == null ? [] : local.m612["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capacity" {
    for_each = try(local.m612["capacity"], null) == null ? [] : local.m612["capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m612["cluster"], null) == null ? [] : local.m612["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guest_info" {
    for_each = try(local.m612["guest_info"], null) == null ? [] : local.m612["guest_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m612["host"], null) == null ? [] : local.m612["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip" {
    for_each = try(local.m612["ip"], null) == null ? [] : local.m612["ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_capacity" {
    for_each = try(local.m612["memory_capacity"], null) == null ? [] : local.m612["memory_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m612["parent"], null) == null ? [] : local.m612["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m612["permission_resources"], null) == null ? [] : local.m612["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processor_capacity" {
    for_each = try(local.m612["processor_capacity"], null) == null ? [] : local.m612["processor_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m612["registered_device"], null) == null ? [] : local.m612["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m612["tags"], null) == null ? [] : local.m612["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m612["version_context"], null) == null ? [] : local.m612["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
