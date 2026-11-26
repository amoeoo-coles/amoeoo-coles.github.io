# Sample data source intersight_storage_net_app_cluster_snapshot_policy — reads ../models/data_intersight_storage_net_app_cluster_snapshot_policy.yml
locals { m1269 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_cluster_snapshot_policy.yml"))["data_intersight_storage_net_app_cluster_snapshot_policy"] }

data "intersight_storage_net_app_cluster_snapshot_policy" "n1269" {
  account_moid = try(local.m1269["account_moid"], null)
  additional_properties = try(local.m1269["additional_properties"], null)
  class_id = try(local.m1269["class_id"], null)
  create_time = try(local.m1269["create_time"], null)
  domain_group_moid = try(local.m1269["domain_group_moid"], null)
  enabled = try(local.m1269["enabled"], null)
  id = try(local.m1269["id"], null)
  mod_time = try(local.m1269["mod_time"], null)
  moid = try(local.m1269["moid"], null)
  name = try(local.m1269["name"], null)
  object_type = try(local.m1269["object_type"], null)
  owners = try(local.m1269["owners"], null)
  results = try(local.m1269["results"], null)
  scope = try(local.m1269["scope"], null)
  shared_scope = try(local.m1269["shared_scope"], null)
  uuid = try(local.m1269["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1269["ancestors"], null) == null ? [] : local.m1269["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1269["array"], null) == null ? [] : local.m1269["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "copies" {
    for_each = try(local.m1269["copies"], null) == null ? [] : local.m1269["copies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1269["parent"], null) == null ? [] : local.m1269["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1269["permission_resources"], null) == null ? [] : local.m1269["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1269["tags"], null) == null ? [] : local.m1269["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1269["version_context"], null) == null ? [] : local.m1269["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
