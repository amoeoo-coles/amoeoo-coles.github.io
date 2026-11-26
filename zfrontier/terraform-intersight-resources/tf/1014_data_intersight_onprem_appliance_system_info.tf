# Sample data source intersight_onprem_appliance_system_info — reads ../models/data_intersight_onprem_appliance_system_info.yml
locals { m1014 = yamldecode(file("${path.module}/../models/data_intersight_onprem_appliance_system_info.yml"))["data_intersight_onprem_appliance_system_info"] }

data "intersight_onprem_appliance_system_info" "n1014" {
  account_moid = try(local.m1014["account_moid"], null)
  additional_properties = try(local.m1014["additional_properties"], null)
  class_id = try(local.m1014["class_id"], null)
  create_time = try(local.m1014["create_time"], null)
  deployment_size = try(local.m1014["deployment_size"], null)
  domain_group_moid = try(local.m1014["domain_group_moid"], null)
  hostname = try(local.m1014["hostname"], null)
  id = try(local.m1014["id"], null)
  mod_time = try(local.m1014["mod_time"], null)
  moid = try(local.m1014["moid"], null)
  node_id = try(local.m1014["node_id"], null)
  node_type = try(local.m1014["node_type"], null)
  nr_version = try(local.m1014["nr_version"], null)
  object_type = try(local.m1014["object_type"], null)
  operational_status = try(local.m1014["operational_status"], null)
  owners = try(local.m1014["owners"], null)
  results = try(local.m1014["results"], null)
  serial_id = try(local.m1014["serial_id"], null)
  shared_scope = try(local.m1014["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1014["ancestors"], null) == null ? [] : local.m1014["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_ip_v4_config" {
    for_each = try(local.m1014["node_ip_v4_config"], null) == null ? [] : local.m1014["node_ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_ip_v6_config" {
    for_each = try(local.m1014["node_ip_v6_config"], null) == null ? [] : local.m1014["node_ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1014["parent"], null) == null ? [] : local.m1014["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1014["permission_resources"], null) == null ? [] : local.m1014["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1014["tags"], null) == null ? [] : local.m1014["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1014["version_context"], null) == null ? [] : local.m1014["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
