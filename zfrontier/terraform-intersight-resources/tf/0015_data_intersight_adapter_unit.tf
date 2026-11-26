# Sample data source intersight_adapter_unit — reads ../models/data_intersight_adapter_unit.yml
locals { m015 = yamldecode(file("${path.module}/../models/data_intersight_adapter_unit.yml"))["data_intersight_adapter_unit"] }

data "intersight_adapter_unit" "n015" {
  account_moid = try(local.m015["account_moid"], null)
  adapter_id = try(local.m015["adapter_id"], null)
  additional_properties = try(local.m015["additional_properties"], null)
  base_mac_address = try(local.m015["base_mac_address"], null)
  class_id = try(local.m015["class_id"], null)
  connection_status = try(local.m015["connection_status"], null)
  create_time = try(local.m015["create_time"], null)
  device_mo_id = try(local.m015["device_mo_id"], null)
  dn = try(local.m015["dn"], null)
  domain_group_moid = try(local.m015["domain_group_moid"], null)
  id = try(local.m015["id"], null)
  integrated = try(local.m015["integrated"], null)
  is_upgraded = try(local.m015["is_upgraded"], null)
  mod_time = try(local.m015["mod_time"], null)
  model = try(local.m015["model"], null)
  moid = try(local.m015["moid"], null)
  object_type = try(local.m015["object_type"], null)
  oper_reason = try(local.m015["oper_reason"], null)
  oper_state = try(local.m015["oper_state"], null)
  operability = try(local.m015["operability"], null)
  owners = try(local.m015["owners"], null)
  part_number = try(local.m015["part_number"], null)
  pci_slot = try(local.m015["pci_slot"], null)
  power = try(local.m015["power"], null)
  presence = try(local.m015["presence"], null)
  results = try(local.m015["results"], null)
  revision = try(local.m015["revision"], null)
  rn = try(local.m015["rn"], null)
  serial = try(local.m015["serial"], null)
  shared_scope = try(local.m015["shared_scope"], null)
  thermal = try(local.m015["thermal"], null)
  vendor = try(local.m015["vendor"], null)
  vic_communicable = try(local.m015["vic_communicable"], null)
  vid = try(local.m015["vid"], null)
  dynamic "adapter_unit_expander" {
    for_each = try(local.m015["adapter_unit_expander"], null) == null ? [] : local.m015["adapter_unit_expander"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m015["ancestors"], null) == null ? [] : local.m015["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m015["compute_blade"], null) == null ? [] : local.m015["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m015["compute_rack_unit"], null) == null ? [] : local.m015["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller" {
    for_each = try(local.m015["controller"], null) == null ? [] : local.m015["controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_shared_adapter_unit" {
    for_each = try(local.m015["equipment_shared_adapter_unit"], null) == null ? [] : local.m015["equipment_shared_adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ext_eth_ifs" {
    for_each = try(local.m015["ext_eth_ifs"], null) == null ? [] : local.m015["ext_eth_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_eth_ifs" {
    for_each = try(local.m015["host_eth_ifs"], null) == null ? [] : local.m015["host_eth_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_fc_ifs" {
    for_each = try(local.m015["host_fc_ifs"], null) == null ? [] : local.m015["host_fc_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_iscsi_ifs" {
    for_each = try(local.m015["host_iscsi_ifs"], null) == null ? [] : local.m015["host_iscsi_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m015["inventory_device_info"], null) == null ? [] : local.m015["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m015["parent"], null) == null ? [] : local.m015["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m015["permission_resources"], null) == null ? [] : local.m015["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m015["previous_fru"], null) == null ? [] : local.m015["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m015["registered_device"], null) == null ? [] : local.m015["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m015["tags"], null) == null ? [] : local.m015["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m015["version_context"], null) == null ? [] : local.m015["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
