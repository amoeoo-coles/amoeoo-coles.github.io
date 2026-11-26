# Sample data source intersight_management_entity — reads ../models/data_intersight_management_entity.yml
locals { m819 = yamldecode(file("${path.module}/../models/data_intersight_management_entity.yml"))["data_intersight_management_entity"] }

data "intersight_management_entity" "n819" {
  account_moid = try(local.m819["account_moid"], null)
  additional_properties = try(local.m819["additional_properties"], null)
  class_id = try(local.m819["class_id"], null)
  cluster_link_state = try(local.m819["cluster_link_state"], null)
  cluster_readiness = try(local.m819["cluster_readiness"], null)
  cluster_state = try(local.m819["cluster_state"], null)
  create_time = try(local.m819["create_time"], null)
  device_mo_id = try(local.m819["device_mo_id"], null)
  dn = try(local.m819["dn"], null)
  domain_group_moid = try(local.m819["domain_group_moid"], null)
  entity_id = try(local.m819["entity_id"], null)
  id = try(local.m819["id"], null)
  leadership = try(local.m819["leadership"], null)
  mod_time = try(local.m819["mod_time"], null)
  moid = try(local.m819["moid"], null)
  object_type = try(local.m819["object_type"], null)
  owners = try(local.m819["owners"], null)
  results = try(local.m819["results"], null)
  rn = try(local.m819["rn"], null)
  shared_scope = try(local.m819["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m819["ancestors"], null) == null ? [] : local.m819["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m819["inventory_device_info"], null) == null ? [] : local.m819["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m819["network_element"], null) == null ? [] : local.m819["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m819["parent"], null) == null ? [] : local.m819["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m819["permission_resources"], null) == null ? [] : local.m819["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m819["registered_device"], null) == null ? [] : local.m819["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m819["tags"], null) == null ? [] : local.m819["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m819["version_context"], null) == null ? [] : local.m819["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
