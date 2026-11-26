# Sample data source intersight_vnic_iscsi_static_target_policy_inventory — reads ../models/data_intersight_vnic_iscsi_static_target_policy_inventory.yml
locals { m1477 = yamldecode(file("${path.module}/../models/data_intersight_vnic_iscsi_static_target_policy_inventory.yml"))["data_intersight_vnic_iscsi_static_target_policy_inventory"] }

data "intersight_vnic_iscsi_static_target_policy_inventory" "n1477" {
  account_moid = try(local.m1477["account_moid"], null)
  additional_properties = try(local.m1477["additional_properties"], null)
  class_id = try(local.m1477["class_id"], null)
  create_time = try(local.m1477["create_time"], null)
  description = try(local.m1477["description"], null)
  device_mo_id = try(local.m1477["device_mo_id"], null)
  domain_group_moid = try(local.m1477["domain_group_moid"], null)
  id = try(local.m1477["id"], null)
  ip_address = try(local.m1477["ip_address"], null)
  iscsi_ip_type = try(local.m1477["iscsi_ip_type"], null)
  mod_time = try(local.m1477["mod_time"], null)
  moid = try(local.m1477["moid"], null)
  name = try(local.m1477["name"], null)
  object_type = try(local.m1477["object_type"], null)
  owners = try(local.m1477["owners"], null)
  port = try(local.m1477["port"], null)
  results = try(local.m1477["results"], null)
  shared_scope = try(local.m1477["shared_scope"], null)
  target_name = try(local.m1477["target_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1477["ancestors"], null) == null ? [] : local.m1477["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lun" {
    for_each = try(local.m1477["lun"], null) == null ? [] : local.m1477["lun"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1477["parent"], null) == null ? [] : local.m1477["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1477["permission_resources"], null) == null ? [] : local.m1477["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1477["tags"], null) == null ? [] : local.m1477["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1477["target_mo"], null) == null ? [] : local.m1477["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1477["version_context"], null) == null ? [] : local.m1477["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
