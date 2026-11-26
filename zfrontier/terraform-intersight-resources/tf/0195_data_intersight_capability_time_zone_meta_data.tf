# Sample data source intersight_capability_time_zone_meta_data — reads ../models/data_intersight_capability_time_zone_meta_data.yml
locals { m195 = yamldecode(file("${path.module}/../models/data_intersight_capability_time_zone_meta_data.yml"))["data_intersight_capability_time_zone_meta_data"] }

data "intersight_capability_time_zone_meta_data" "n195" {
  account_moid = try(local.m195["account_moid"], null)
  additional_properties = try(local.m195["additional_properties"], null)
  class_id = try(local.m195["class_id"], null)
  create_time = try(local.m195["create_time"], null)
  domain_group_moid = try(local.m195["domain_group_moid"], null)
  id = try(local.m195["id"], null)
  mod_time = try(local.m195["mod_time"], null)
  moid = try(local.m195["moid"], null)
  name = try(local.m195["name"], null)
  object_type = try(local.m195["object_type"], null)
  owners = try(local.m195["owners"], null)
  results = try(local.m195["results"], null)
  shared_scope = try(local.m195["shared_scope"], null)
  supported_time_zones = try(local.m195["supported_time_zones"], null)
  target_type = try(local.m195["target_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m195["ancestors"], null) == null ? [] : local.m195["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m195["parent"], null) == null ? [] : local.m195["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m195["permission_resources"], null) == null ? [] : local.m195["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m195["tags"], null) == null ? [] : local.m195["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m195["version_context"], null) == null ? [] : local.m195["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
