# Sample data source intersight_equipment_device_summary — reads ../models/data_intersight_equipment_device_summary.yml
locals { m305 = yamldecode(file("${path.module}/../models/data_intersight_equipment_device_summary.yml"))["data_intersight_equipment_device_summary"] }

data "intersight_equipment_device_summary" "n305" {
  account_moid = try(local.m305["account_moid"], null)
  additional_properties = try(local.m305["additional_properties"], null)
  class_id = try(local.m305["class_id"], null)
  create_time = try(local.m305["create_time"], null)
  dn = try(local.m305["dn"], null)
  domain_group_moid = try(local.m305["domain_group_moid"], null)
  id = try(local.m305["id"], null)
  mod_time = try(local.m305["mod_time"], null)
  model = try(local.m305["model"], null)
  moid = try(local.m305["moid"], null)
  object_type = try(local.m305["object_type"], null)
  owners = try(local.m305["owners"], null)
  results = try(local.m305["results"], null)
  serial = try(local.m305["serial"], null)
  shared_scope = try(local.m305["shared_scope"], null)
  source_object_type = try(local.m305["source_object_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m305["ancestors"], null) == null ? [] : local.m305["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m305["compute_blade"], null) == null ? [] : local.m305["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m305["compute_rack_unit"], null) == null ? [] : local.m305["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m305["custom_permission_resources"], null) == null ? [] : local.m305["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m305["equipment_chassis"], null) == null ? [] : local.m305["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_fex" {
    for_each = try(local.m305["equipment_fex"], null) == null ? [] : local.m305["equipment_fex"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m305["inventory_device_info"], null) == null ? [] : local.m305["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_parent" {
    for_each = try(local.m305["inventory_parent"], null) == null ? [] : local.m305["inventory_parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m305["parent"], null) == null ? [] : local.m305["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m305["permission_resources"], null) == null ? [] : local.m305["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m305["registered_device"], null) == null ? [] : local.m305["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m305["tags"], null) == null ? [] : local.m305["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m305["version_context"], null) == null ? [] : local.m305["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
