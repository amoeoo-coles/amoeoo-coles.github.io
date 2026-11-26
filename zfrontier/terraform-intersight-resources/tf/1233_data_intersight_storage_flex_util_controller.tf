# Sample data source intersight_storage_flex_util_controller — reads ../models/data_intersight_storage_flex_util_controller.yml
locals { m1233 = yamldecode(file("${path.module}/../models/data_intersight_storage_flex_util_controller.yml"))["data_intersight_storage_flex_util_controller"] }

data "intersight_storage_flex_util_controller" "n1233" {
  account_moid = try(local.m1233["account_moid"], null)
  additional_properties = try(local.m1233["additional_properties"], null)
  class_id = try(local.m1233["class_id"], null)
  controller_name = try(local.m1233["controller_name"], null)
  controller_status = try(local.m1233["controller_status"], null)
  create_time = try(local.m1233["create_time"], null)
  device_mo_id = try(local.m1233["device_mo_id"], null)
  dn = try(local.m1233["dn"], null)
  domain_group_moid = try(local.m1233["domain_group_moid"], null)
  ff_controller_id = try(local.m1233["ff_controller_id"], null)
  id = try(local.m1233["id"], null)
  internal_state = try(local.m1233["internal_state"], null)
  mod_time = try(local.m1233["mod_time"], null)
  moid = try(local.m1233["moid"], null)
  object_type = try(local.m1233["object_type"], null)
  owners = try(local.m1233["owners"], null)
  results = try(local.m1233["results"], null)
  rn = try(local.m1233["rn"], null)
  shared_scope = try(local.m1233["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1233["ancestors"], null) == null ? [] : local.m1233["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1233["compute_board"], null) == null ? [] : local.m1233["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flex_util_physical_drives" {
    for_each = try(local.m1233["flex_util_physical_drives"], null) == null ? [] : local.m1233["flex_util_physical_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flex_util_virtual_drives" {
    for_each = try(local.m1233["flex_util_virtual_drives"], null) == null ? [] : local.m1233["flex_util_virtual_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1233["inventory_device_info"], null) == null ? [] : local.m1233["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1233["parent"], null) == null ? [] : local.m1233["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1233["permission_resources"], null) == null ? [] : local.m1233["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1233["registered_device"], null) == null ? [] : local.m1233["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1233["tags"], null) == null ? [] : local.m1233["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1233["version_context"], null) == null ? [] : local.m1233["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
