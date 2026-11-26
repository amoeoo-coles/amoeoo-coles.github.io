# Sample data source intersight_equipment_fex — reads ../models/data_intersight_equipment_fex.yml
locals { m314 = yamldecode(file("${path.module}/../models/data_intersight_equipment_fex.yml"))["data_intersight_equipment_fex"] }

data "intersight_equipment_fex" "n314" {
  account_moid = try(local.m314["account_moid"], null)
  additional_properties = try(local.m314["additional_properties"], null)
  class_id = try(local.m314["class_id"], null)
  connection_path = try(local.m314["connection_path"], null)
  connection_status = try(local.m314["connection_status"], null)
  create_time = try(local.m314["create_time"], null)
  description = try(local.m314["description"], null)
  device_mo_id = try(local.m314["device_mo_id"], null)
  discovery_state = try(local.m314["discovery_state"], null)
  dn = try(local.m314["dn"], null)
  domain_group_moid = try(local.m314["domain_group_moid"], null)
  id = try(local.m314["id"], null)
  is_upgraded = try(local.m314["is_upgraded"], null)
  mod_time = try(local.m314["mod_time"], null)
  model = try(local.m314["model"], null)
  module_id = try(local.m314["module_id"], null)
  moid = try(local.m314["moid"], null)
  nr_version = try(local.m314["nr_version"], null)
  object_type = try(local.m314["object_type"], null)
  oper_reason = try(local.m314["oper_reason"], null)
  oper_state = try(local.m314["oper_state"], null)
  owners = try(local.m314["owners"], null)
  part_number = try(local.m314["part_number"], null)
  pid = try(local.m314["pid"], null)
  presence = try(local.m314["presence"], null)
  product_name = try(local.m314["product_name"], null)
  results = try(local.m314["results"], null)
  revision = try(local.m314["revision"], null)
  rn = try(local.m314["rn"], null)
  serial = try(local.m314["serial"], null)
  shared_scope = try(local.m314["shared_scope"], null)
  sku = try(local.m314["sku"], null)
  vendor = try(local.m314["vendor"], null)
  vid = try(local.m314["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m314["ancestors"], null) == null ? [] : local.m314["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fans" {
    for_each = try(local.m314["fans"], null) == null ? [] : local.m314["fans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_ports" {
    for_each = try(local.m314["host_ports"], null) == null ? [] : local.m314["host_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m314["inventory_device_info"], null) == null ? [] : local.m314["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ioms" {
    for_each = try(local.m314["ioms"], null) == null ? [] : local.m314["ioms"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m314["locator_led"], null) == null ? [] : local.m314["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mgmt_controller" {
    for_each = try(local.m314["mgmt_controller"], null) == null ? [] : local.m314["mgmt_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m314["network_element"], null) == null ? [] : local.m314["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_ports" {
    for_each = try(local.m314["network_ports"], null) == null ? [] : local.m314["network_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m314["parent"], null) == null ? [] : local.m314["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m314["permission_resources"], null) == null ? [] : local.m314["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m314["previous_fru"], null) == null ? [] : local.m314["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "psus" {
    for_each = try(local.m314["psus"], null) == null ? [] : local.m314["psus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m314["registered_device"], null) == null ? [] : local.m314["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sub_group" {
    for_each = try(local.m314["sub_group"], null) == null ? [] : local.m314["sub_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m314["tags"], null) == null ? [] : local.m314["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m314["version_context"], null) == null ? [] : local.m314["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
