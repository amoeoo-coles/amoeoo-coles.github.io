# Sample data source intersight_storage_enclosure_disk — reads ../models/data_intersight_storage_enclosure_disk.yml
locals { m1226 = yamldecode(file("${path.module}/../models/data_intersight_storage_enclosure_disk.yml"))["data_intersight_storage_enclosure_disk"] }

data "intersight_storage_enclosure_disk" "n1226" {
  account_moid = try(local.m1226["account_moid"], null)
  additional_properties = try(local.m1226["additional_properties"], null)
  block_size = try(local.m1226["block_size"], null)
  class_id = try(local.m1226["class_id"], null)
  create_time = try(local.m1226["create_time"], null)
  device_mo_id = try(local.m1226["device_mo_id"], null)
  disk_id = try(local.m1226["disk_id"], null)
  disk_state = try(local.m1226["disk_state"], null)
  dn = try(local.m1226["dn"], null)
  domain_group_moid = try(local.m1226["domain_group_moid"], null)
  health = try(local.m1226["health"], null)
  id = try(local.m1226["id"], null)
  is_upgraded = try(local.m1226["is_upgraded"], null)
  mod_time = try(local.m1226["mod_time"], null)
  model = try(local.m1226["model"], null)
  moid = try(local.m1226["moid"], null)
  num_blocks = try(local.m1226["num_blocks"], null)
  object_type = try(local.m1226["object_type"], null)
  owners = try(local.m1226["owners"], null)
  pid = try(local.m1226["pid"], null)
  presence = try(local.m1226["presence"], null)
  results = try(local.m1226["results"], null)
  revision = try(local.m1226["revision"], null)
  rn = try(local.m1226["rn"], null)
  sas_address1 = try(local.m1226["sas_address1"], null)
  sas_address2 = try(local.m1226["sas_address2"], null)
  serial = try(local.m1226["serial"], null)
  shared_scope = try(local.m1226["shared_scope"], null)
  size = try(local.m1226["size"], null)
  vendor = try(local.m1226["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1226["ancestors"], null) == null ? [] : local.m1226["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1226["inventory_device_info"], null) == null ? [] : local.m1226["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1226["parent"], null) == null ? [] : local.m1226["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1226["permission_resources"], null) == null ? [] : local.m1226["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disk" {
    for_each = try(local.m1226["physical_disk"], null) == null ? [] : local.m1226["physical_disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1226["previous_fru"], null) == null ? [] : local.m1226["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1226["registered_device"], null) == null ? [] : local.m1226["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_enclosure" {
    for_each = try(local.m1226["storage_enclosure"], null) == null ? [] : local.m1226["storage_enclosure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1226["tags"], null) == null ? [] : local.m1226["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1226["version_context"], null) == null ? [] : local.m1226["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
