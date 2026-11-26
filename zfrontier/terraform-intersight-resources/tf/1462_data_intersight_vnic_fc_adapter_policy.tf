# Sample data source intersight_vnic_fc_adapter_policy — reads ../models/data_intersight_vnic_fc_adapter_policy.yml
locals { m1462 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_adapter_policy.yml"))["data_intersight_vnic_fc_adapter_policy"] }

data "intersight_vnic_fc_adapter_policy" "n1462" {
  account_moid = try(local.m1462["account_moid"], null)
  additional_properties = try(local.m1462["additional_properties"], null)
  class_id = try(local.m1462["class_id"], null)
  create_time = try(local.m1462["create_time"], null)
  description = try(local.m1462["description"], null)
  domain_group_moid = try(local.m1462["domain_group_moid"], null)
  error_detection_timeout = try(local.m1462["error_detection_timeout"], null)
  id = try(local.m1462["id"], null)
  io_throttle_count = try(local.m1462["io_throttle_count"], null)
  lun_count = try(local.m1462["lun_count"], null)
  lun_queue_depth = try(local.m1462["lun_queue_depth"], null)
  mod_time = try(local.m1462["mod_time"], null)
  moid = try(local.m1462["moid"], null)
  name = try(local.m1462["name"], null)
  object_type = try(local.m1462["object_type"], null)
  owners = try(local.m1462["owners"], null)
  resource_allocation_timeout = try(local.m1462["resource_allocation_timeout"], null)
  results = try(local.m1462["results"], null)
  shared_scope = try(local.m1462["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1462["ancestors"], null) == null ? [] : local.m1462["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "error_recovery_settings" {
    for_each = try(local.m1462["error_recovery_settings"], null) == null ? [] : local.m1462["error_recovery_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flogi_settings" {
    for_each = try(local.m1462["flogi_settings"], null) == null ? [] : local.m1462["flogi_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interrupt_settings" {
    for_each = try(local.m1462["interrupt_settings"], null) == null ? [] : local.m1462["interrupt_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1462["organization"], null) == null ? [] : local.m1462["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1462["parent"], null) == null ? [] : local.m1462["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1462["permission_resources"], null) == null ? [] : local.m1462["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "plogi_settings" {
    for_each = try(local.m1462["plogi_settings"], null) == null ? [] : local.m1462["plogi_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rx_queue_settings" {
    for_each = try(local.m1462["rx_queue_settings"], null) == null ? [] : local.m1462["rx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scsi_queue_settings" {
    for_each = try(local.m1462["scsi_queue_settings"], null) == null ? [] : local.m1462["scsi_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1462["tags"], null) == null ? [] : local.m1462["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tx_queue_settings" {
    for_each = try(local.m1462["tx_queue_settings"], null) == null ? [] : local.m1462["tx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1462["version_context"], null) == null ? [] : local.m1462["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
