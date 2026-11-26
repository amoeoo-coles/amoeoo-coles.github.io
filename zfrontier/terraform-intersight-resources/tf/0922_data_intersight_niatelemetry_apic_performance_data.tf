# Sample data source intersight_niatelemetry_apic_performance_data — reads ../models/data_intersight_niatelemetry_apic_performance_data.yml
locals { m922 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_performance_data.yml"))["data_intersight_niatelemetry_apic_performance_data"] }

data "intersight_niatelemetry_apic_performance_data" "n922" {
  account_moid = try(local.m922["account_moid"], null)
  additional_properties = try(local.m922["additional_properties"], null)
  class_id = try(local.m922["class_id"], null)
  create_time = try(local.m922["create_time"], null)
  dn = try(local.m922["dn"], null)
  domain_group_moid = try(local.m922["domain_group_moid"], null)
  id = try(local.m922["id"], null)
  mod_time = try(local.m922["mod_time"], null)
  moid = try(local.m922["moid"], null)
  node_health = try(local.m922["node_health"], null)
  object_type = try(local.m922["object_type"], null)
  owners = try(local.m922["owners"], null)
  record_type = try(local.m922["record_type"], null)
  record_version = try(local.m922["record_version"], null)
  results = try(local.m922["results"], null)
  shared_scope = try(local.m922["shared_scope"], null)
  site_name = try(local.m922["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m922["ancestors"], null) == null ? [] : local.m922["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "digital_optical_monitoring" {
    for_each = try(local.m922["digital_optical_monitoring"], null) == null ? [] : local.m922["digital_optical_monitoring"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eqpt_storage_firmware" {
    for_each = try(local.m922["eqpt_storage_firmware"], null) == null ? [] : local.m922["eqpt_storage_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eqptcapacity_pol_usage5min" {
    for_each = try(local.m922["eqptcapacity_pol_usage5min"], null) == null ? [] : local.m922["eqptcapacity_pol_usage5min"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eqptcapacity_prefix_entries15min" {
    for_each = try(local.m922["eqptcapacity_prefix_entries15min"], null) == null ? [] : local.m922["eqptcapacity_prefix_entries15min"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eqptcapacity_prefix_entries5min" {
    for_each = try(local.m922["eqptcapacity_prefix_entries5min"], null) == null ? [] : local.m922["eqptcapacity_prefix_entries5min"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m922["parent"], null) == null ? [] : local.m922["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m922["permission_resources"], null) == null ? [] : local.m922["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "proc_sys_cpu15min" {
    for_each = try(local.m922["proc_sys_cpu15min"], null) == null ? [] : local.m922["proc_sys_cpu15min"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "proc_sys_cpu5min" {
    for_each = try(local.m922["proc_sys_cpu5min"], null) == null ? [] : local.m922["proc_sys_cpu5min"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "proc_sys_mem15min" {
    for_each = try(local.m922["proc_sys_mem15min"], null) == null ? [] : local.m922["proc_sys_mem15min"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "proc_sys_mem5min" {
    for_each = try(local.m922["proc_sys_mem5min"], null) == null ? [] : local.m922["proc_sys_mem5min"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m922["registered_device"], null) == null ? [] : local.m922["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_disk_utilization" {
    for_each = try(local.m922["switch_disk_utilization"], null) == null ? [] : local.m922["switch_disk_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m922["tags"], null) == null ? [] : local.m922["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m922["version_context"], null) == null ? [] : local.m922["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
