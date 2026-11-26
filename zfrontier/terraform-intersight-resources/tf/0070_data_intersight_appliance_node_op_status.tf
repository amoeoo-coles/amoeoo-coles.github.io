# Sample data source intersight_appliance_node_op_status — reads ../models/data_intersight_appliance_node_op_status.yml
locals { m070 = yamldecode(file("${path.module}/../models/data_intersight_appliance_node_op_status.yml"))["data_intersight_appliance_node_op_status"] }

data "intersight_appliance_node_op_status" "n070" {
  account_moid = try(local.m070["account_moid"], null)
  additional_properties = try(local.m070["additional_properties"], null)
  class_id = try(local.m070["class_id"], null)
  cpu_usage = try(local.m070["cpu_usage"], null)
  create_time = try(local.m070["create_time"], null)
  deployment_size = try(local.m070["deployment_size"], null)
  domain_group_moid = try(local.m070["domain_group_moid"], null)
  id = try(local.m070["id"], null)
  mem_usage = try(local.m070["mem_usage"], null)
  mod_time = try(local.m070["mod_time"], null)
  moid = try(local.m070["moid"], null)
  node_hostname = try(local.m070["node_hostname"], null)
  node_id = try(local.m070["node_id"], null)
  node_state = try(local.m070["node_state"], null)
  object_type = try(local.m070["object_type"], null)
  operational_status = try(local.m070["operational_status"], null)
  owners = try(local.m070["owners"], null)
  results = try(local.m070["results"], null)
  shared_scope = try(local.m070["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m070["account"], null) == null ? [] : local.m070["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m070["ancestors"], null) == null ? [] : local.m070["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_network_status" {
    for_each = try(local.m070["cluster_network_status"], null) == null ? [] : local.m070["cluster_network_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_system_op_statuses" {
    for_each = try(local.m070["file_system_op_statuses"], null) == null ? [] : local.m070["file_system_op_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_system_op_summary" {
    for_each = try(local.m070["file_system_op_summary"], null) == null ? [] : local.m070["file_system_op_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_link_statuses" {
    for_each = try(local.m070["network_link_statuses"], null) == null ? [] : local.m070["network_link_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_info" {
    for_each = try(local.m070["node_info"], null) == null ? [] : local.m070["node_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m070["parent"], null) == null ? [] : local.m070["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m070["permission_resources"], null) == null ? [] : local.m070["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m070["registered_device"], null) == null ? [] : local.m070["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_op_status" {
    for_each = try(local.m070["system_op_status"], null) == null ? [] : local.m070["system_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m070["tags"], null) == null ? [] : local.m070["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m070["version_context"], null) == null ? [] : local.m070["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
