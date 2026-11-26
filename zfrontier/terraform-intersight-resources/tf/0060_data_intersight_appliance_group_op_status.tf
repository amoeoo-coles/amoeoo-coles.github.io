# Sample data source intersight_appliance_group_op_status — reads ../models/data_intersight_appliance_group_op_status.yml
locals { m060 = yamldecode(file("${path.module}/../models/data_intersight_appliance_group_op_status.yml"))["data_intersight_appliance_group_op_status"] }

data "intersight_appliance_group_op_status" "n060" {
  account_moid = try(local.m060["account_moid"], null)
  additional_properties = try(local.m060["additional_properties"], null)
  class_id = try(local.m060["class_id"], null)
  create_time = try(local.m060["create_time"], null)
  description = try(local.m060["description"], null)
  domain_group_moid = try(local.m060["domain_group_moid"], null)
  group_name = try(local.m060["group_name"], null)
  id = try(local.m060["id"], null)
  mod_time = try(local.m060["mod_time"], null)
  moid = try(local.m060["moid"], null)
  object_type = try(local.m060["object_type"], null)
  overall_status = try(local.m060["overall_status"], null)
  owners = try(local.m060["owners"], null)
  results = try(local.m060["results"], null)
  shared_scope = try(local.m060["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m060["ancestors"], null) == null ? [] : local.m060["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "apps" {
    for_each = try(local.m060["apps"], null) == null ? [] : local.m060["apps"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m060["parent"], null) == null ? [] : local.m060["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m060["permission_resources"], null) == null ? [] : local.m060["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_op_status" {
    for_each = try(local.m060["system_op_status"], null) == null ? [] : local.m060["system_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m060["tags"], null) == null ? [] : local.m060["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m060["version_context"], null) == null ? [] : local.m060["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
