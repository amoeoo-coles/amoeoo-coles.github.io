# Sample data source intersight_storage_item — reads ../models/data_intersight_storage_item.yml
locals { m1258 = yamldecode(file("${path.module}/../models/data_intersight_storage_item.yml"))["data_intersight_storage_item"] }

data "intersight_storage_item" "n1258" {
  account_moid = try(local.m1258["account_moid"], null)
  additional_properties = try(local.m1258["additional_properties"], null)
  alarm_type = try(local.m1258["alarm_type"], null)
  class_id = try(local.m1258["class_id"], null)
  create_time = try(local.m1258["create_time"], null)
  device_mo_id = try(local.m1258["device_mo_id"], null)
  dn = try(local.m1258["dn"], null)
  domain_group_moid = try(local.m1258["domain_group_moid"], null)
  id = try(local.m1258["id"], null)
  mod_time = try(local.m1258["mod_time"], null)
  moid = try(local.m1258["moid"], null)
  name = try(local.m1258["name"], null)
  object_type = try(local.m1258["object_type"], null)
  oper_state = try(local.m1258["oper_state"], null)
  owners = try(local.m1258["owners"], null)
  results = try(local.m1258["results"], null)
  rn = try(local.m1258["rn"], null)
  shared_scope = try(local.m1258["shared_scope"], null)
  size = try(local.m1258["size"], null)
  used = try(local.m1258["used"], null)
  used_val = try(local.m1258["used_val"], null)
  dynamic "ancestors" {
    for_each = try(local.m1258["ancestors"], null) == null ? [] : local.m1258["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1258["inventory_device_info"], null) == null ? [] : local.m1258["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m1258["network_element"], null) == null ? [] : local.m1258["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1258["parent"], null) == null ? [] : local.m1258["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1258["permission_resources"], null) == null ? [] : local.m1258["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1258["registered_device"], null) == null ? [] : local.m1258["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller_drive" {
    for_each = try(local.m1258["storage_controller_drive"], null) == null ? [] : local.m1258["storage_controller_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_files" {
    for_each = try(local.m1258["storage_files"], null) == null ? [] : local.m1258["storage_files"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1258["tags"], null) == null ? [] : local.m1258["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1258["version_context"], null) == null ? [] : local.m1258["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
