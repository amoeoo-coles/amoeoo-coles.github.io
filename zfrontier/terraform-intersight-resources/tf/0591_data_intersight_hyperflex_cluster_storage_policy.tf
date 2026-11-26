# Sample data source intersight_hyperflex_cluster_storage_policy — reads ../models/data_intersight_hyperflex_cluster_storage_policy.yml
locals { m591 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_storage_policy.yml"))["data_intersight_hyperflex_cluster_storage_policy"] }

data "intersight_hyperflex_cluster_storage_policy" "n591" {
  account_moid = try(local.m591["account_moid"], null)
  additional_properties = try(local.m591["additional_properties"], null)
  class_id = try(local.m591["class_id"], null)
  create_time = try(local.m591["create_time"], null)
  description = try(local.m591["description"], null)
  disk_partition_cleanup = try(local.m591["disk_partition_cleanup"], null)
  domain_group_moid = try(local.m591["domain_group_moid"], null)
  id = try(local.m591["id"], null)
  mod_time = try(local.m591["mod_time"], null)
  moid = try(local.m591["moid"], null)
  name = try(local.m591["name"], null)
  object_type = try(local.m591["object_type"], null)
  owners = try(local.m591["owners"], null)
  results = try(local.m591["results"], null)
  shared_scope = try(local.m591["shared_scope"], null)
  vdi_optimization = try(local.m591["vdi_optimization"], null)
  dynamic "ancestors" {
    for_each = try(local.m591["ancestors"], null) == null ? [] : local.m591["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m591["cluster_profiles"], null) == null ? [] : local.m591["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "logical_avalability_zone_config" {
    for_each = try(local.m591["logical_avalability_zone_config"], null) == null ? [] : local.m591["logical_avalability_zone_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m591["organization"], null) == null ? [] : local.m591["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m591["parent"], null) == null ? [] : local.m591["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m591["permission_resources"], null) == null ? [] : local.m591["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m591["tags"], null) == null ? [] : local.m591["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m591["version_context"], null) == null ? [] : local.m591["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
