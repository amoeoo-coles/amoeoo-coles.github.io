# Sample data source intersight_fabric_vsan_inventory — reads ../models/data_intersight_fabric_vsan_inventory.yml
locals { m451 = yamldecode(file("${path.module}/../models/data_intersight_fabric_vsan_inventory.yml"))["data_intersight_fabric_vsan_inventory"] }

data "intersight_fabric_vsan_inventory" "n451" {
  account_moid = try(local.m451["account_moid"], null)
  additional_properties = try(local.m451["additional_properties"], null)
  admin_state = try(local.m451["admin_state"], null)
  class_id = try(local.m451["class_id"], null)
  create_time = try(local.m451["create_time"], null)
  domain_group_moid = try(local.m451["domain_group_moid"], null)
  id = try(local.m451["id"], null)
  interop_mode = try(local.m451["interop_mode"], null)
  load_balancing = try(local.m451["load_balancing"], null)
  mod_time = try(local.m451["mod_time"], null)
  moid = try(local.m451["moid"], null)
  name = try(local.m451["name"], null)
  object_type = try(local.m451["object_type"], null)
  oper_state = try(local.m451["oper_state"], null)
  owners = try(local.m451["owners"], null)
  results = try(local.m451["results"], null)
  shared_scope = try(local.m451["shared_scope"], null)
  smart_zoning = try(local.m451["smart_zoning"], null)
  vsan_id = try(local.m451["vsan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m451["ancestors"], null) == null ? [] : local.m451["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m451["network_element"], null) == null ? [] : local.m451["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m451["parent"], null) == null ? [] : local.m451["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m451["permission_resources"], null) == null ? [] : local.m451["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m451["registered_device"], null) == null ? [] : local.m451["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m451["tags"], null) == null ? [] : local.m451["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m451["version_context"], null) == null ? [] : local.m451["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
