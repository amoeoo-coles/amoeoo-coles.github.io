# Sample data source intersight_asset_target — reads ../models/data_intersight_asset_target.yml
locals { m101 = yamldecode(file("${path.module}/../models/data_intersight_asset_target.yml"))["data_intersight_asset_target"] }

data "intersight_asset_target" "n101" {
  account_moid = try(local.m101["account_moid"], null)
  additional_properties = try(local.m101["additional_properties"], null)
  claimed_by_user_name = try(local.m101["claimed_by_user_name"], null)
  claimed_time = try(local.m101["claimed_time"], null)
  class_id = try(local.m101["class_id"], null)
  connector_version = try(local.m101["connector_version"], null)
  create_time = try(local.m101["create_time"], null)
  domain_group_moid = try(local.m101["domain_group_moid"], null)
  external_ip_address = try(local.m101["external_ip_address"], null)
  id = try(local.m101["id"], null)
  ip_address = try(local.m101["ip_address"], null)
  management_location = try(local.m101["management_location"], null)
  mod_time = try(local.m101["mod_time"], null)
  moid = try(local.m101["moid"], null)
  name = try(local.m101["name"], null)
  object_type = try(local.m101["object_type"], null)
  owners = try(local.m101["owners"], null)
  product_id = try(local.m101["product_id"], null)
  read_only = try(local.m101["read_only"], null)
  results = try(local.m101["results"], null)
  shared_scope = try(local.m101["shared_scope"], null)
  status = try(local.m101["status"], null)
  status_error_reason = try(local.m101["status_error_reason"], null)
  target_id = try(local.m101["target_id"], null)
  target_type = try(local.m101["target_type"], null)
  vendor = try(local.m101["vendor"], null)
  dynamic "account" {
    for_each = try(local.m101["account"], null) == null ? [] : local.m101["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "alarm_summary" {
    for_each = try(local.m101["alarm_summary"], null) == null ? [] : local.m101["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m101["ancestors"], null) == null ? [] : local.m101["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_location" {
    for_each = try(local.m101["assigned_location"], null) == null ? [] : local.m101["assigned_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assist" {
    for_each = try(local.m101["assist"], null) == null ? [] : local.m101["assist"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "connections" {
    for_each = try(local.m101["connections"], null) == null ? [] : local.m101["connections"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m101["custom_permission_resources"], null) == null ? [] : local.m101["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m101["parent"], null) == null ? [] : local.m101["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m101["permission_resources"], null) == null ? [] : local.m101["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m101["registered_device"], null) == null ? [] : local.m101["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m101["reservation"], null) == null ? [] : local.m101["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "services" {
    for_each = try(local.m101["services"], null) == null ? [] : local.m101["services"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m101["tags"], null) == null ? [] : local.m101["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "trust_point" {
    for_each = try(local.m101["trust_point"], null) == null ? [] : local.m101["trust_point"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m101["version_context"], null) == null ? [] : local.m101["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m101["workflow_info"], null) == null ? [] : local.m101["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
