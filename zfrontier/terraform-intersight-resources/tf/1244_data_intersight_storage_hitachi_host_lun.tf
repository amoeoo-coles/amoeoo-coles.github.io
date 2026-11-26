# Sample data source intersight_storage_hitachi_host_lun — reads ../models/data_intersight_storage_hitachi_host_lun.yml
locals { m1244 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_host_lun.yml"))["data_intersight_storage_hitachi_host_lun"] }

data "intersight_storage_hitachi_host_lun" "n1244" {
  account_moid = try(local.m1244["account_moid"], null)
  additional_properties = try(local.m1244["additional_properties"], null)
  class_id = try(local.m1244["class_id"], null)
  create_time = try(local.m1244["create_time"], null)
  domain_group_moid = try(local.m1244["domain_group_moid"], null)
  hlu = try(local.m1244["hlu"], null)
  host_name = try(local.m1244["host_name"], null)
  id = try(local.m1244["id"], null)
  mod_time = try(local.m1244["mod_time"], null)
  moid = try(local.m1244["moid"], null)
  object_type = try(local.m1244["object_type"], null)
  owners = try(local.m1244["owners"], null)
  port_id = try(local.m1244["port_id"], null)
  results = try(local.m1244["results"], null)
  shared_scope = try(local.m1244["shared_scope"], null)
  volume_name = try(local.m1244["volume_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1244["ancestors"], null) == null ? [] : local.m1244["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1244["array"], null) == null ? [] : local.m1244["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1244["host"], null) == null ? [] : local.m1244["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1244["parent"], null) == null ? [] : local.m1244["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1244["permission_resources"], null) == null ? [] : local.m1244["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1244["registered_device"], null) == null ? [] : local.m1244["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1244["tags"], null) == null ? [] : local.m1244["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1244["version_context"], null) == null ? [] : local.m1244["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volume" {
    for_each = try(local.m1244["volume"], null) == null ? [] : local.m1244["volume"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
