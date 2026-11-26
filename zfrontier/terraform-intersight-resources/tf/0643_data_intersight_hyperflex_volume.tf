# Sample data source intersight_hyperflex_volume — reads ../models/data_intersight_hyperflex_volume.yml
locals { m643 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_volume.yml"))["data_intersight_hyperflex_volume"] }

data "intersight_hyperflex_volume" "n643" {
  account_moid = try(local.m643["account_moid"], null)
  additional_properties = try(local.m643["additional_properties"], null)
  capacity = try(local.m643["capacity"], null)
  class_id = try(local.m643["class_id"], null)
  client_id = try(local.m643["client_id"], null)
  create_time = try(local.m643["create_time"], null)
  description = try(local.m643["description"], null)
  domain_group_moid = try(local.m643["domain_group_moid"], null)
  id = try(local.m643["id"], null)
  last_modified_time = try(local.m643["last_modified_time"], null)
  lun_uuid = try(local.m643["lun_uuid"], null)
  mod_time = try(local.m643["mod_time"], null)
  moid = try(local.m643["moid"], null)
  naa_id = try(local.m643["naa_id"], null)
  name = try(local.m643["name"], null)
  object_type = try(local.m643["object_type"], null)
  owners = try(local.m643["owners"], null)
  results = try(local.m643["results"], null)
  serial_number = try(local.m643["serial_number"], null)
  shared_scope = try(local.m643["shared_scope"], null)
  size = try(local.m643["size"], null)
  uuid = try(local.m643["uuid"], null)
  volume_access_mode = try(local.m643["volume_access_mode"], null)
  volume_create_time = try(local.m643["volume_create_time"], null)
  volume_mode = try(local.m643["volume_mode"], null)
  volume_type = try(local.m643["volume_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m643["ancestors"], null) == null ? [] : local.m643["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m643["cluster"], null) == null ? [] : local.m643["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m643["parent"], null) == null ? [] : local.m643["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m643["permission_resources"], null) == null ? [] : local.m643["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m643["storage_container"], null) == null ? [] : local.m643["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m643["storage_utilization"], null) == null ? [] : local.m643["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m643["tags"], null) == null ? [] : local.m643["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m643["version_context"], null) == null ? [] : local.m643["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
