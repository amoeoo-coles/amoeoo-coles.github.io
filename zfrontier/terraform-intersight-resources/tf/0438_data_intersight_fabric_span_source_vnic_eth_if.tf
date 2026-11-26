# Sample data source intersight_fabric_span_source_vnic_eth_if — reads ../models/data_intersight_fabric_span_source_vnic_eth_if.yml
locals { m438 = yamldecode(file("${path.module}/../models/data_intersight_fabric_span_source_vnic_eth_if.yml"))["data_intersight_fabric_span_source_vnic_eth_if"] }

data "intersight_fabric_span_source_vnic_eth_if" "n438" {
  account_moid = try(local.m438["account_moid"], null)
  additional_properties = try(local.m438["additional_properties"], null)
  class_id = try(local.m438["class_id"], null)
  create_time = try(local.m438["create_time"], null)
  direction = try(local.m438["direction"], null)
  domain_group_moid = try(local.m438["domain_group_moid"], null)
  id = try(local.m438["id"], null)
  mod_time = try(local.m438["mod_time"], null)
  moid = try(local.m438["moid"], null)
  name = try(local.m438["name"], null)
  object_type = try(local.m438["object_type"], null)
  owners = try(local.m438["owners"], null)
  results = try(local.m438["results"], null)
  shared_scope = try(local.m438["shared_scope"], null)
  vif_id = try(local.m438["vif_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m438["ancestors"], null) == null ? [] : local.m438["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m438["parent"], null) == null ? [] : local.m438["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m438["permission_resources"], null) == null ? [] : local.m438["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "span_session" {
    for_each = try(local.m438["span_session"], null) == null ? [] : local.m438["span_session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m438["tags"], null) == null ? [] : local.m438["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m438["version_context"], null) == null ? [] : local.m438["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vnic" {
    for_each = try(local.m438["vnic"], null) == null ? [] : local.m438["vnic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
