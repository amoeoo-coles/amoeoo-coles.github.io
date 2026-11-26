# Sample data source intersight_storage_pure_realm — reads ../models/data_intersight_storage_pure_realm.yml
locals { m1338 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_realm.yml"))["data_intersight_storage_pure_realm"] }

data "intersight_storage_pure_realm" "n1338" {
  account_moid = try(local.m1338["account_moid"], null)
  additional_properties = try(local.m1338["additional_properties"], null)
  bandwidth_limit = try(local.m1338["bandwidth_limit"], null)
  class_id = try(local.m1338["class_id"], null)
  create_time = try(local.m1338["create_time"], null)
  created = try(local.m1338["created"], null)
  domain_group_moid = try(local.m1338["domain_group_moid"], null)
  id = try(local.m1338["id"], null)
  iops_limit = try(local.m1338["iops_limit"], null)
  mod_time = try(local.m1338["mod_time"], null)
  moid = try(local.m1338["moid"], null)
  name = try(local.m1338["name"], null)
  object_type = try(local.m1338["object_type"], null)
  owners = try(local.m1338["owners"], null)
  quota_limit = try(local.m1338["quota_limit"], null)
  results = try(local.m1338["results"], null)
  shared_scope = try(local.m1338["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1338["ancestors"], null) == null ? [] : local.m1338["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1338["array"], null) == null ? [] : local.m1338["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hosts" {
    for_each = try(local.m1338["hosts"], null) == null ? [] : local.m1338["hosts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1338["parent"], null) == null ? [] : local.m1338["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1338["permission_resources"], null) == null ? [] : local.m1338["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pods" {
    for_each = try(local.m1338["pods"], null) == null ? [] : local.m1338["pods"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group_snapshots" {
    for_each = try(local.m1338["protection_group_snapshots"], null) == null ? [] : local.m1338["protection_group_snapshots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_groups" {
    for_each = try(local.m1338["protection_groups"], null) == null ? [] : local.m1338["protection_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1338["registered_device"], null) == null ? [] : local.m1338["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1338["storage_utilization"], null) == null ? [] : local.m1338["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1338["tags"], null) == null ? [] : local.m1338["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1338["version_context"], null) == null ? [] : local.m1338["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volume_snapshots" {
    for_each = try(local.m1338["volume_snapshots"], null) == null ? [] : local.m1338["volume_snapshots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volumes" {
    for_each = try(local.m1338["volumes"], null) == null ? [] : local.m1338["volumes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
