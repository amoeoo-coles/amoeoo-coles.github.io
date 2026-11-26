# Sample data source intersight_pci_endpoint — reads ../models/data_intersight_pci_endpoint.yml
locals { m1062 = yamldecode(file("${path.module}/../models/data_intersight_pci_endpoint.yml"))["data_intersight_pci_endpoint"] }

data "intersight_pci_endpoint" "n1062" {
  account_moid = try(local.m1062["account_moid"], null)
  additional_properties = try(local.m1062["additional_properties"], null)
  class_id = try(local.m1062["class_id"], null)
  create_time = try(local.m1062["create_time"], null)
  device_enclosure_id = try(local.m1062["device_enclosure_id"], null)
  device_id = try(local.m1062["device_id"], null)
  device_mo_id = try(local.m1062["device_mo_id"], null)
  device_type = try(local.m1062["device_type"], null)
  dn = try(local.m1062["dn"], null)
  domain_group_moid = try(local.m1062["domain_group_moid"], null)
  endpoint_id = try(local.m1062["endpoint_id"], null)
  id = try(local.m1062["id"], null)
  mod_time = try(local.m1062["mod_time"], null)
  moid = try(local.m1062["moid"], null)
  name = try(local.m1062["name"], null)
  object_type = try(local.m1062["object_type"], null)
  oper_reason = try(local.m1062["oper_reason"], null)
  oper_state = try(local.m1062["oper_state"], null)
  owners = try(local.m1062["owners"], null)
  results = try(local.m1062["results"], null)
  rn = try(local.m1062["rn"], null)
  shared_scope = try(local.m1062["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1062["ancestors"], null) == null ? [] : local.m1062["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1062["inventory_device_info"], null) == null ? [] : local.m1062["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1062["parent"], null) == null ? [] : local.m1062["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_switch" {
    for_each = try(local.m1062["pci_switch"], null) == null ? [] : local.m1062["pci_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_switch_port" {
    for_each = try(local.m1062["pci_switch_port"], null) == null ? [] : local.m1062["pci_switch_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_zone" {
    for_each = try(local.m1062["pci_zone"], null) == null ? [] : local.m1062["pci_zone"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1062["permission_resources"], null) == null ? [] : local.m1062["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processor_unit" {
    for_each = try(local.m1062["processor_unit"], null) == null ? [] : local.m1062["processor_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1062["registered_device"], null) == null ? [] : local.m1062["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_adapter_unit" {
    for_each = try(local.m1062["shared_adapter_unit"], null) == null ? [] : local.m1062["shared_adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_graphics_card" {
    for_each = try(local.m1062["shared_graphics_card"], null) == null ? [] : local.m1062["shared_graphics_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1062["tags"], null) == null ? [] : local.m1062["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1062["version_context"], null) == null ? [] : local.m1062["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
