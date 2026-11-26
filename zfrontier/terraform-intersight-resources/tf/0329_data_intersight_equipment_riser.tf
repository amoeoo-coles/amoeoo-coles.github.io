# Sample data source intersight_equipment_riser — reads ../models/data_intersight_equipment_riser.yml
locals { m329 = yamldecode(file("${path.module}/../models/data_intersight_equipment_riser.yml"))["data_intersight_equipment_riser"] }

data "intersight_equipment_riser" "n329" {
  account_moid = try(local.m329["account_moid"], null)
  additional_properties = try(local.m329["additional_properties"], null)
  class_id = try(local.m329["class_id"], null)
  create_time = try(local.m329["create_time"], null)
  description = try(local.m329["description"], null)
  device_mo_id = try(local.m329["device_mo_id"], null)
  dn = try(local.m329["dn"], null)
  domain_group_moid = try(local.m329["domain_group_moid"], null)
  form_factor = try(local.m329["form_factor"], null)
  id = try(local.m329["id"], null)
  is_upgraded = try(local.m329["is_upgraded"], null)
  mod_time = try(local.m329["mod_time"], null)
  model = try(local.m329["model"], null)
  moid = try(local.m329["moid"], null)
  name = try(local.m329["name"], null)
  object_type = try(local.m329["object_type"], null)
  owners = try(local.m329["owners"], null)
  pcie_type = try(local.m329["pcie_type"], null)
  presence = try(local.m329["presence"], null)
  results = try(local.m329["results"], null)
  revision = try(local.m329["revision"], null)
  rn = try(local.m329["rn"], null)
  serial = try(local.m329["serial"], null)
  shared_scope = try(local.m329["shared_scope"], null)
  sku = try(local.m329["sku"], null)
  type = try(local.m329["type"], null)
  vendor = try(local.m329["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m329["ancestors"], null) == null ? [] : local.m329["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m329["compute_blade"], null) == null ? [] : local.m329["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m329["compute_rack_unit"], null) == null ? [] : local.m329["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m329["parent"], null) == null ? [] : local.m329["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m329["permission_resources"], null) == null ? [] : local.m329["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m329["previous_fru"], null) == null ? [] : local.m329["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m329["registered_device"], null) == null ? [] : local.m329["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m329["tags"], null) == null ? [] : local.m329["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m329["version_context"], null) == null ? [] : local.m329["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
