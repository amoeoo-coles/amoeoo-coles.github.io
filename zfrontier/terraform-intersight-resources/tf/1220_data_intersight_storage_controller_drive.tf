# Sample data source intersight_storage_controller_drive — reads ../models/data_intersight_storage_controller_drive.yml
locals { m1220 = yamldecode(file("${path.module}/../models/data_intersight_storage_controller_drive.yml"))["data_intersight_storage_controller_drive"] }

data "intersight_storage_controller_drive" "n1220" {
  account_moid = try(local.m1220["account_moid"], null)
  additional_properties = try(local.m1220["additional_properties"], null)
  class_id = try(local.m1220["class_id"], null)
  controller_type = try(local.m1220["controller_type"], null)
  create_time = try(local.m1220["create_time"], null)
  description = try(local.m1220["description"], null)
  device_mo_id = try(local.m1220["device_mo_id"], null)
  dn = try(local.m1220["dn"], null)
  domain_group_moid = try(local.m1220["domain_group_moid"], null)
  id = try(local.m1220["id"], null)
  mod_time = try(local.m1220["mod_time"], null)
  moid = try(local.m1220["moid"], null)
  name = try(local.m1220["name"], null)
  object_type = try(local.m1220["object_type"], null)
  owners = try(local.m1220["owners"], null)
  partition_count = try(local.m1220["partition_count"], null)
  results = try(local.m1220["results"], null)
  rn = try(local.m1220["rn"], null)
  shared_scope = try(local.m1220["shared_scope"], null)
  storage_id = try(local.m1220["storage_id"], null)
  type = try(local.m1220["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1220["ancestors"], null) == null ? [] : local.m1220["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1220["compute_board"], null) == null ? [] : local.m1220["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1220["parent"], null) == null ? [] : local.m1220["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1220["permission_resources"], null) == null ? [] : local.m1220["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1220["registered_device"], null) == null ? [] : local.m1220["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_item" {
    for_each = try(local.m1220["storage_item"], null) == null ? [] : local.m1220["storage_item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1220["tags"], null) == null ? [] : local.m1220["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1220["version_context"], null) == null ? [] : local.m1220["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
