# Sample data source intersight_hyperflex_target — reads ../models/data_intersight_hyperflex_target.yml
locals { m636 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_target.yml"))["data_intersight_hyperflex_target"] }

data "intersight_hyperflex_target" "n636" {
  account_moid = try(local.m636["account_moid"], null)
  additional_properties = try(local.m636["additional_properties"], null)
  auth_method = try(local.m636["auth_method"], null)
  class_id = try(local.m636["class_id"], null)
  create_time = try(local.m636["create_time"], null)
  description = try(local.m636["description"], null)
  domain_group_moid = try(local.m636["domain_group_moid"], null)
  id = try(local.m636["id"], null)
  initiator_group_uuids = try(local.m636["initiator_group_uuids"], null)
  inventory_source = try(local.m636["inventory_source"], null)
  iqn = try(local.m636["iqn"], null)
  lun_uuids = try(local.m636["lun_uuids"], null)
  mod_time = try(local.m636["mod_time"], null)
  moid = try(local.m636["moid"], null)
  name = try(local.m636["name"], null)
  nr_version = try(local.m636["nr_version"], null)
  num_active_initiators = try(local.m636["num_active_initiators"], null)
  object_type = try(local.m636["object_type"], null)
  owners = try(local.m636["owners"], null)
  results = try(local.m636["results"], null)
  shared_scope = try(local.m636["shared_scope"], null)
  uuid = try(local.m636["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m636["ancestors"], null) == null ? [] : local.m636["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m636["cluster"], null) == null ? [] : local.m636["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiator_groups" {
    for_each = try(local.m636["initiator_groups"], null) == null ? [] : local.m636["initiator_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "luns" {
    for_each = try(local.m636["luns"], null) == null ? [] : local.m636["luns"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m636["parent"], null) == null ? [] : local.m636["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m636["permission_resources"], null) == null ? [] : local.m636["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m636["tags"], null) == null ? [] : local.m636["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m636["version_context"], null) == null ? [] : local.m636["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
