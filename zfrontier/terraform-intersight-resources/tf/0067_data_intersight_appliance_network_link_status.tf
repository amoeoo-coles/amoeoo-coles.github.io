# Sample data source intersight_appliance_network_link_status — reads ../models/data_intersight_appliance_network_link_status.yml
locals { m067 = yamldecode(file("${path.module}/../models/data_intersight_appliance_network_link_status.yml"))["data_intersight_appliance_network_link_status"] }

data "intersight_appliance_network_link_status" "n067" {
  account_moid = try(local.m067["account_moid"], null)
  additional_properties = try(local.m067["additional_properties"], null)
  class_id = try(local.m067["class_id"], null)
  create_time = try(local.m067["create_time"], null)
  destination_hostname = try(local.m067["destination_hostname"], null)
  domain_group_moid = try(local.m067["domain_group_moid"], null)
  id = try(local.m067["id"], null)
  mod_time = try(local.m067["mod_time"], null)
  moid = try(local.m067["moid"], null)
  object_type = try(local.m067["object_type"], null)
  owners = try(local.m067["owners"], null)
  ping_time = try(local.m067["ping_time"], null)
  results = try(local.m067["results"], null)
  shared_scope = try(local.m067["shared_scope"], null)
  source_hostname = try(local.m067["source_hostname"], null)
  dynamic "ancestors" {
    for_each = try(local.m067["ancestors"], null) == null ? [] : local.m067["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_op_status" {
    for_each = try(local.m067["node_op_status"], null) == null ? [] : local.m067["node_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m067["parent"], null) == null ? [] : local.m067["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m067["permission_resources"], null) == null ? [] : local.m067["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m067["registered_device"], null) == null ? [] : local.m067["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m067["tags"], null) == null ? [] : local.m067["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m067["version_context"], null) == null ? [] : local.m067["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
