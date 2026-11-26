# Sample data source intersight_vnic_fc_if — reads ../models/data_intersight_vnic_fc_if.yml
locals { m1464 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_if.yml"))["data_intersight_vnic_fc_if"] }

data "intersight_vnic_fc_if" "n1464" {
  account_moid = try(local.m1464["account_moid"], null)
  additional_properties = try(local.m1464["additional_properties"], null)
  class_id = try(local.m1464["class_id"], null)
  create_time = try(local.m1464["create_time"], null)
  domain_group_moid = try(local.m1464["domain_group_moid"], null)
  id = try(local.m1464["id"], null)
  mod_time = try(local.m1464["mod_time"], null)
  moid = try(local.m1464["moid"], null)
  name = try(local.m1464["name"], null)
  object_type = try(local.m1464["object_type"], null)
  order = try(local.m1464["order"], null)
  overridden_list = try(local.m1464["overridden_list"], null)
  owners = try(local.m1464["owners"], null)
  persistent_bindings = try(local.m1464["persistent_bindings"], null)
  pin_group_name = try(local.m1464["pin_group_name"], null)
  results = try(local.m1464["results"], null)
  shared_scope = try(local.m1464["shared_scope"], null)
  stale = try(local.m1464["stale"], null)
  static_wwpn_address = try(local.m1464["static_wwpn_address"], null)
  template_sync_status = try(local.m1464["template_sync_status"], null)
  type = try(local.m1464["type"], null)
  vif_id = try(local.m1464["vif_id"], null)
  wwpn = try(local.m1464["wwpn"], null)
  wwpn_address_type = try(local.m1464["wwpn_address_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1464["ancestors"], null) == null ? [] : local.m1464["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_adapter_policy" {
    for_each = try(local.m1464["fc_adapter_policy"], null) == null ? [] : local.m1464["fc_adapter_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_network_policy" {
    for_each = try(local.m1464["fc_network_policy"], null) == null ? [] : local.m1464["fc_network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_qos_policy" {
    for_each = try(local.m1464["fc_qos_policy"], null) == null ? [] : local.m1464["fc_qos_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_zone_policies" {
    for_each = try(local.m1464["fc_zone_policies"], null) == null ? [] : local.m1464["fc_zone_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "old_info" {
    for_each = try(local.m1464["old_info"], null) == null ? [] : local.m1464["old_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1464["parent"], null) == null ? [] : local.m1464["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1464["permission_resources"], null) == null ? [] : local.m1464["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "placement" {
    for_each = try(local.m1464["placement"], null) == null ? [] : local.m1464["placement"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1464["profile"], null) == null ? [] : local.m1464["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "san_connectivity_policy" {
    for_each = try(local.m1464["san_connectivity_policy"], null) == null ? [] : local.m1464["san_connectivity_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scp_vhba" {
    for_each = try(local.m1464["scp_vhba"], null) == null ? [] : local.m1464["scp_vhba"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sp_vhbas" {
    for_each = try(local.m1464["sp_vhbas"], null) == null ? [] : local.m1464["sp_vhbas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m1464["src_template"], null) == null ? [] : local.m1464["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1464["tags"], null) == null ? [] : local.m1464["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m1464["template_actions"], null) == null ? [] : local.m1464["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_sync_errors" {
    for_each = try(local.m1464["template_sync_errors"], null) == null ? [] : local.m1464["template_sync_errors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1464["version_context"], null) == null ? [] : local.m1464["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wwpn_lease" {
    for_each = try(local.m1464["wwpn_lease"], null) == null ? [] : local.m1464["wwpn_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wwpn_pool" {
    for_each = try(local.m1464["wwpn_pool"], null) == null ? [] : local.m1464["wwpn_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
