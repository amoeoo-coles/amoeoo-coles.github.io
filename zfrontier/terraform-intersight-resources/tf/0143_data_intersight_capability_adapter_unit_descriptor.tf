# Sample data source intersight_capability_adapter_unit_descriptor — reads ../models/data_intersight_capability_adapter_unit_descriptor.yml
locals { m143 = yamldecode(file("${path.module}/../models/data_intersight_capability_adapter_unit_descriptor.yml"))["data_intersight_capability_adapter_unit_descriptor"] }

data "intersight_capability_adapter_unit_descriptor" "n143" {
  account_moid = try(local.m143["account_moid"], null)
  adapter_generation = try(local.m143["adapter_generation"], null)
  additional_properties = try(local.m143["additional_properties"], null)
  class_id = try(local.m143["class_id"], null)
  connectivity_order = try(local.m143["connectivity_order"], null)
  create_time = try(local.m143["create_time"], null)
  description = try(local.m143["description"], null)
  domain_group_moid = try(local.m143["domain_group_moid"], null)
  ethernet_port_speed = try(local.m143["ethernet_port_speed"], null)
  fibre_channel_port_speed = try(local.m143["fibre_channel_port_speed"], null)
  fibre_channel_scsi_ioq_limit = try(local.m143["fibre_channel_scsi_ioq_limit"], null)
  id = try(local.m143["id"], null)
  is_azure_qos_supported = try(local.m143["is_azure_qos_supported"], null)
  is_geneve_supported = try(local.m143["is_geneve_supported"], null)
  is_placement_applicable = try(local.m143["is_placement_applicable"], null)
  is_secure_boot_supported = try(local.m143["is_secure_boot_supported"], null)
  max_eth_rx_ring_size = try(local.m143["max_eth_rx_ring_size"], null)
  max_eth_tx_ring_size = try(local.m143["max_eth_tx_ring_size"], null)
  max_rocev2_interfaces = try(local.m143["max_rocev2_interfaces"], null)
  mod_time = try(local.m143["mod_time"], null)
  model = try(local.m143["model"], null)
  moid = try(local.m143["moid"], null)
  nr_version = try(local.m143["nr_version"], null)
  num_dce_ports = try(local.m143["num_dce_ports"], null)
  number_of_pci_links = try(local.m143["number_of_pci_links"], null)
  object_type = try(local.m143["object_type"], null)
  owners = try(local.m143["owners"], null)
  pci_link = try(local.m143["pci_link"], null)
  prom_card_type = try(local.m143["prom_card_type"], null)
  results = try(local.m143["results"], null)
  shared_scope = try(local.m143["shared_scope"], null)
  vendor = try(local.m143["vendor"], null)
  vic_id = try(local.m143["vic_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m143["ancestors"], null) == null ? [] : local.m143["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m143["capabilities"], null) == null ? [] : local.m143["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "features" {
    for_each = try(local.m143["features"], null) == null ? [] : local.m143["features"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m143["parent"], null) == null ? [] : local.m143["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m143["permission_resources"], null) == null ? [] : local.m143["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m143["tags"], null) == null ? [] : local.m143["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m143["version_context"], null) == null ? [] : local.m143["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
