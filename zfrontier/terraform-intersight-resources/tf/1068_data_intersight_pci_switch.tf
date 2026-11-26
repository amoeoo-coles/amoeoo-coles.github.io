# Sample data source intersight_pci_switch — reads ../models/data_intersight_pci_switch.yml
locals { m1068 = yamldecode(file("${path.module}/../models/data_intersight_pci_switch.yml"))["data_intersight_pci_switch"] }

data "intersight_pci_switch" "n1068" {
  account_moid = try(local.m1068["account_moid"], null)
  additional_properties = try(local.m1068["additional_properties"], null)
  class_id = try(local.m1068["class_id"], null)
  create_time = try(local.m1068["create_time"], null)
  device_id = try(local.m1068["device_id"], null)
  device_mo_id = try(local.m1068["device_mo_id"], null)
  dn = try(local.m1068["dn"], null)
  domain_group_moid = try(local.m1068["domain_group_moid"], null)
  health = try(local.m1068["health"], null)
  id = try(local.m1068["id"], null)
  is_upgraded = try(local.m1068["is_upgraded"], null)
  mod_time = try(local.m1068["mod_time"], null)
  model = try(local.m1068["model"], null)
  moid = try(local.m1068["moid"], null)
  num_of_adaptors = try(local.m1068["num_of_adaptors"], null)
  object_type = try(local.m1068["object_type"], null)
  oper_state = try(local.m1068["oper_state"], null)
  owners = try(local.m1068["owners"], null)
  pci_address = try(local.m1068["pci_address"], null)
  pci_slot = try(local.m1068["pci_slot"], null)
  pci_switch_id = try(local.m1068["pci_switch_id"], null)
  presence = try(local.m1068["presence"], null)
  product_name = try(local.m1068["product_name"], null)
  product_revision = try(local.m1068["product_revision"], null)
  results = try(local.m1068["results"], null)
  revision = try(local.m1068["revision"], null)
  rn = try(local.m1068["rn"], null)
  serial = try(local.m1068["serial"], null)
  shared_scope = try(local.m1068["shared_scope"], null)
  sub_device_id = try(local.m1068["sub_device_id"], null)
  sub_vendor_id = try(local.m1068["sub_vendor_id"], null)
  temperature = try(local.m1068["temperature"], null)
  type = try(local.m1068["type"], null)
  vendor = try(local.m1068["vendor"], null)
  vendor_id = try(local.m1068["vendor_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1068["ancestors"], null) == null ? [] : local.m1068["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1068["compute_board"], null) == null ? [] : local.m1068["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_expander_module" {
    for_each = try(local.m1068["equipment_expander_module"], null) == null ? [] : local.m1068["equipment_expander_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1068["inventory_device_info"], null) == null ? [] : local.m1068["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "links" {
    for_each = try(local.m1068["links"], null) == null ? [] : local.m1068["links"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1068["parent"], null) == null ? [] : local.m1068["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_endpoints" {
    for_each = try(local.m1068["pci_endpoints"], null) == null ? [] : local.m1068["pci_endpoints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1068["permission_resources"], null) == null ? [] : local.m1068["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports" {
    for_each = try(local.m1068["ports"], null) == null ? [] : local.m1068["ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1068["previous_fru"], null) == null ? [] : local.m1068["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1068["registered_device"], null) == null ? [] : local.m1068["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_firmware" {
    for_each = try(local.m1068["running_firmware"], null) == null ? [] : local.m1068["running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1068["tags"], null) == null ? [] : local.m1068["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1068["version_context"], null) == null ? [] : local.m1068["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
