# Sample data source intersight_adapter_host_iscsi_interface — reads ../models/data_intersight_adapter_host_iscsi_interface.yml
locals { m014 = yamldecode(file("${path.module}/../models/data_intersight_adapter_host_iscsi_interface.yml"))["data_intersight_adapter_host_iscsi_interface"] }

data "intersight_adapter_host_iscsi_interface" "n014" {
  account_moid = try(local.m014["account_moid"], null)
  additional_properties = try(local.m014["additional_properties"], null)
  admin_state = try(local.m014["admin_state"], null)
  class_id = try(local.m014["class_id"], null)
  create_time = try(local.m014["create_time"], null)
  device_mo_id = try(local.m014["device_mo_id"], null)
  dn = try(local.m014["dn"], null)
  domain_group_moid = try(local.m014["domain_group_moid"], null)
  ep_dn = try(local.m014["ep_dn"], null)
  host_iscsi_interface_id = try(local.m014["host_iscsi_interface_id"], null)
  host_visible = try(local.m014["host_visible"], null)
  id = try(local.m014["id"], null)
  is_upgraded = try(local.m014["is_upgraded"], null)
  mac_address = try(local.m014["mac_address"], null)
  mod_time = try(local.m014["mod_time"], null)
  model = try(local.m014["model"], null)
  moid = try(local.m014["moid"], null)
  name = try(local.m014["name"], null)
  object_type = try(local.m014["object_type"], null)
  oper_state = try(local.m014["oper_state"], null)
  operability = try(local.m014["operability"], null)
  owners = try(local.m014["owners"], null)
  peer_dn = try(local.m014["peer_dn"], null)
  presence = try(local.m014["presence"], null)
  results = try(local.m014["results"], null)
  revision = try(local.m014["revision"], null)
  rn = try(local.m014["rn"], null)
  serial = try(local.m014["serial"], null)
  shared_scope = try(local.m014["shared_scope"], null)
  vendor = try(local.m014["vendor"], null)
  dynamic "adapter_unit" {
    for_each = try(local.m014["adapter_unit"], null) == null ? [] : local.m014["adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m014["ancestors"], null) == null ? [] : local.m014["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m014["inventory_device_info"], null) == null ? [] : local.m014["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m014["parent"], null) == null ? [] : local.m014["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m014["permission_resources"], null) == null ? [] : local.m014["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m014["previous_fru"], null) == null ? [] : local.m014["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m014["registered_device"], null) == null ? [] : local.m014["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m014["tags"], null) == null ? [] : local.m014["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m014["version_context"], null) == null ? [] : local.m014["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
