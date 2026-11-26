# Sample data source intersight_storage_sas_port — reads ../models/data_intersight_storage_sas_port.yml
locals { m1347 = yamldecode(file("${path.module}/../models/data_intersight_storage_sas_port.yml"))["data_intersight_storage_sas_port"] }

data "intersight_storage_sas_port" "n1347" {
  account_moid = try(local.m1347["account_moid"], null)
  additional_properties = try(local.m1347["additional_properties"], null)
  address = try(local.m1347["address"], null)
  class_id = try(local.m1347["class_id"], null)
  create_time = try(local.m1347["create_time"], null)
  device_mo_id = try(local.m1347["device_mo_id"], null)
  disk_id = try(local.m1347["disk_id"], null)
  dn = try(local.m1347["dn"], null)
  domain_group_moid = try(local.m1347["domain_group_moid"], null)
  end_point_id = try(local.m1347["end_point_id"], null)
  id = try(local.m1347["id"], null)
  link_description = try(local.m1347["link_description"], null)
  link_speed = try(local.m1347["link_speed"], null)
  mod_time = try(local.m1347["mod_time"], null)
  moid = try(local.m1347["moid"], null)
  object_type = try(local.m1347["object_type"], null)
  owners = try(local.m1347["owners"], null)
  results = try(local.m1347["results"], null)
  rn = try(local.m1347["rn"], null)
  shared_scope = try(local.m1347["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1347["ancestors"], null) == null ? [] : local.m1347["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1347["inventory_device_info"], null) == null ? [] : local.m1347["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1347["parent"], null) == null ? [] : local.m1347["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1347["permission_resources"], null) == null ? [] : local.m1347["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1347["registered_device"], null) == null ? [] : local.m1347["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_physical_disk" {
    for_each = try(local.m1347["storage_physical_disk"], null) == null ? [] : local.m1347["storage_physical_disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1347["tags"], null) == null ? [] : local.m1347["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1347["version_context"], null) == null ? [] : local.m1347["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
