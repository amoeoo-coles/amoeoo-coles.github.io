# Sample data source intersight_storage_net_app_lun_map — reads ../models/data_intersight_storage_net_app_lun_map.yml
locals { m1287 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_lun_map.yml"))["data_intersight_storage_net_app_lun_map"] }

data "intersight_storage_net_app_lun_map" "n1287" {
  account_moid = try(local.m1287["account_moid"], null)
  additional_properties = try(local.m1287["additional_properties"], null)
  class_id = try(local.m1287["class_id"], null)
  create_time = try(local.m1287["create_time"], null)
  domain_group_moid = try(local.m1287["domain_group_moid"], null)
  hlu = try(local.m1287["hlu"], null)
  host_name = try(local.m1287["host_name"], null)
  id = try(local.m1287["id"], null)
  igroup_uuid = try(local.m1287["igroup_uuid"], null)
  lun_uuid = try(local.m1287["lun_uuid"], null)
  mod_time = try(local.m1287["mod_time"], null)
  moid = try(local.m1287["moid"], null)
  object_type = try(local.m1287["object_type"], null)
  owners = try(local.m1287["owners"], null)
  results = try(local.m1287["results"], null)
  shared_scope = try(local.m1287["shared_scope"], null)
  volume_name = try(local.m1287["volume_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1287["ancestors"], null) == null ? [] : local.m1287["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1287["host"], null) == null ? [] : local.m1287["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1287["parent"], null) == null ? [] : local.m1287["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1287["permission_resources"], null) == null ? [] : local.m1287["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1287["tags"], null) == null ? [] : local.m1287["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1287["tenant"], null) == null ? [] : local.m1287["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1287["version_context"], null) == null ? [] : local.m1287["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volume" {
    for_each = try(local.m1287["volume"], null) == null ? [] : local.m1287["volume"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
