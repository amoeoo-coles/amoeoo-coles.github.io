# Sample data source intersight_storage_vd_member_ep — reads ../models/data_intersight_storage_vd_member_ep.yml
locals { m1350 = yamldecode(file("${path.module}/../models/data_intersight_storage_vd_member_ep.yml"))["data_intersight_storage_vd_member_ep"] }

data "intersight_storage_vd_member_ep" "n1350" {
  account_moid = try(local.m1350["account_moid"], null)
  additional_properties = try(local.m1350["additional_properties"], null)
  class_id = try(local.m1350["class_id"], null)
  create_time = try(local.m1350["create_time"], null)
  device_mo_id = try(local.m1350["device_mo_id"], null)
  dn = try(local.m1350["dn"], null)
  domain_group_moid = try(local.m1350["domain_group_moid"], null)
  id = try(local.m1350["id"], null)
  mod_time = try(local.m1350["mod_time"], null)
  moid = try(local.m1350["moid"], null)
  object_type = try(local.m1350["object_type"], null)
  oper_qualifier_reason = try(local.m1350["oper_qualifier_reason"], null)
  owners = try(local.m1350["owners"], null)
  presence = try(local.m1350["presence"], null)
  results = try(local.m1350["results"], null)
  rn = try(local.m1350["rn"], null)
  role = try(local.m1350["role"], null)
  shared_scope = try(local.m1350["shared_scope"], null)
  span_id = try(local.m1350["span_id"], null)
  vd_member_ep_id = try(local.m1350["vd_member_ep_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1350["ancestors"], null) == null ? [] : local.m1350["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1350["inventory_device_info"], null) == null ? [] : local.m1350["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1350["parent"], null) == null ? [] : local.m1350["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1350["permission_resources"], null) == null ? [] : local.m1350["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1350["registered_device"], null) == null ? [] : local.m1350["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_virtual_drive" {
    for_each = try(local.m1350["storage_virtual_drive"], null) == null ? [] : local.m1350["storage_virtual_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1350["tags"], null) == null ? [] : local.m1350["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1350["version_context"], null) == null ? [] : local.m1350["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
