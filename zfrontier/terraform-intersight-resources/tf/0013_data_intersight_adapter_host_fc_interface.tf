# Sample data source intersight_adapter_host_fc_interface — reads ../models/data_intersight_adapter_host_fc_interface.yml
locals { m013 = yamldecode(file("${path.module}/../models/data_intersight_adapter_host_fc_interface.yml"))["data_intersight_adapter_host_fc_interface"] }

data "intersight_adapter_host_fc_interface" "n013" {
  account_moid = try(local.m013["account_moid"], null)
  additional_properties = try(local.m013["additional_properties"], null)
  admin_state = try(local.m013["admin_state"], null)
  class_id = try(local.m013["class_id"], null)
  create_time = try(local.m013["create_time"], null)
  device_mo_id = try(local.m013["device_mo_id"], null)
  dn = try(local.m013["dn"], null)
  domain_group_moid = try(local.m013["domain_group_moid"], null)
  ep_dn = try(local.m013["ep_dn"], null)
  host_fc_interface_id = try(local.m013["host_fc_interface_id"], null)
  id = try(local.m013["id"], null)
  is_upgraded = try(local.m013["is_upgraded"], null)
  mod_time = try(local.m013["mod_time"], null)
  model = try(local.m013["model"], null)
  moid = try(local.m013["moid"], null)
  name = try(local.m013["name"], null)
  object_type = try(local.m013["object_type"], null)
  oper_reason = try(local.m013["oper_reason"], null)
  oper_state = try(local.m013["oper_state"], null)
  operability = try(local.m013["operability"], null)
  original_wwnn = try(local.m013["original_wwnn"], null)
  original_wwpn = try(local.m013["original_wwpn"], null)
  owners = try(local.m013["owners"], null)
  peer_dn = try(local.m013["peer_dn"], null)
  pin_group_name = try(local.m013["pin_group_name"], null)
  presence = try(local.m013["presence"], null)
  results = try(local.m013["results"], null)
  revision = try(local.m013["revision"], null)
  rn = try(local.m013["rn"], null)
  serial = try(local.m013["serial"], null)
  shared_scope = try(local.m013["shared_scope"], null)
  vendor = try(local.m013["vendor"], null)
  vfc_action = try(local.m013["vfc_action"], null)
  vif_id = try(local.m013["vif_id"], null)
  wwnn = try(local.m013["wwnn"], null)
  wwpn = try(local.m013["wwpn"], null)
  dynamic "adapter_unit" {
    for_each = try(local.m013["adapter_unit"], null) == null ? [] : local.m013["adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m013["ancestors"], null) == null ? [] : local.m013["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m013["inventory_device_info"], null) == null ? [] : local.m013["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m013["parent"], null) == null ? [] : local.m013["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m013["permission_resources"], null) == null ? [] : local.m013["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pinned_interface" {
    for_each = try(local.m013["pinned_interface"], null) == null ? [] : local.m013["pinned_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m013["previous_fru"], null) == null ? [] : local.m013["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m013["registered_device"], null) == null ? [] : local.m013["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m013["tags"], null) == null ? [] : local.m013["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m013["version_context"], null) == null ? [] : local.m013["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vfc" {
    for_each = try(local.m013["vfc"], null) == null ? [] : local.m013["vfc"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
