# Sample data source intersight_hyperflex_lun — reads ../models/data_intersight_hyperflex_lun.yml
locals { m618 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_lun.yml"))["data_intersight_hyperflex_lun"] }

data "intersight_hyperflex_lun" "n618" {
  account_moid = try(local.m618["account_moid"], null)
  additional_properties = try(local.m618["additional_properties"], null)
  class_id = try(local.m618["class_id"], null)
  create_time = try(local.m618["create_time"], null)
  description = try(local.m618["description"], null)
  domain_group_moid = try(local.m618["domain_group_moid"], null)
  ds_capacity_in_bytes = try(local.m618["ds_capacity_in_bytes"], null)
  ds_name = try(local.m618["ds_name"], null)
  ds_uuid = try(local.m618["ds_uuid"], null)
  hlu = try(local.m618["hlu"], null)
  host_name = try(local.m618["host_name"], null)
  id = try(local.m618["id"], null)
  inventory_source = try(local.m618["inventory_source"], null)
  is_encrypted = try(local.m618["is_encrypted"], null)
  lun_id = try(local.m618["lun_id"], null)
  mod_time = try(local.m618["mod_time"], null)
  moid = try(local.m618["moid"], null)
  name = try(local.m618["name"], null)
  nr_version = try(local.m618["nr_version"], null)
  object_type = try(local.m618["object_type"], null)
  owners = try(local.m618["owners"], null)
  results = try(local.m618["results"], null)
  serial_no = try(local.m618["serial_no"], null)
  shared_scope = try(local.m618["shared_scope"], null)
  total_capacity_in_bytes = try(local.m618["total_capacity_in_bytes"], null)
  tuuid = try(local.m618["tuuid"], null)
  used_capacity_in_bytes = try(local.m618["used_capacity_in_bytes"], null)
  uuid = try(local.m618["uuid"], null)
  volume_name = try(local.m618["volume_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m618["ancestors"], null) == null ? [] : local.m618["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m618["parent"], null) == null ? [] : local.m618["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m618["permission_resources"], null) == null ? [] : local.m618["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m618["tags"], null) == null ? [] : local.m618["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m618["target"], null) == null ? [] : local.m618["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m618["version_context"], null) == null ? [] : local.m618["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
