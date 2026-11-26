# Sample data source intersight_niatelemetry_mds_neighbors — reads ../models/data_intersight_niatelemetry_mds_neighbors.yml
locals { m968 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_mds_neighbors.yml"))["data_intersight_niatelemetry_mds_neighbors"] }

data "intersight_niatelemetry_mds_neighbors" "n968" {
  account_moid = try(local.m968["account_moid"], null)
  additional_properties = try(local.m968["additional_properties"], null)
  class_id = try(local.m968["class_id"], null)
  create_time = try(local.m968["create_time"], null)
  device_ip = try(local.m968["device_ip"], null)
  device_name = try(local.m968["device_name"], null)
  device_wwn = try(local.m968["device_wwn"], null)
  domain_group_moid = try(local.m968["domain_group_moid"], null)
  id = try(local.m968["id"], null)
  mod_time = try(local.m968["mod_time"], null)
  moid = try(local.m968["moid"], null)
  object_type = try(local.m968["object_type"], null)
  owners = try(local.m968["owners"], null)
  record_type = try(local.m968["record_type"], null)
  record_version = try(local.m968["record_version"], null)
  results = try(local.m968["results"], null)
  serial = try(local.m968["serial"], null)
  shared_scope = try(local.m968["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m968["ancestors"], null) == null ? [] : local.m968["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "neighbor_info" {
    for_each = try(local.m968["neighbor_info"], null) == null ? [] : local.m968["neighbor_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m968["parent"], null) == null ? [] : local.m968["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m968["permission_resources"], null) == null ? [] : local.m968["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m968["registered_device"], null) == null ? [] : local.m968["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m968["tags"], null) == null ? [] : local.m968["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m968["version_context"], null) == null ? [] : local.m968["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
