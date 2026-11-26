# Sample data source intersight_firmware_firmware_summary — reads ../models/data_intersight_firmware_firmware_summary.yml
locals { m488 = yamldecode(file("${path.module}/../models/data_intersight_firmware_firmware_summary.yml"))["data_intersight_firmware_firmware_summary"] }

data "intersight_firmware_firmware_summary" "n488" {
  account_moid = try(local.m488["account_moid"], null)
  additional_properties = try(local.m488["additional_properties"], null)
  bundle_version = try(local.m488["bundle_version"], null)
  class_id = try(local.m488["class_id"], null)
  create_time = try(local.m488["create_time"], null)
  description = try(local.m488["description"], null)
  device_mo_id = try(local.m488["device_mo_id"], null)
  domain_group_moid = try(local.m488["domain_group_moid"], null)
  id = try(local.m488["id"], null)
  mod_time = try(local.m488["mod_time"], null)
  moid = try(local.m488["moid"], null)
  name = try(local.m488["name"], null)
  object_type = try(local.m488["object_type"], null)
  owners = try(local.m488["owners"], null)
  results = try(local.m488["results"], null)
  shared_scope = try(local.m488["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m488["ancestors"], null) == null ? [] : local.m488["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "components_fw_inventory" {
    for_each = try(local.m488["components_fw_inventory"], null) == null ? [] : local.m488["components_fw_inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "expander_module" {
    for_each = try(local.m488["expander_module"], null) == null ? [] : local.m488["expander_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_secure_router" {
    for_each = try(local.m488["network_secure_router"], null) == null ? [] : local.m488["network_secure_router"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m488["parent"], null) == null ? [] : local.m488["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_node" {
    for_each = try(local.m488["pci_node"], null) == null ? [] : local.m488["pci_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m488["permission_resources"], null) == null ? [] : local.m488["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m488["server"], null) == null ? [] : local.m488["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m488["tags"], null) == null ? [] : local.m488["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m488["target_mo"], null) == null ? [] : local.m488["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m488["version_context"], null) == null ? [] : local.m488["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
