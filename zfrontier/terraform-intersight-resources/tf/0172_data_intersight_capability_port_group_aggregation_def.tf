# Sample data source intersight_capability_port_group_aggregation_def — reads ../models/data_intersight_capability_port_group_aggregation_def.yml
locals { m172 = yamldecode(file("${path.module}/../models/data_intersight_capability_port_group_aggregation_def.yml"))["data_intersight_capability_port_group_aggregation_def"] }

data "intersight_capability_port_group_aggregation_def" "n172" {
  account_moid = try(local.m172["account_moid"], null)
  additional_properties = try(local.m172["additional_properties"], null)
  aggregation_cap = try(local.m172["aggregation_cap"], null)
  class_id = try(local.m172["class_id"], null)
  create_time = try(local.m172["create_time"], null)
  domain_group_moid = try(local.m172["domain_group_moid"], null)
  hw40_g_port_group_cap = try(local.m172["hw40_g_port_group_cap"], null)
  id = try(local.m172["id"], null)
  mod_time = try(local.m172["mod_time"], null)
  moid = try(local.m172["moid"], null)
  name = try(local.m172["name"], null)
  object_type = try(local.m172["object_type"], null)
  owners = try(local.m172["owners"], null)
  pgtype = try(local.m172["pgtype"], null)
  results = try(local.m172["results"], null)
  shared_scope = try(local.m172["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m172["ancestors"], null) == null ? [] : local.m172["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m172["parent"], null) == null ? [] : local.m172["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m172["permission_resources"], null) == null ? [] : local.m172["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m172["tags"], null) == null ? [] : local.m172["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m172["version_context"], null) == null ? [] : local.m172["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
