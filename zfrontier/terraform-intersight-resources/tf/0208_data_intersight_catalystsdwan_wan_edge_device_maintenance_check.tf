# Sample data source intersight_catalystsdwan_wan_edge_device_maintenance_check — reads ../models/data_intersight_catalystsdwan_wan_edge_device_maintenance_check.yml
locals { m208 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_wan_edge_device_maintenance_check.yml"))["data_intersight_catalystsdwan_wan_edge_device_maintenance_check"] }

data "intersight_catalystsdwan_wan_edge_device_maintenance_check" "n208" {
  account_moid = try(local.m208["account_moid"], null)
  action = try(local.m208["action"], null)
  additional_properties = try(local.m208["additional_properties"], null)
  class_id = try(local.m208["class_id"], null)
  create_time = try(local.m208["create_time"], null)
  domain_group_moid = try(local.m208["domain_group_moid"], null)
  id = try(local.m208["id"], null)
  mod_time = try(local.m208["mod_time"], null)
  moid = try(local.m208["moid"], null)
  object_type = try(local.m208["object_type"], null)
  owners = try(local.m208["owners"], null)
  results = try(local.m208["results"], null)
  shared_scope = try(local.m208["shared_scope"], null)
  status = try(local.m208["status"], null)
  target_chassis = try(local.m208["target_chassis"], null)
  dynamic "activities" {
    for_each = try(local.m208["activities"], null) == null ? [] : local.m208["activities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m208["ancestors"], null) == null ? [] : local.m208["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m208["parent"], null) == null ? [] : local.m208["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m208["permission_resources"], null) == null ? [] : local.m208["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m208["tags"], null) == null ? [] : local.m208["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m208["user"], null) == null ? [] : local.m208["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m208["version_context"], null) == null ? [] : local.m208["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m208["workflow_info"], null) == null ? [] : local.m208["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
