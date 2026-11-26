# Sample data source intersight_vnic_vhba_template — reads ../models/data_intersight_vnic_vhba_template.yml
locals { m1488 = yamldecode(file("${path.module}/../models/data_intersight_vnic_vhba_template.yml"))["data_intersight_vnic_vhba_template"] }

data "intersight_vnic_vhba_template" "n1488" {
  account_moid = try(local.m1488["account_moid"], null)
  additional_properties = try(local.m1488["additional_properties"], null)
  class_id = try(local.m1488["class_id"], null)
  create_time = try(local.m1488["create_time"], null)
  description = try(local.m1488["description"], null)
  domain_group_moid = try(local.m1488["domain_group_moid"], null)
  enable_override = try(local.m1488["enable_override"], null)
  id = try(local.m1488["id"], null)
  mod_time = try(local.m1488["mod_time"], null)
  moid = try(local.m1488["moid"], null)
  name = try(local.m1488["name"], null)
  object_type = try(local.m1488["object_type"], null)
  owners = try(local.m1488["owners"], null)
  peer_vhba_name = try(local.m1488["peer_vhba_name"], null)
  persistent_bindings = try(local.m1488["persistent_bindings"], null)
  pin_group_name = try(local.m1488["pin_group_name"], null)
  results = try(local.m1488["results"], null)
  scp_usage_count = try(local.m1488["scp_usage_count"], null)
  shared_scope = try(local.m1488["shared_scope"], null)
  switch_id = try(local.m1488["switch_id"], null)
  type = try(local.m1488["type"], null)
  update_status = try(local.m1488["update_status"], null)
  usage_count = try(local.m1488["usage_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1488["ancestors"], null) == null ? [] : local.m1488["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_adapter_policy" {
    for_each = try(local.m1488["fc_adapter_policy"], null) == null ? [] : local.m1488["fc_adapter_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_network_policy" {
    for_each = try(local.m1488["fc_network_policy"], null) == null ? [] : local.m1488["fc_network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_qos_policy" {
    for_each = try(local.m1488["fc_qos_policy"], null) == null ? [] : local.m1488["fc_qos_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_zone_policies" {
    for_each = try(local.m1488["fc_zone_policies"], null) == null ? [] : local.m1488["fc_zone_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1488["organization"], null) == null ? [] : local.m1488["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1488["parent"], null) == null ? [] : local.m1488["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1488["permission_resources"], null) == null ? [] : local.m1488["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1488["tags"], null) == null ? [] : local.m1488["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m1488["template_actions"], null) == null ? [] : local.m1488["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1488["version_context"], null) == null ? [] : local.m1488["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wwpn_pool" {
    for_each = try(local.m1488["wwpn_pool"], null) == null ? [] : local.m1488["wwpn_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
