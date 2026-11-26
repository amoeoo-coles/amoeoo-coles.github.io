# Sample data source intersight_port_mac_binding — reads ../models/data_intersight_port_mac_binding.yml
locals { m1074 = yamldecode(file("${path.module}/../models/data_intersight_port_mac_binding.yml"))["data_intersight_port_mac_binding"] }

data "intersight_port_mac_binding" "n1074" {
  account_moid = try(local.m1074["account_moid"], null)
  additional_properties = try(local.m1074["additional_properties"], null)
  aggregate_port_id = try(local.m1074["aggregate_port_id"], null)
  chassis_id = try(local.m1074["chassis_id"], null)
  chassis_model = try(local.m1074["chassis_model"], null)
  chassis_serial = try(local.m1074["chassis_serial"], null)
  chassis_vendor = try(local.m1074["chassis_vendor"], null)
  class_id = try(local.m1074["class_id"], null)
  create_time = try(local.m1074["create_time"], null)
  device_mac = try(local.m1074["device_mac"], null)
  device_mo_id = try(local.m1074["device_mo_id"], null)
  dn = try(local.m1074["dn"], null)
  domain_group_moid = try(local.m1074["domain_group_moid"], null)
  id = try(local.m1074["id"], null)
  mod_time = try(local.m1074["mod_time"], null)
  module_mode = try(local.m1074["module_mode"], null)
  module_model = try(local.m1074["module_model"], null)
  module_port_id = try(local.m1074["module_port_id"], null)
  module_serial = try(local.m1074["module_serial"], null)
  module_side = try(local.m1074["module_side"], null)
  module_slot = try(local.m1074["module_slot"], null)
  module_vendor = try(local.m1074["module_vendor"], null)
  moid = try(local.m1074["moid"], null)
  object_type = try(local.m1074["object_type"], null)
  owners = try(local.m1074["owners"], null)
  port_id = try(local.m1074["port_id"], null)
  port_mac = try(local.m1074["port_mac"], null)
  results = try(local.m1074["results"], null)
  rn = try(local.m1074["rn"], null)
  shared_scope = try(local.m1074["shared_scope"], null)
  slot_id = try(local.m1074["slot_id"], null)
  switch_id = try(local.m1074["switch_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1074["ancestors"], null) == null ? [] : local.m1074["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m1074["network_element"], null) == null ? [] : local.m1074["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1074["parent"], null) == null ? [] : local.m1074["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1074["permission_resources"], null) == null ? [] : local.m1074["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1074["registered_device"], null) == null ? [] : local.m1074["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1074["tags"], null) == null ? [] : local.m1074["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1074["version_context"], null) == null ? [] : local.m1074["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
