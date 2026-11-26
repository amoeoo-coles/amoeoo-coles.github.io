# Sample data source intersight_vnic_iscsi_boot_policy_inventory — reads ../models/data_intersight_vnic_iscsi_boot_policy_inventory.yml
locals { m1475 = yamldecode(file("${path.module}/../models/data_intersight_vnic_iscsi_boot_policy_inventory.yml"))["data_intersight_vnic_iscsi_boot_policy_inventory"] }

data "intersight_vnic_iscsi_boot_policy_inventory" "n1475" {
  account_moid = try(local.m1475["account_moid"], null)
  additional_properties = try(local.m1475["additional_properties"], null)
  auto_targetvendor_name = try(local.m1475["auto_targetvendor_name"], null)
  class_id = try(local.m1475["class_id"], null)
  create_time = try(local.m1475["create_time"], null)
  description = try(local.m1475["description"], null)
  device_mo_id = try(local.m1475["device_mo_id"], null)
  domain_group_moid = try(local.m1475["domain_group_moid"], null)
  id = try(local.m1475["id"], null)
  initiator_ip_source = try(local.m1475["initiator_ip_source"], null)
  initiator_static_ip_v4_address = try(local.m1475["initiator_static_ip_v4_address"], null)
  initiator_static_ip_v6_address = try(local.m1475["initiator_static_ip_v6_address"], null)
  iscsi_ip_type = try(local.m1475["iscsi_ip_type"], null)
  mod_time = try(local.m1475["mod_time"], null)
  moid = try(local.m1475["moid"], null)
  name = try(local.m1475["name"], null)
  object_type = try(local.m1475["object_type"], null)
  owners = try(local.m1475["owners"], null)
  results = try(local.m1475["results"], null)
  shared_scope = try(local.m1475["shared_scope"], null)
  target_source_type = try(local.m1475["target_source_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1475["ancestors"], null) == null ? [] : local.m1475["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chap" {
    for_each = try(local.m1475["chap"], null) == null ? [] : local.m1475["chap"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiator_ip_pool" {
    for_each = try(local.m1475["initiator_ip_pool"], null) == null ? [] : local.m1475["initiator_ip_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiator_static_ip_v4_config" {
    for_each = try(local.m1475["initiator_static_ip_v4_config"], null) == null ? [] : local.m1475["initiator_static_ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiator_static_ip_v6_config" {
    for_each = try(local.m1475["initiator_static_ip_v6_config"], null) == null ? [] : local.m1475["initiator_static_ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iscsi_adapter_policy" {
    for_each = try(local.m1475["iscsi_adapter_policy"], null) == null ? [] : local.m1475["iscsi_adapter_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mutual_chap" {
    for_each = try(local.m1475["mutual_chap"], null) == null ? [] : local.m1475["mutual_chap"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1475["parent"], null) == null ? [] : local.m1475["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1475["permission_resources"], null) == null ? [] : local.m1475["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "primary_target_policy" {
    for_each = try(local.m1475["primary_target_policy"], null) == null ? [] : local.m1475["primary_target_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "secondary_target_policy" {
    for_each = try(local.m1475["secondary_target_policy"], null) == null ? [] : local.m1475["secondary_target_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1475["tags"], null) == null ? [] : local.m1475["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1475["target_mo"], null) == null ? [] : local.m1475["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1475["version_context"], null) == null ? [] : local.m1475["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
