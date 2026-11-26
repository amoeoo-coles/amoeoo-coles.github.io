# Sample data source intersight_meraki_device — reads ../models/data_intersight_meraki_device.yml
locals { m834 = yamldecode(file("${path.module}/../models/data_intersight_meraki_device.yml"))["data_intersight_meraki_device"] }

data "intersight_meraki_device" "n834" {
  account_moid = try(local.m834["account_moid"], null)
  additional_properties = try(local.m834["additional_properties"], null)
  class_id = try(local.m834["class_id"], null)
  create_time = try(local.m834["create_time"], null)
  device_mo_id = try(local.m834["device_mo_id"], null)
  device_type = try(local.m834["device_type"], null)
  dn = try(local.m834["dn"], null)
  domain_group_moid = try(local.m834["domain_group_moid"], null)
  hardware_version = try(local.m834["hardware_version"], null)
  id = try(local.m834["id"], null)
  is_upgraded = try(local.m834["is_upgraded"], null)
  lan_ip = try(local.m834["lan_ip"], null)
  mac = try(local.m834["mac"], null)
  mod_time = try(local.m834["mod_time"], null)
  model = try(local.m834["model"], null)
  moid = try(local.m834["moid"], null)
  name = try(local.m834["name"], null)
  network_id = try(local.m834["network_id"], null)
  nr_version = try(local.m834["nr_version"], null)
  object_type = try(local.m834["object_type"], null)
  owners = try(local.m834["owners"], null)
  presence = try(local.m834["presence"], null)
  results = try(local.m834["results"], null)
  revision = try(local.m834["revision"], null)
  rn = try(local.m834["rn"], null)
  serial = try(local.m834["serial"], null)
  shared_scope = try(local.m834["shared_scope"], null)
  uuid = try(local.m834["uuid"], null)
  vendor = try(local.m834["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m834["ancestors"], null) == null ? [] : local.m834["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_location" {
    for_each = try(local.m834["device_location"], null) == null ? [] : local.m834["device_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network" {
    for_each = try(local.m834["network"], null) == null ? [] : local.m834["network"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m834["parent"], null) == null ? [] : local.m834["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m834["permission_resources"], null) == null ? [] : local.m834["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m834["previous_fru"], null) == null ? [] : local.m834["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m834["registered_device"], null) == null ? [] : local.m834["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m834["tags"], null) == null ? [] : local.m834["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m834["version_context"], null) == null ? [] : local.m834["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
