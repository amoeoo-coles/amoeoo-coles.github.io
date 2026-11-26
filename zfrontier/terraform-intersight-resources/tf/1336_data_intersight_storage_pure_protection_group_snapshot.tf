# Sample data source intersight_storage_pure_protection_group_snapshot — reads ../models/data_intersight_storage_pure_protection_group_snapshot.yml
locals { m1336 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_protection_group_snapshot.yml"))["data_intersight_storage_pure_protection_group_snapshot"] }

data "intersight_storage_pure_protection_group_snapshot" "n1336" {
  account_moid = try(local.m1336["account_moid"], null)
  additional_properties = try(local.m1336["additional_properties"], null)
  class_id = try(local.m1336["class_id"], null)
  create_time = try(local.m1336["create_time"], null)
  created_time = try(local.m1336["created_time"], null)
  domain_group_moid = try(local.m1336["domain_group_moid"], null)
  eradication_config = try(local.m1336["eradication_config"], null)
  id = try(local.m1336["id"], null)
  mod_time = try(local.m1336["mod_time"], null)
  moid = try(local.m1336["moid"], null)
  name = try(local.m1336["name"], null)
  nr_source = try(local.m1336["nr_source"], null)
  object_type = try(local.m1336["object_type"], null)
  owners = try(local.m1336["owners"], null)
  pod = try(local.m1336["pod"], null)
  realm_name = try(local.m1336["realm_name"], null)
  results = try(local.m1336["results"], null)
  shared_scope = try(local.m1336["shared_scope"], null)
  size = try(local.m1336["size"], null)
  snapshot_size = try(local.m1336["snapshot_size"], null)
  total_provisioned = try(local.m1336["total_provisioned"], null)
  dynamic "ancestors" {
    for_each = try(local.m1336["ancestors"], null) == null ? [] : local.m1336["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1336["array"], null) == null ? [] : local.m1336["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1336["parent"], null) == null ? [] : local.m1336["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1336["permission_resources"], null) == null ? [] : local.m1336["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group" {
    for_each = try(local.m1336["protection_group"], null) == null ? [] : local.m1336["protection_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "realm" {
    for_each = try(local.m1336["realm"], null) == null ? [] : local.m1336["realm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1336["registered_device"], null) == null ? [] : local.m1336["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1336["tags"], null) == null ? [] : local.m1336["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1336["version_context"], null) == null ? [] : local.m1336["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
