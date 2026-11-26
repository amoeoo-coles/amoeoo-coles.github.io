# Sample data source intersight_vnic_service_eth_if_inventory — reads ../models/data_intersight_vnic_service_eth_if_inventory.yml
locals { m1487 = yamldecode(file("${path.module}/../models/data_intersight_vnic_service_eth_if_inventory.yml"))["data_intersight_vnic_service_eth_if_inventory"] }

data "intersight_vnic_service_eth_if_inventory" "n1487" {
  account_moid = try(local.m1487["account_moid"], null)
  adapter_id = try(local.m1487["adapter_id"], null)
  additional_properties = try(local.m1487["additional_properties"], null)
  class_id = try(local.m1487["class_id"], null)
  create_time = try(local.m1487["create_time"], null)
  device_mo_id = try(local.m1487["device_mo_id"], null)
  domain_group_moid = try(local.m1487["domain_group_moid"], null)
  id = try(local.m1487["id"], null)
  mod_time = try(local.m1487["mod_time"], null)
  moid = try(local.m1487["moid"], null)
  name = try(local.m1487["name"], null)
  object_type = try(local.m1487["object_type"], null)
  overridden_list = try(local.m1487["overridden_list"], null)
  owners = try(local.m1487["owners"], null)
  results = try(local.m1487["results"], null)
  shared_scope = try(local.m1487["shared_scope"], null)
  template_sync_status = try(local.m1487["template_sync_status"], null)
  vif_id = try(local.m1487["vif_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1487["ancestors"], null) == null ? [] : local.m1487["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1487["parent"], null) == null ? [] : local.m1487["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1487["permission_resources"], null) == null ? [] : local.m1487["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "placement" {
    for_each = try(local.m1487["placement"], null) == null ? [] : local.m1487["placement"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1487["tags"], null) == null ? [] : local.m1487["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m1487["template_actions"], null) == null ? [] : local.m1487["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_sync_errors" {
    for_each = try(local.m1487["template_sync_errors"], null) == null ? [] : local.m1487["template_sync_errors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1487["version_context"], null) == null ? [] : local.m1487["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
