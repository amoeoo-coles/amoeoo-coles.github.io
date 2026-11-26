# Sample data source intersight_appliance_system_op_status — reads ../models/data_intersight_appliance_system_op_status.yml
locals { m078 = yamldecode(file("${path.module}/../models/data_intersight_appliance_system_op_status.yml"))["data_intersight_appliance_system_op_status"] }

data "intersight_appliance_system_op_status" "n078" {
  account_moid = try(local.m078["account_moid"], null)
  additional_properties = try(local.m078["additional_properties"], null)
  class_id = try(local.m078["class_id"], null)
  create_time = try(local.m078["create_time"], null)
  domain_group_moid = try(local.m078["domain_group_moid"], null)
  id = try(local.m078["id"], null)
  mod_time = try(local.m078["mod_time"], null)
  moid = try(local.m078["moid"], null)
  object_type = try(local.m078["object_type"], null)
  operational_status = try(local.m078["operational_status"], null)
  owners = try(local.m078["owners"], null)
  results = try(local.m078["results"], null)
  shared_scope = try(local.m078["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m078["account"], null) == null ? [] : local.m078["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m078["ancestors"], null) == null ? [] : local.m078["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_op_statuses" {
    for_each = try(local.m078["app_op_statuses"], null) == null ? [] : local.m078["app_op_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "group_op_statuses" {
    for_each = try(local.m078["group_op_statuses"], null) == null ? [] : local.m078["group_op_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m078["parent"], null) == null ? [] : local.m078["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m078["permission_resources"], null) == null ? [] : local.m078["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m078["registered_device"], null) == null ? [] : local.m078["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_info" {
    for_each = try(local.m078["system_info"], null) == null ? [] : local.m078["system_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m078["tags"], null) == null ? [] : local.m078["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m078["version_context"], null) == null ? [] : local.m078["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
