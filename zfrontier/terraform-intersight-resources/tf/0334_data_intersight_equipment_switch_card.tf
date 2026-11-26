# Sample data source intersight_equipment_switch_card — reads ../models/data_intersight_equipment_switch_card.yml
locals { m334 = yamldecode(file("${path.module}/../models/data_intersight_equipment_switch_card.yml"))["data_intersight_equipment_switch_card"] }

data "intersight_equipment_switch_card" "n334" {
  account_moid = try(local.m334["account_moid"], null)
  additional_properties = try(local.m334["additional_properties"], null)
  base_mac = try(local.m334["base_mac"], null)
  class_id = try(local.m334["class_id"], null)
  create_time = try(local.m334["create_time"], null)
  description = try(local.m334["description"], null)
  device_mo_id = try(local.m334["device_mo_id"], null)
  dn = try(local.m334["dn"], null)
  domain_group_moid = try(local.m334["domain_group_moid"], null)
  end_mac = try(local.m334["end_mac"], null)
  ethernet_switching_mode = try(local.m334["ethernet_switching_mode"], null)
  fc_switching_mode = try(local.m334["fc_switching_mode"], null)
  hw_version = try(local.m334["hw_version"], null)
  id = try(local.m334["id"], null)
  is_upgraded = try(local.m334["is_upgraded"], null)
  jumbo_frame_enabled = try(local.m334["jumbo_frame_enabled"], null)
  mod_time = try(local.m334["mod_time"], null)
  model = try(local.m334["model"], null)
  moid = try(local.m334["moid"], null)
  name = try(local.m334["name"], null)
  num_ports = try(local.m334["num_ports"], null)
  object_type = try(local.m334["object_type"], null)
  out_of_band_ip_address = try(local.m334["out_of_band_ip_address"], null)
  out_of_band_ip_gateway = try(local.m334["out_of_band_ip_gateway"], null)
  out_of_band_ip_mask = try(local.m334["out_of_band_ip_mask"], null)
  out_of_band_mac = try(local.m334["out_of_band_mac"], null)
  owners = try(local.m334["owners"], null)
  part_number = try(local.m334["part_number"], null)
  power_state = try(local.m334["power_state"], null)
  presence = try(local.m334["presence"], null)
  results = try(local.m334["results"], null)
  revision = try(local.m334["revision"], null)
  rn = try(local.m334["rn"], null)
  serial = try(local.m334["serial"], null)
  shared_scope = try(local.m334["shared_scope"], null)
  slot_id = try(local.m334["slot_id"], null)
  state = try(local.m334["state"], null)
  status = try(local.m334["status"], null)
  stp_mode = try(local.m334["stp_mode"], null)
  switch_id = try(local.m334["switch_id"], null)
  thermal = try(local.m334["thermal"], null)
  type = try(local.m334["type"], null)
  vendor = try(local.m334["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m334["ancestors"], null) == null ? [] : local.m334["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_port_channels" {
    for_each = try(local.m334["fc_port_channels"], null) == null ? [] : local.m334["fc_port_channels"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_ports" {
    for_each = try(local.m334["fc_ports"], null) == null ? [] : local.m334["fc_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_ports" {
    for_each = try(local.m334["host_ports"], null) == null ? [] : local.m334["host_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inter_switch_port" {
    for_each = try(local.m334["inter_switch_port"], null) == null ? [] : local.m334["inter_switch_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m334["inventory_device_info"], null) == null ? [] : local.m334["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m334["network_element"], null) == null ? [] : local.m334["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m334["parent"], null) == null ? [] : local.m334["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m334["permission_resources"], null) == null ? [] : local.m334["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_channels" {
    for_each = try(local.m334["port_channels"], null) == null ? [] : local.m334["port_channels"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_groups" {
    for_each = try(local.m334["port_groups"], null) == null ? [] : local.m334["port_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m334["previous_fru"], null) == null ? [] : local.m334["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m334["registered_device"], null) == null ? [] : local.m334["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m334["tags"], null) == null ? [] : local.m334["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m334["version_context"], null) == null ? [] : local.m334["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
