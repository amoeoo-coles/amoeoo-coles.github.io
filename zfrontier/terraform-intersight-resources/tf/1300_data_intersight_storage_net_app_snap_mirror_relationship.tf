# Sample data source intersight_storage_net_app_snap_mirror_relationship — reads ../models/data_intersight_storage_net_app_snap_mirror_relationship.yml
locals { m1300 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_snap_mirror_relationship.yml"))["data_intersight_storage_net_app_snap_mirror_relationship"] }

data "intersight_storage_net_app_snap_mirror_relationship" "n1300" {
  account_moid = try(local.m1300["account_moid"], null)
  additional_properties = try(local.m1300["additional_properties"], null)
  class_id = try(local.m1300["class_id"], null)
  create_time = try(local.m1300["create_time"], null)
  destination_path = try(local.m1300["destination_path"], null)
  domain_group_moid = try(local.m1300["domain_group_moid"], null)
  healthy = try(local.m1300["healthy"], null)
  id = try(local.m1300["id"], null)
  lag_time = try(local.m1300["lag_time"], null)
  mod_time = try(local.m1300["mod_time"], null)
  moid = try(local.m1300["moid"], null)
  object_type = try(local.m1300["object_type"], null)
  owners = try(local.m1300["owners"], null)
  policy_name = try(local.m1300["policy_name"], null)
  policy_type = try(local.m1300["policy_type"], null)
  policy_uuid = try(local.m1300["policy_uuid"], null)
  results = try(local.m1300["results"], null)
  shared_scope = try(local.m1300["shared_scope"], null)
  source_path = try(local.m1300["source_path"], null)
  state = try(local.m1300["state"], null)
  uuid = try(local.m1300["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1300["ancestors"], null) == null ? [] : local.m1300["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1300["array"], null) == null ? [] : local.m1300["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "destination_tenant" {
    for_each = try(local.m1300["destination_tenant"], null) == null ? [] : local.m1300["destination_tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1300["parent"], null) == null ? [] : local.m1300["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1300["permission_resources"], null) == null ? [] : local.m1300["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1300["policy"], null) == null ? [] : local.m1300["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1300["tags"], null) == null ? [] : local.m1300["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1300["version_context"], null) == null ? [] : local.m1300["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
