# Sample data source intersight_appliance_node_info — reads ../models/data_intersight_appliance_node_info.yml
locals { m068 = yamldecode(file("${path.module}/../models/data_intersight_appliance_node_info.yml"))["data_intersight_appliance_node_info"] }

data "intersight_appliance_node_info" "n068" {
  account_moid = try(local.m068["account_moid"], null)
  additional_properties = try(local.m068["additional_properties"], null)
  class_id = try(local.m068["class_id"], null)
  create_time = try(local.m068["create_time"], null)
  deployment_size = try(local.m068["deployment_size"], null)
  domain_group_moid = try(local.m068["domain_group_moid"], null)
  hostname = try(local.m068["hostname"], null)
  id = try(local.m068["id"], null)
  mod_time = try(local.m068["mod_time"], null)
  moid = try(local.m068["moid"], null)
  node_id = try(local.m068["node_id"], null)
  node_type = try(local.m068["node_type"], null)
  object_type = try(local.m068["object_type"], null)
  operational_status = try(local.m068["operational_status"], null)
  owners = try(local.m068["owners"], null)
  results = try(local.m068["results"], null)
  shared_scope = try(local.m068["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m068["ancestors"], null) == null ? [] : local.m068["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_ip_v4_config" {
    for_each = try(local.m068["node_ip_v4_config"], null) == null ? [] : local.m068["node_ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_ip_v6_config" {
    for_each = try(local.m068["node_ip_v6_config"], null) == null ? [] : local.m068["node_ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m068["parent"], null) == null ? [] : local.m068["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m068["permission_resources"], null) == null ? [] : local.m068["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m068["tags"], null) == null ? [] : local.m068["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m068["version_context"], null) == null ? [] : local.m068["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
