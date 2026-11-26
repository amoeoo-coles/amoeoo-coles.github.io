# Sample data source intersight_storage_hyper_flex_volume — reads ../models/data_intersight_storage_hyper_flex_volume.yml
locals { m1257 = yamldecode(file("${path.module}/../models/data_intersight_storage_hyper_flex_volume.yml"))["data_intersight_storage_hyper_flex_volume"] }

data "intersight_storage_hyper_flex_volume" "n1257" {
  account_moid = try(local.m1257["account_moid"], null)
  additional_properties = try(local.m1257["additional_properties"], null)
  capacity = try(local.m1257["capacity"], null)
  class_id = try(local.m1257["class_id"], null)
  client_id = try(local.m1257["client_id"], null)
  create_time = try(local.m1257["create_time"], null)
  description = try(local.m1257["description"], null)
  domain_group_moid = try(local.m1257["domain_group_moid"], null)
  id = try(local.m1257["id"], null)
  last_modified_time = try(local.m1257["last_modified_time"], null)
  lun_uuid = try(local.m1257["lun_uuid"], null)
  mod_time = try(local.m1257["mod_time"], null)
  moid = try(local.m1257["moid"], null)
  naa_id = try(local.m1257["naa_id"], null)
  name = try(local.m1257["name"], null)
  object_type = try(local.m1257["object_type"], null)
  owners = try(local.m1257["owners"], null)
  results = try(local.m1257["results"], null)
  serial_number = try(local.m1257["serial_number"], null)
  shared_scope = try(local.m1257["shared_scope"], null)
  size = try(local.m1257["size"], null)
  uuid = try(local.m1257["uuid"], null)
  volume_access_mode = try(local.m1257["volume_access_mode"], null)
  volume_mode = try(local.m1257["volume_mode"], null)
  volume_type = try(local.m1257["volume_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1257["ancestors"], null) == null ? [] : local.m1257["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m1257["cluster"], null) == null ? [] : local.m1257["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1257["parent"], null) == null ? [] : local.m1257["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1257["permission_resources"], null) == null ? [] : local.m1257["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1257["registered_device"], null) == null ? [] : local.m1257["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m1257["storage_container"], null) == null ? [] : local.m1257["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1257["storage_utilization"], null) == null ? [] : local.m1257["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1257["tags"], null) == null ? [] : local.m1257["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1257["version_context"], null) == null ? [] : local.m1257["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
