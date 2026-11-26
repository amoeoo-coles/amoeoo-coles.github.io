# Sample data source intersight_equipment_tpm — reads ../models/data_intersight_equipment_tpm.yml
locals { m337 = yamldecode(file("${path.module}/../models/data_intersight_equipment_tpm.yml"))["data_intersight_equipment_tpm"] }

data "intersight_equipment_tpm" "n337" {
  account_moid = try(local.m337["account_moid"], null)
  activation_status = try(local.m337["activation_status"], null)
  additional_properties = try(local.m337["additional_properties"], null)
  admin_state = try(local.m337["admin_state"], null)
  class_id = try(local.m337["class_id"], null)
  create_time = try(local.m337["create_time"], null)
  device_mo_id = try(local.m337["device_mo_id"], null)
  dn = try(local.m337["dn"], null)
  domain_group_moid = try(local.m337["domain_group_moid"], null)
  firmware_version = try(local.m337["firmware_version"], null)
  id = try(local.m337["id"], null)
  is_upgraded = try(local.m337["is_upgraded"], null)
  mod_time = try(local.m337["mod_time"], null)
  model = try(local.m337["model"], null)
  moid = try(local.m337["moid"], null)
  nr_version = try(local.m337["nr_version"], null)
  object_type = try(local.m337["object_type"], null)
  owners = try(local.m337["owners"], null)
  ownership = try(local.m337["ownership"], null)
  presence = try(local.m337["presence"], null)
  results = try(local.m337["results"], null)
  revision = try(local.m337["revision"], null)
  rn = try(local.m337["rn"], null)
  serial = try(local.m337["serial"], null)
  shared_scope = try(local.m337["shared_scope"], null)
  tpm_id = try(local.m337["tpm_id"], null)
  vendor = try(local.m337["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m337["ancestors"], null) == null ? [] : local.m337["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m337["compute_board"], null) == null ? [] : local.m337["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m337["inventory_device_info"], null) == null ? [] : local.m337["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m337["parent"], null) == null ? [] : local.m337["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m337["permission_resources"], null) == null ? [] : local.m337["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m337["previous_fru"], null) == null ? [] : local.m337["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m337["registered_device"], null) == null ? [] : local.m337["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m337["tags"], null) == null ? [] : local.m337["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m337["version_context"], null) == null ? [] : local.m337["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
