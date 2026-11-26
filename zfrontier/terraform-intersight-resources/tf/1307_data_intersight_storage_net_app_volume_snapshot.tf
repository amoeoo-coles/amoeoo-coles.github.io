# Sample data source intersight_storage_net_app_volume_snapshot — reads ../models/data_intersight_storage_net_app_volume_snapshot.yml
locals { m1307 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_volume_snapshot.yml"))["data_intersight_storage_net_app_volume_snapshot"] }

data "intersight_storage_net_app_volume_snapshot" "n1307" {
  account_moid = try(local.m1307["account_moid"], null)
  additional_properties = try(local.m1307["additional_properties"], null)
  class_id = try(local.m1307["class_id"], null)
  create_time = try(local.m1307["create_time"], null)
  created_time = try(local.m1307["created_time"], null)
  domain_group_moid = try(local.m1307["domain_group_moid"], null)
  id = try(local.m1307["id"], null)
  mod_time = try(local.m1307["mod_time"], null)
  moid = try(local.m1307["moid"], null)
  name = try(local.m1307["name"], null)
  nr_source = try(local.m1307["nr_source"], null)
  object_type = try(local.m1307["object_type"], null)
  owners = try(local.m1307["owners"], null)
  protection_group_name = try(local.m1307["protection_group_name"], null)
  results = try(local.m1307["results"], null)
  shared_scope = try(local.m1307["shared_scope"], null)
  size = try(local.m1307["size"], null)
  uuid = try(local.m1307["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1307["ancestors"], null) == null ? [] : local.m1307["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1307["array"], null) == null ? [] : local.m1307["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1307["parent"], null) == null ? [] : local.m1307["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1307["permission_resources"], null) == null ? [] : local.m1307["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m1307["storage_container"], null) == null ? [] : local.m1307["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1307["tags"], null) == null ? [] : local.m1307["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1307["version_context"], null) == null ? [] : local.m1307["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
