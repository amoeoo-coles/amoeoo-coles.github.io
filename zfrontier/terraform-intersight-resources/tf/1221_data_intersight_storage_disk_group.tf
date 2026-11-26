# Sample data source intersight_storage_disk_group — reads ../models/data_intersight_storage_disk_group.yml
locals { m1221 = yamldecode(file("${path.module}/../models/data_intersight_storage_disk_group.yml"))["data_intersight_storage_disk_group"] }

data "intersight_storage_disk_group" "n1221" {
  account_moid = try(local.m1221["account_moid"], null)
  additional_properties = try(local.m1221["additional_properties"], null)
  class_id = try(local.m1221["class_id"], null)
  create_time = try(local.m1221["create_time"], null)
  device_mo_id = try(local.m1221["device_mo_id"], null)
  dn = try(local.m1221["dn"], null)
  domain_group_moid = try(local.m1221["domain_group_moid"], null)
  id = try(local.m1221["id"], null)
  mod_time = try(local.m1221["mod_time"], null)
  moid = try(local.m1221["moid"], null)
  name = try(local.m1221["name"], null)
  object_type = try(local.m1221["object_type"], null)
  owners = try(local.m1221["owners"], null)
  raid_type = try(local.m1221["raid_type"], null)
  results = try(local.m1221["results"], null)
  rn = try(local.m1221["rn"], null)
  shared_scope = try(local.m1221["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1221["ancestors"], null) == null ? [] : local.m1221["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dedicated_hot_spares" {
    for_each = try(local.m1221["dedicated_hot_spares"], null) == null ? [] : local.m1221["dedicated_hot_spares"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1221["parent"], null) == null ? [] : local.m1221["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1221["permission_resources"], null) == null ? [] : local.m1221["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1221["registered_device"], null) == null ? [] : local.m1221["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "spans" {
    for_each = try(local.m1221["spans"], null) == null ? [] : local.m1221["spans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m1221["storage_controller"], null) == null ? [] : local.m1221["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1221["tags"], null) == null ? [] : local.m1221["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1221["version_context"], null) == null ? [] : local.m1221["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drives" {
    for_each = try(local.m1221["virtual_drives"], null) == null ? [] : local.m1221["virtual_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
