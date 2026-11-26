# Sample data source intersight_appliance_file_system_op_summary — reads ../models/data_intersight_appliance_file_system_op_summary.yml
locals { m056 = yamldecode(file("${path.module}/../models/data_intersight_appliance_file_system_op_summary.yml"))["data_intersight_appliance_file_system_op_summary"] }

data "intersight_appliance_file_system_op_summary" "n056" {
  account_moid = try(local.m056["account_moid"], null)
  additional_properties = try(local.m056["additional_properties"], null)
  class_id = try(local.m056["class_id"], null)
  create_time = try(local.m056["create_time"], null)
  domain_group_moid = try(local.m056["domain_group_moid"], null)
  id = try(local.m056["id"], null)
  mod_time = try(local.m056["mod_time"], null)
  moid = try(local.m056["moid"], null)
  object_type = try(local.m056["object_type"], null)
  owners = try(local.m056["owners"], null)
  results = try(local.m056["results"], null)
  shared_scope = try(local.m056["shared_scope"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m056["alarm_summary"], null) == null ? [] : local.m056["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m056["ancestors"], null) == null ? [] : local.m056["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_op_status" {
    for_each = try(local.m056["node_op_status"], null) == null ? [] : local.m056["node_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m056["parent"], null) == null ? [] : local.m056["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m056["permission_resources"], null) == null ? [] : local.m056["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m056["tags"], null) == null ? [] : local.m056["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m056["version_context"], null) == null ? [] : local.m056["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
