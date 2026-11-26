# Sample data source intersight_port_group — reads ../models/data_intersight_port_group.yml
locals { m1073 = yamldecode(file("${path.module}/../models/data_intersight_port_group.yml"))["data_intersight_port_group"] }

data "intersight_port_group" "n1073" {
  account_moid = try(local.m1073["account_moid"], null)
  additional_properties = try(local.m1073["additional_properties"], null)
  class_id = try(local.m1073["class_id"], null)
  create_time = try(local.m1073["create_time"], null)
  device_mo_id = try(local.m1073["device_mo_id"], null)
  dn = try(local.m1073["dn"], null)
  domain_group_moid = try(local.m1073["domain_group_moid"], null)
  id = try(local.m1073["id"], null)
  mod_time = try(local.m1073["mod_time"], null)
  moid = try(local.m1073["moid"], null)
  object_type = try(local.m1073["object_type"], null)
  owners = try(local.m1073["owners"], null)
  results = try(local.m1073["results"], null)
  rn = try(local.m1073["rn"], null)
  shared_scope = try(local.m1073["shared_scope"], null)
  transport = try(local.m1073["transport"], null)
  dynamic "ancestors" {
    for_each = try(local.m1073["ancestors"], null) == null ? [] : local.m1073["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_shared_io_module" {
    for_each = try(local.m1073["equipment_shared_io_module"], null) == null ? [] : local.m1073["equipment_shared_io_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_switch_card" {
    for_each = try(local.m1073["equipment_switch_card"], null) == null ? [] : local.m1073["equipment_switch_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ethernet_ports" {
    for_each = try(local.m1073["ethernet_ports"], null) == null ? [] : local.m1073["ethernet_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_ports" {
    for_each = try(local.m1073["fc_ports"], null) == null ? [] : local.m1073["fc_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1073["inventory_device_info"], null) == null ? [] : local.m1073["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1073["parent"], null) == null ? [] : local.m1073["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1073["permission_resources"], null) == null ? [] : local.m1073["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1073["registered_device"], null) == null ? [] : local.m1073["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sub_groups" {
    for_each = try(local.m1073["sub_groups"], null) == null ? [] : local.m1073["sub_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1073["tags"], null) == null ? [] : local.m1073["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1073["version_context"], null) == null ? [] : local.m1073["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
