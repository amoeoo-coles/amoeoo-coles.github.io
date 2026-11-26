# Sample data source intersight_vnic_iscsi_adapter_policy_inventory — reads ../models/data_intersight_vnic_iscsi_adapter_policy_inventory.yml
locals { m1473 = yamldecode(file("${path.module}/../models/data_intersight_vnic_iscsi_adapter_policy_inventory.yml"))["data_intersight_vnic_iscsi_adapter_policy_inventory"] }

data "intersight_vnic_iscsi_adapter_policy_inventory" "n1473" {
  account_moid = try(local.m1473["account_moid"], null)
  additional_properties = try(local.m1473["additional_properties"], null)
  class_id = try(local.m1473["class_id"], null)
  connection_time_out = try(local.m1473["connection_time_out"], null)
  create_time = try(local.m1473["create_time"], null)
  description = try(local.m1473["description"], null)
  device_mo_id = try(local.m1473["device_mo_id"], null)
  dhcp_timeout = try(local.m1473["dhcp_timeout"], null)
  domain_group_moid = try(local.m1473["domain_group_moid"], null)
  id = try(local.m1473["id"], null)
  lun_busy_retry_count = try(local.m1473["lun_busy_retry_count"], null)
  mod_time = try(local.m1473["mod_time"], null)
  moid = try(local.m1473["moid"], null)
  name = try(local.m1473["name"], null)
  object_type = try(local.m1473["object_type"], null)
  owners = try(local.m1473["owners"], null)
  results = try(local.m1473["results"], null)
  shared_scope = try(local.m1473["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1473["ancestors"], null) == null ? [] : local.m1473["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1473["parent"], null) == null ? [] : local.m1473["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1473["permission_resources"], null) == null ? [] : local.m1473["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1473["tags"], null) == null ? [] : local.m1473["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1473["target_mo"], null) == null ? [] : local.m1473["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1473["version_context"], null) == null ? [] : local.m1473["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
