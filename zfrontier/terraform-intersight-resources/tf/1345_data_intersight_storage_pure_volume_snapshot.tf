# Sample data source intersight_storage_pure_volume_snapshot — reads ../models/data_intersight_storage_pure_volume_snapshot.yml
locals { m1345 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_volume_snapshot.yml"))["data_intersight_storage_pure_volume_snapshot"] }

data "intersight_storage_pure_volume_snapshot" "n1345" {
  account_moid = try(local.m1345["account_moid"], null)
  additional_properties = try(local.m1345["additional_properties"], null)
  class_id = try(local.m1345["class_id"], null)
  create_time = try(local.m1345["create_time"], null)
  created_time = try(local.m1345["created_time"], null)
  domain_group_moid = try(local.m1345["domain_group_moid"], null)
  id = try(local.m1345["id"], null)
  mod_time = try(local.m1345["mod_time"], null)
  moid = try(local.m1345["moid"], null)
  name = try(local.m1345["name"], null)
  nr_source = try(local.m1345["nr_source"], null)
  object_type = try(local.m1345["object_type"], null)
  owners = try(local.m1345["owners"], null)
  pod = try(local.m1345["pod"], null)
  protection_group_name = try(local.m1345["protection_group_name"], null)
  realm_name = try(local.m1345["realm_name"], null)
  results = try(local.m1345["results"], null)
  serial = try(local.m1345["serial"], null)
  shared_scope = try(local.m1345["shared_scope"], null)
  size = try(local.m1345["size"], null)
  snapshot_size = try(local.m1345["snapshot_size"], null)
  total_provisioned = try(local.m1345["total_provisioned"], null)
  used_provisioned = try(local.m1345["used_provisioned"], null)
  volume_group = try(local.m1345["volume_group"], null)
  dynamic "ancestors" {
    for_each = try(local.m1345["ancestors"], null) == null ? [] : local.m1345["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1345["array"], null) == null ? [] : local.m1345["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1345["parent"], null) == null ? [] : local.m1345["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1345["permission_resources"], null) == null ? [] : local.m1345["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group_snapshot" {
    for_each = try(local.m1345["protection_group_snapshot"], null) == null ? [] : local.m1345["protection_group_snapshot"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "realm" {
    for_each = try(local.m1345["realm"], null) == null ? [] : local.m1345["realm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1345["registered_device"], null) == null ? [] : local.m1345["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1345["tags"], null) == null ? [] : local.m1345["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1345["version_context"], null) == null ? [] : local.m1345["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volume" {
    for_each = try(local.m1345["volume"], null) == null ? [] : local.m1345["volume"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
