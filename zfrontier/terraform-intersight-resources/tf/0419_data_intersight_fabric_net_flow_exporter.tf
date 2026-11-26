# Sample data source intersight_fabric_net_flow_exporter — reads ../models/data_intersight_fabric_net_flow_exporter.yml
locals { m419 = yamldecode(file("${path.module}/../models/data_intersight_fabric_net_flow_exporter.yml"))["data_intersight_fabric_net_flow_exporter"] }

data "intersight_fabric_net_flow_exporter" "n419" {
  account_moid = try(local.m419["account_moid"], null)
  additional_properties = try(local.m419["additional_properties"], null)
  class_id = try(local.m419["class_id"], null)
  create_time = try(local.m419["create_time"], null)
  destination = try(local.m419["destination"], null)
  domain_group_moid = try(local.m419["domain_group_moid"], null)
  dscp = try(local.m419["dscp"], null)
  gateway_ip = try(local.m419["gateway_ip"], null)
  id = try(local.m419["id"], null)
  mod_time = try(local.m419["mod_time"], null)
  moid = try(local.m419["moid"], null)
  name = try(local.m419["name"], null)
  nr_version = try(local.m419["nr_version"], null)
  object_type = try(local.m419["object_type"], null)
  option_exporter_stats_timeout = try(local.m419["option_exporter_stats_timeout"], null)
  option_interface_table_timeout = try(local.m419["option_interface_table_timeout"], null)
  owners = try(local.m419["owners"], null)
  results = try(local.m419["results"], null)
  shared_scope = try(local.m419["shared_scope"], null)
  template_data_timeout = try(local.m419["template_data_timeout"], null)
  udp_port = try(local.m419["udp_port"], null)
  dynamic "ancestors" {
    for_each = try(local.m419["ancestors"], null) == null ? [] : local.m419["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_flow_policy" {
    for_each = try(local.m419["net_flow_policy"], null) == null ? [] : local.m419["net_flow_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "netflow_monitors" {
    for_each = try(local.m419["netflow_monitors"], null) == null ? [] : local.m419["netflow_monitors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m419["parent"], null) == null ? [] : local.m419["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m419["permission_resources"], null) == null ? [] : local.m419["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "source_interface" {
    for_each = try(local.m419["source_interface"], null) == null ? [] : local.m419["source_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m419["tags"], null) == null ? [] : local.m419["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m419["version_context"], null) == null ? [] : local.m419["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
