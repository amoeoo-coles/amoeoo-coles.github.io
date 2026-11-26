# Sample data source intersight_network_vpc_domain — reads ../models/data_intersight_network_vpc_domain.yml
locals { m877 = yamldecode(file("${path.module}/../models/data_intersight_network_vpc_domain.yml"))["data_intersight_network_vpc_domain"] }

data "intersight_network_vpc_domain" "n877" {
  account_moid = try(local.m877["account_moid"], null)
  additional_properties = try(local.m877["additional_properties"], null)
  auto_recovery_status = try(local.m877["auto_recovery_status"], null)
  class_id = try(local.m877["class_id"], null)
  consistency_status = try(local.m877["consistency_status"], null)
  create_time = try(local.m877["create_time"], null)
  device_mo_id = try(local.m877["device_mo_id"], null)
  dn = try(local.m877["dn"], null)
  domain_group_moid = try(local.m877["domain_group_moid"], null)
  dual_active_excluded_vlans = try(local.m877["dual_active_excluded_vlans"], null)
  id = try(local.m877["id"], null)
  keep_alive_status = try(local.m877["keep_alive_status"], null)
  mod_time = try(local.m877["mod_time"], null)
  moid = try(local.m877["moid"], null)
  object_type = try(local.m877["object_type"], null)
  owners = try(local.m877["owners"], null)
  peer_status = try(local.m877["peer_status"], null)
  results = try(local.m877["results"], null)
  rn = try(local.m877["rn"], null)
  role = try(local.m877["role"], null)
  shared_scope = try(local.m877["shared_scope"], null)
  vpc_domain_id = try(local.m877["vpc_domain_id"], null)
  vpcs_configured_count = try(local.m877["vpcs_configured_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m877["ancestors"], null) == null ? [] : local.m877["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m877["network_element"], null) == null ? [] : local.m877["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m877["parent"], null) == null ? [] : local.m877["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m877["permission_resources"], null) == null ? [] : local.m877["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m877["registered_device"], null) == null ? [] : local.m877["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m877["tags"], null) == null ? [] : local.m877["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m877["version_context"], null) == null ? [] : local.m877["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
