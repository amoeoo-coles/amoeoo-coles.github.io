# Sample data source intersight_vnic_fc_adapter_policy_inventory — reads ../models/data_intersight_vnic_fc_adapter_policy_inventory.yml
locals { m1463 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_adapter_policy_inventory.yml"))["data_intersight_vnic_fc_adapter_policy_inventory"] }

data "intersight_vnic_fc_adapter_policy_inventory" "n1463" {
  account_moid = try(local.m1463["account_moid"], null)
  additional_properties = try(local.m1463["additional_properties"], null)
  class_id = try(local.m1463["class_id"], null)
  create_time = try(local.m1463["create_time"], null)
  description = try(local.m1463["description"], null)
  device_mo_id = try(local.m1463["device_mo_id"], null)
  domain_group_moid = try(local.m1463["domain_group_moid"], null)
  error_detection_timeout = try(local.m1463["error_detection_timeout"], null)
  id = try(local.m1463["id"], null)
  io_throttle_count = try(local.m1463["io_throttle_count"], null)
  lun_count = try(local.m1463["lun_count"], null)
  lun_queue_depth = try(local.m1463["lun_queue_depth"], null)
  mod_time = try(local.m1463["mod_time"], null)
  moid = try(local.m1463["moid"], null)
  name = try(local.m1463["name"], null)
  object_type = try(local.m1463["object_type"], null)
  owners = try(local.m1463["owners"], null)
  resource_allocation_timeout = try(local.m1463["resource_allocation_timeout"], null)
  results = try(local.m1463["results"], null)
  shared_scope = try(local.m1463["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1463["ancestors"], null) == null ? [] : local.m1463["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "error_recovery_settings" {
    for_each = try(local.m1463["error_recovery_settings"], null) == null ? [] : local.m1463["error_recovery_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flogi_settings" {
    for_each = try(local.m1463["flogi_settings"], null) == null ? [] : local.m1463["flogi_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interrupt_settings" {
    for_each = try(local.m1463["interrupt_settings"], null) == null ? [] : local.m1463["interrupt_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1463["parent"], null) == null ? [] : local.m1463["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1463["permission_resources"], null) == null ? [] : local.m1463["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "plogi_settings" {
    for_each = try(local.m1463["plogi_settings"], null) == null ? [] : local.m1463["plogi_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rx_queue_settings" {
    for_each = try(local.m1463["rx_queue_settings"], null) == null ? [] : local.m1463["rx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scsi_queue_settings" {
    for_each = try(local.m1463["scsi_queue_settings"], null) == null ? [] : local.m1463["scsi_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1463["tags"], null) == null ? [] : local.m1463["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1463["target_mo"], null) == null ? [] : local.m1463["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tx_queue_settings" {
    for_each = try(local.m1463["tx_queue_settings"], null) == null ? [] : local.m1463["tx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1463["version_context"], null) == null ? [] : local.m1463["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
