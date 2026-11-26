# Sample data source intersight_vnic_iscsi_adapter_policy — reads ../models/data_intersight_vnic_iscsi_adapter_policy.yml
locals { m1472 = yamldecode(file("${path.module}/../models/data_intersight_vnic_iscsi_adapter_policy.yml"))["data_intersight_vnic_iscsi_adapter_policy"] }

data "intersight_vnic_iscsi_adapter_policy" "n1472" {
  account_moid = try(local.m1472["account_moid"], null)
  additional_properties = try(local.m1472["additional_properties"], null)
  class_id = try(local.m1472["class_id"], null)
  connection_time_out = try(local.m1472["connection_time_out"], null)
  create_time = try(local.m1472["create_time"], null)
  description = try(local.m1472["description"], null)
  dhcp_timeout = try(local.m1472["dhcp_timeout"], null)
  domain_group_moid = try(local.m1472["domain_group_moid"], null)
  id = try(local.m1472["id"], null)
  lun_busy_retry_count = try(local.m1472["lun_busy_retry_count"], null)
  mod_time = try(local.m1472["mod_time"], null)
  moid = try(local.m1472["moid"], null)
  name = try(local.m1472["name"], null)
  object_type = try(local.m1472["object_type"], null)
  owners = try(local.m1472["owners"], null)
  results = try(local.m1472["results"], null)
  shared_scope = try(local.m1472["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1472["ancestors"], null) == null ? [] : local.m1472["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1472["organization"], null) == null ? [] : local.m1472["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1472["parent"], null) == null ? [] : local.m1472["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1472["permission_resources"], null) == null ? [] : local.m1472["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1472["tags"], null) == null ? [] : local.m1472["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1472["version_context"], null) == null ? [] : local.m1472["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
