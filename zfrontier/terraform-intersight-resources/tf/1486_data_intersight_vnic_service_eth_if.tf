# Sample data source intersight_vnic_service_eth_if — reads ../models/data_intersight_vnic_service_eth_if.yml
locals { m1486 = yamldecode(file("${path.module}/../models/data_intersight_vnic_service_eth_if.yml"))["data_intersight_vnic_service_eth_if"] }

data "intersight_vnic_service_eth_if" "n1486" {
  account_moid = try(local.m1486["account_moid"], null)
  adapter_id = try(local.m1486["adapter_id"], null)
  additional_properties = try(local.m1486["additional_properties"], null)
  class_id = try(local.m1486["class_id"], null)
  create_time = try(local.m1486["create_time"], null)
  domain_group_moid = try(local.m1486["domain_group_moid"], null)
  id = try(local.m1486["id"], null)
  mod_time = try(local.m1486["mod_time"], null)
  moid = try(local.m1486["moid"], null)
  name = try(local.m1486["name"], null)
  object_type = try(local.m1486["object_type"], null)
  overridden_list = try(local.m1486["overridden_list"], null)
  owners = try(local.m1486["owners"], null)
  results = try(local.m1486["results"], null)
  shared_scope = try(local.m1486["shared_scope"], null)
  template_sync_status = try(local.m1486["template_sync_status"], null)
  vif_id = try(local.m1486["vif_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1486["ancestors"], null) == null ? [] : local.m1486["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1486["parent"], null) == null ? [] : local.m1486["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1486["permission_resources"], null) == null ? [] : local.m1486["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "placement" {
    for_each = try(local.m1486["placement"], null) == null ? [] : local.m1486["placement"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1486["profile"], null) == null ? [] : local.m1486["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1486["tags"], null) == null ? [] : local.m1486["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m1486["template_actions"], null) == null ? [] : local.m1486["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_sync_errors" {
    for_each = try(local.m1486["template_sync_errors"], null) == null ? [] : local.m1486["template_sync_errors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1486["version_context"], null) == null ? [] : local.m1486["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
