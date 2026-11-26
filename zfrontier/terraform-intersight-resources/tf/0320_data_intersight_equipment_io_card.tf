# Sample data source intersight_equipment_io_card — reads ../models/data_intersight_equipment_io_card.yml
locals { m320 = yamldecode(file("${path.module}/../models/data_intersight_equipment_io_card.yml"))["data_intersight_equipment_io_card"] }

data "intersight_equipment_io_card" "n320" {
  account_moid = try(local.m320["account_moid"], null)
  additional_properties = try(local.m320["additional_properties"], null)
  class_id = try(local.m320["class_id"], null)
  connection_path = try(local.m320["connection_path"], null)
  connection_status = try(local.m320["connection_status"], null)
  create_time = try(local.m320["create_time"], null)
  dc_supported = try(local.m320["dc_supported"], null)
  description = try(local.m320["description"], null)
  device_mo_id = try(local.m320["device_mo_id"], null)
  dn = try(local.m320["dn"], null)
  domain_group_moid = try(local.m320["domain_group_moid"], null)
  id = try(local.m320["id"], null)
  is_upgraded = try(local.m320["is_upgraded"], null)
  mod_time = try(local.m320["mod_time"], null)
  model = try(local.m320["model"], null)
  module_id = try(local.m320["module_id"], null)
  moid = try(local.m320["moid"], null)
  nr_version = try(local.m320["nr_version"], null)
  object_type = try(local.m320["object_type"], null)
  oper_reason = try(local.m320["oper_reason"], null)
  oper_state = try(local.m320["oper_state"], null)
  owners = try(local.m320["owners"], null)
  part_number = try(local.m320["part_number"], null)
  pid = try(local.m320["pid"], null)
  presence = try(local.m320["presence"], null)
  product_name = try(local.m320["product_name"], null)
  results = try(local.m320["results"], null)
  revision = try(local.m320["revision"], null)
  rn = try(local.m320["rn"], null)
  serial = try(local.m320["serial"], null)
  shared_scope = try(local.m320["shared_scope"], null)
  side = try(local.m320["side"], null)
  sku = try(local.m320["sku"], null)
  vendor = try(local.m320["vendor"], null)
  vid = try(local.m320["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m320["ancestors"], null) == null ? [] : local.m320["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m320["equipment_chassis"], null) == null ? [] : local.m320["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_fex" {
    for_each = try(local.m320["equipment_fex"], null) == null ? [] : local.m320["equipment_fex"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fan_modules" {
    for_each = try(local.m320["fan_modules"], null) == null ? [] : local.m320["fan_modules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_ports" {
    for_each = try(local.m320["host_ports"], null) == null ? [] : local.m320["host_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inband_ip_addresses" {
    for_each = try(local.m320["inband_ip_addresses"], null) == null ? [] : local.m320["inband_ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m320["inventory_device_info"], null) == null ? [] : local.m320["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mgmt_controller" {
    for_each = try(local.m320["mgmt_controller"], null) == null ? [] : local.m320["mgmt_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_ports" {
    for_each = try(local.m320["network_ports"], null) == null ? [] : local.m320["network_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "out_of_band_ip_addresses" {
    for_each = try(local.m320["out_of_band_ip_addresses"], null) == null ? [] : local.m320["out_of_band_ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m320["parent"], null) == null ? [] : local.m320["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m320["permission_resources"], null) == null ? [] : local.m320["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_device_registration" {
    for_each = try(local.m320["physical_device_registration"], null) == null ? [] : local.m320["physical_device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m320["previous_fru"], null) == null ? [] : local.m320["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m320["registered_device"], null) == null ? [] : local.m320["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sub_group" {
    for_each = try(local.m320["sub_group"], null) == null ? [] : local.m320["sub_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m320["tags"], null) == null ? [] : local.m320["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m320["version_context"], null) == null ? [] : local.m320["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
