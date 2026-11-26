# Sample data source intersight_equipment_shared_io_module — reads ../models/data_intersight_equipment_shared_io_module.yml
locals { m333 = yamldecode(file("${path.module}/../models/data_intersight_equipment_shared_io_module.yml"))["data_intersight_equipment_shared_io_module"] }

data "intersight_equipment_shared_io_module" "n333" {
  account_moid = try(local.m333["account_moid"], null)
  additional_properties = try(local.m333["additional_properties"], null)
  class_id = try(local.m333["class_id"], null)
  config_state = try(local.m333["config_state"], null)
  create_time = try(local.m333["create_time"], null)
  device_mo_id = try(local.m333["device_mo_id"], null)
  discovery = try(local.m333["discovery"], null)
  dn = try(local.m333["dn"], null)
  domain_group_moid = try(local.m333["domain_group_moid"], null)
  id = try(local.m333["id"], null)
  is_upgraded = try(local.m333["is_upgraded"], null)
  mac_of_shared_iom_aside = try(local.m333["mac_of_shared_iom_aside"], null)
  mac_of_shared_iom_bside = try(local.m333["mac_of_shared_iom_bside"], null)
  mod_time = try(local.m333["mod_time"], null)
  model = try(local.m333["model"], null)
  moid = try(local.m333["moid"], null)
  object_type = try(local.m333["object_type"], null)
  oper_state = try(local.m333["oper_state"], null)
  owners = try(local.m333["owners"], null)
  part_number = try(local.m333["part_number"], null)
  presence = try(local.m333["presence"], null)
  reachability = try(local.m333["reachability"], null)
  results = try(local.m333["results"], null)
  revision = try(local.m333["revision"], null)
  rn = try(local.m333["rn"], null)
  serial = try(local.m333["serial"], null)
  shared_scope = try(local.m333["shared_scope"], null)
  usr_lbl = try(local.m333["usr_lbl"], null)
  vendor = try(local.m333["vendor"], null)
  vid = try(local.m333["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m333["ancestors"], null) == null ? [] : local.m333["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller" {
    for_each = try(local.m333["controller"], null) == null ? [] : local.m333["controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_system_io_controller" {
    for_each = try(local.m333["equipment_system_io_controller"], null) == null ? [] : local.m333["equipment_system_io_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m333["inventory_device_info"], null) == null ? [] : local.m333["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m333["parent"], null) == null ? [] : local.m333["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m333["permission_resources"], null) == null ? [] : local.m333["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_groups" {
    for_each = try(local.m333["port_groups"], null) == null ? [] : local.m333["port_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m333["previous_fru"], null) == null ? [] : local.m333["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m333["registered_device"], null) == null ? [] : local.m333["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m333["tags"], null) == null ? [] : local.m333["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m333["version_context"], null) == null ? [] : local.m333["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
