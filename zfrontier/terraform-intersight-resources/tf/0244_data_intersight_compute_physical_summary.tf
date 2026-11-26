# Sample data source intersight_compute_physical_summary — reads ../models/data_intersight_compute_physical_summary.yml
locals { m244 = yamldecode(file("${path.module}/../models/data_intersight_compute_physical_summary.yml"))["data_intersight_compute_physical_summary"] }

data "intersight_compute_physical_summary" "n244" {
  account_moid = try(local.m244["account_moid"], null)
  additional_properties = try(local.m244["additional_properties"], null)
  admin_power_state = try(local.m244["admin_power_state"], null)
  asset_tag = try(local.m244["asset_tag"], null)
  available_memory = try(local.m244["available_memory"], null)
  bios_post_complete = try(local.m244["bios_post_complete"], null)
  chassis_id = try(local.m244["chassis_id"], null)
  class_id = try(local.m244["class_id"], null)
  connection_status = try(local.m244["connection_status"], null)
  cooling_mode = try(local.m244["cooling_mode"], null)
  cpu_capacity = try(local.m244["cpu_capacity"], null)
  create_time = try(local.m244["create_time"], null)
  device_mo_id = try(local.m244["device_mo_id"], null)
  dn = try(local.m244["dn"], null)
  domain_group_moid = try(local.m244["domain_group_moid"], null)
  fault_summary = try(local.m244["fault_summary"], null)
  firmware = try(local.m244["firmware"], null)
  front_panel_lock_state = try(local.m244["front_panel_lock_state"], null)
  hardware_uuid = try(local.m244["hardware_uuid"], null)
  has_e3_s_support = try(local.m244["has_e3_s_support"], null)
  id = try(local.m244["id"], null)
  ipv4_address = try(local.m244["ipv4_address"], null)
  is_upgraded = try(local.m244["is_upgraded"], null)
  kvm_server_state_enabled = try(local.m244["kvm_server_state_enabled"], null)
  kvm_vendor = try(local.m244["kvm_vendor"], null)
  last_power_state_changed_time = try(local.m244["last_power_state_changed_time"], null)
  management_mode = try(local.m244["management_mode"], null)
  memory_speed = try(local.m244["memory_speed"], null)
  mgmt_ip_address = try(local.m244["mgmt_ip_address"], null)
  mod_time = try(local.m244["mod_time"], null)
  model = try(local.m244["model"], null)
  moid = try(local.m244["moid"], null)
  name = try(local.m244["name"], null)
  nr_lifecycle = try(local.m244["nr_lifecycle"], null)
  num_adaptors = try(local.m244["num_adaptors"], null)
  num_cpu_cores = try(local.m244["num_cpu_cores"], null)
  num_cpu_cores_enabled = try(local.m244["num_cpu_cores_enabled"], null)
  num_cpus = try(local.m244["num_cpus"], null)
  num_eth_host_interfaces = try(local.m244["num_eth_host_interfaces"], null)
  num_fc_host_interfaces = try(local.m244["num_fc_host_interfaces"], null)
  num_threads = try(local.m244["num_threads"], null)
  object_type = try(local.m244["object_type"], null)
  oper_power_state = try(local.m244["oper_power_state"], null)
  oper_reason = try(local.m244["oper_reason"], null)
  oper_state = try(local.m244["oper_state"], null)
  operability = try(local.m244["operability"], null)
  owners = try(local.m244["owners"], null)
  package_version = try(local.m244["package_version"], null)
  personality = try(local.m244["personality"], null)
  platform_type = try(local.m244["platform_type"], null)
  presence = try(local.m244["presence"], null)
  results = try(local.m244["results"], null)
  revision = try(local.m244["revision"], null)
  rn = try(local.m244["rn"], null)
  scaled_mode = try(local.m244["scaled_mode"], null)
  serial = try(local.m244["serial"], null)
  server_id = try(local.m244["server_id"], null)
  service_profile = try(local.m244["service_profile"], null)
  shared_scope = try(local.m244["shared_scope"], null)
  slot_id = try(local.m244["slot_id"], null)
  source_object_type = try(local.m244["source_object_type"], null)
  topology_scan_status = try(local.m244["topology_scan_status"], null)
  total_memory = try(local.m244["total_memory"], null)
  tunneled_kvm = try(local.m244["tunneled_kvm"], null)
  user_label = try(local.m244["user_label"], null)
  uuid = try(local.m244["uuid"], null)
  vendor = try(local.m244["vendor"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m244["alarm_summary"], null) == null ? [] : local.m244["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m244["ancestors"], null) == null ? [] : local.m244["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m244["custom_permission_resources"], null) == null ? [] : local.m244["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m244["equipment_chassis"], null) == null ? [] : local.m244["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m244["inventory_device_info"], null) == null ? [] : local.m244["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_parent" {
    for_each = try(local.m244["inventory_parent"], null) == null ? [] : local.m244["inventory_parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "kvm_ip_addresses" {
    for_each = try(local.m244["kvm_ip_addresses"], null) == null ? [] : local.m244["kvm_ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m244["location_details"], null) == null ? [] : local.m244["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m244["parent"], null) == null ? [] : local.m244["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m244["permission_resources"], null) == null ? [] : local.m244["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m244["registered_device"], null) == null ? [] : local.m244["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m244["tags"], null) == null ? [] : local.m244["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m244["version_context"], null) == null ? [] : local.m244["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
