# Sample data source intersight_network_feature_control — reads ../models/data_intersight_network_feature_control.yml
locals { m866 = yamldecode(file("${path.module}/../models/data_intersight_network_feature_control.yml"))["data_intersight_network_feature_control"] }

data "intersight_network_feature_control" "n866" {
  account_moid = try(local.m866["account_moid"], null)
  additional_properties = try(local.m866["additional_properties"], null)
  admin_state = try(local.m866["admin_state"], null)
  class_id = try(local.m866["class_id"], null)
  create_time = try(local.m866["create_time"], null)
  device_mo_id = try(local.m866["device_mo_id"], null)
  dn = try(local.m866["dn"], null)
  domain_group_moid = try(local.m866["domain_group_moid"], null)
  id = try(local.m866["id"], null)
  instance = try(local.m866["instance"], null)
  mod_time = try(local.m866["mod_time"], null)
  moid = try(local.m866["moid"], null)
  name = try(local.m866["name"], null)
  object_type = try(local.m866["object_type"], null)
  operational_state = try(local.m866["operational_state"], null)
  owners = try(local.m866["owners"], null)
  results = try(local.m866["results"], null)
  rn = try(local.m866["rn"], null)
  shared_scope = try(local.m866["shared_scope"], null)
  status_msg = try(local.m866["status_msg"], null)
  dynamic "ancestors" {
    for_each = try(local.m866["ancestors"], null) == null ? [] : local.m866["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m866["network_element"], null) == null ? [] : local.m866["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m866["parent"], null) == null ? [] : local.m866["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m866["permission_resources"], null) == null ? [] : local.m866["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m866["registered_device"], null) == null ? [] : local.m866["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m866["tags"], null) == null ? [] : local.m866["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m866["version_context"], null) == null ? [] : local.m866["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
