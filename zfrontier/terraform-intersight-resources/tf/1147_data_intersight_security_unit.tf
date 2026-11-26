# Sample data source intersight_security_unit — reads ../models/data_intersight_security_unit.yml
locals { m1147 = yamldecode(file("${path.module}/../models/data_intersight_security_unit.yml"))["data_intersight_security_unit"] }

data "intersight_security_unit" "n1147" {
  account_moid = try(local.m1147["account_moid"], null)
  additional_properties = try(local.m1147["additional_properties"], null)
  class_id = try(local.m1147["class_id"], null)
  create_time = try(local.m1147["create_time"], null)
  device_mo_id = try(local.m1147["device_mo_id"], null)
  dn = try(local.m1147["dn"], null)
  domain_group_moid = try(local.m1147["domain_group_moid"], null)
  id = try(local.m1147["id"], null)
  is_upgraded = try(local.m1147["is_upgraded"], null)
  mod_time = try(local.m1147["mod_time"], null)
  model = try(local.m1147["model"], null)
  moid = try(local.m1147["moid"], null)
  object_type = try(local.m1147["object_type"], null)
  oper_state = try(local.m1147["oper_state"], null)
  operability = try(local.m1147["operability"], null)
  owners = try(local.m1147["owners"], null)
  part_number = try(local.m1147["part_number"], null)
  pci_slot = try(local.m1147["pci_slot"], null)
  power = try(local.m1147["power"], null)
  presence = try(local.m1147["presence"], null)
  results = try(local.m1147["results"], null)
  revision = try(local.m1147["revision"], null)
  rn = try(local.m1147["rn"], null)
  serial = try(local.m1147["serial"], null)
  shared_scope = try(local.m1147["shared_scope"], null)
  thermal = try(local.m1147["thermal"], null)
  unit_id = try(local.m1147["unit_id"], null)
  vendor = try(local.m1147["vendor"], null)
  vid = try(local.m1147["vid"], null)
  voltage = try(local.m1147["voltage"], null)
  dynamic "ancestors" {
    for_each = try(local.m1147["ancestors"], null) == null ? [] : local.m1147["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1147["compute_board"], null) == null ? [] : local.m1147["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1147["inventory_device_info"], null) == null ? [] : local.m1147["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1147["parent"], null) == null ? [] : local.m1147["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1147["permission_resources"], null) == null ? [] : local.m1147["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1147["previous_fru"], null) == null ? [] : local.m1147["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1147["registered_device"], null) == null ? [] : local.m1147["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1147["tags"], null) == null ? [] : local.m1147["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1147["version_context"], null) == null ? [] : local.m1147["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
