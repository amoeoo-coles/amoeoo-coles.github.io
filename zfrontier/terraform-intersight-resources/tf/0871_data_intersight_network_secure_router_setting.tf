# Sample data source intersight_network_secure_router_setting — reads ../models/data_intersight_network_secure_router_setting.yml
locals { m871 = yamldecode(file("${path.module}/../models/data_intersight_network_secure_router_setting.yml"))["data_intersight_network_secure_router_setting"] }

data "intersight_network_secure_router_setting" "n871" {
  account_moid = try(local.m871["account_moid"], null)
  additional_properties = try(local.m871["additional_properties"], null)
  admin_action = try(local.m871["admin_action"], null)
  admin_locator_led_state = try(local.m871["admin_locator_led_state"], null)
  class_id = try(local.m871["class_id"], null)
  config_state = try(local.m871["config_state"], null)
  create_time = try(local.m871["create_time"], null)
  device_mo_id = try(local.m871["device_mo_id"], null)
  dn = try(local.m871["dn"], null)
  domain_group_moid = try(local.m871["domain_group_moid"], null)
  id = try(local.m871["id"], null)
  mod_time = try(local.m871["mod_time"], null)
  moid = try(local.m871["moid"], null)
  name = try(local.m871["name"], null)
  object_type = try(local.m871["object_type"], null)
  owners = try(local.m871["owners"], null)
  results = try(local.m871["results"], null)
  rn = try(local.m871["rn"], null)
  shared_scope = try(local.m871["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m871["ancestors"], null) == null ? [] : local.m871["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m871["locator_led"], null) == null ? [] : local.m871["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m871["parent"], null) == null ? [] : local.m871["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m871["permission_resources"], null) == null ? [] : local.m871["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m871["registered_device"], null) == null ? [] : local.m871["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "router_op_status" {
    for_each = try(local.m871["router_op_status"], null) == null ? [] : local.m871["router_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "secure_router" {
    for_each = try(local.m871["secure_router"], null) == null ? [] : local.m871["secure_router"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m871["tags"], null) == null ? [] : local.m871["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m871["version_context"], null) == null ? [] : local.m871["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
