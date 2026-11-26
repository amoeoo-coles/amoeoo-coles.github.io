# Sample data source intersight_storage_span — reads ../models/data_intersight_storage_span.yml
locals { m1348 = yamldecode(file("${path.module}/../models/data_intersight_storage_span.yml"))["data_intersight_storage_span"] }

data "intersight_storage_span" "n1348" {
  account_moid = try(local.m1348["account_moid"], null)
  additional_properties = try(local.m1348["additional_properties"], null)
  class_id = try(local.m1348["class_id"], null)
  create_time = try(local.m1348["create_time"], null)
  device_mo_id = try(local.m1348["device_mo_id"], null)
  dn = try(local.m1348["dn"], null)
  domain_group_moid = try(local.m1348["domain_group_moid"], null)
  id = try(local.m1348["id"], null)
  mod_time = try(local.m1348["mod_time"], null)
  moid = try(local.m1348["moid"], null)
  object_type = try(local.m1348["object_type"], null)
  owners = try(local.m1348["owners"], null)
  results = try(local.m1348["results"], null)
  rn = try(local.m1348["rn"], null)
  shared_scope = try(local.m1348["shared_scope"], null)
  slots = try(local.m1348["slots"], null)
  span_id = try(local.m1348["span_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1348["ancestors"], null) == null ? [] : local.m1348["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_group" {
    for_each = try(local.m1348["disk_group"], null) == null ? [] : local.m1348["disk_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1348["parent"], null) == null ? [] : local.m1348["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1348["permission_resources"], null) == null ? [] : local.m1348["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disks" {
    for_each = try(local.m1348["physical_disks"], null) == null ? [] : local.m1348["physical_disks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1348["registered_device"], null) == null ? [] : local.m1348["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1348["tags"], null) == null ? [] : local.m1348["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1348["version_context"], null) == null ? [] : local.m1348["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
