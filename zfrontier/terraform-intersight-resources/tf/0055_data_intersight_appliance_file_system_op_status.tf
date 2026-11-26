# Sample data source intersight_appliance_file_system_op_status — reads ../models/data_intersight_appliance_file_system_op_status.yml
locals { m055 = yamldecode(file("${path.module}/../models/data_intersight_appliance_file_system_op_status.yml"))["data_intersight_appliance_file_system_op_status"] }

data "intersight_appliance_file_system_op_status" "n055" {
  account_moid = try(local.m055["account_moid"], null)
  additional_properties = try(local.m055["additional_properties"], null)
  capacity = try(local.m055["capacity"], null)
  class_id = try(local.m055["class_id"], null)
  create_time = try(local.m055["create_time"], null)
  disk_order = try(local.m055["disk_order"], null)
  domain_group_moid = try(local.m055["domain_group_moid"], null)
  id = try(local.m055["id"], null)
  mod_time = try(local.m055["mod_time"], null)
  moid = try(local.m055["moid"], null)
  mountpoint = try(local.m055["mountpoint"], null)
  node_hostname = try(local.m055["node_hostname"], null)
  object_type = try(local.m055["object_type"], null)
  operational_status = try(local.m055["operational_status"], null)
  owners = try(local.m055["owners"], null)
  results = try(local.m055["results"], null)
  shared_scope = try(local.m055["shared_scope"], null)
  usage = try(local.m055["usage"], null)
  dynamic "ancestors" {
    for_each = try(local.m055["ancestors"], null) == null ? [] : local.m055["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_system_op_summary" {
    for_each = try(local.m055["file_system_op_summary"], null) == null ? [] : local.m055["file_system_op_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_op_status" {
    for_each = try(local.m055["node_op_status"], null) == null ? [] : local.m055["node_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m055["parent"], null) == null ? [] : local.m055["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m055["permission_resources"], null) == null ? [] : local.m055["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m055["registered_device"], null) == null ? [] : local.m055["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m055["tags"], null) == null ? [] : local.m055["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m055["version_context"], null) == null ? [] : local.m055["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
