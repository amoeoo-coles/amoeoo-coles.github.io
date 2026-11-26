# Sample data source intersight_connectorpack_connector_pack_upgrade — reads ../models/data_intersight_connectorpack_connector_pack_upgrade.yml
locals { m273 = yamldecode(file("${path.module}/../models/data_intersight_connectorpack_connector_pack_upgrade.yml"))["data_intersight_connectorpack_connector_pack_upgrade"] }

data "intersight_connectorpack_connector_pack_upgrade" "n273" {
  account_moid = try(local.m273["account_moid"], null)
  additional_properties = try(local.m273["additional_properties"], null)
  class_id = try(local.m273["class_id"], null)
  connector_pack_op_type = try(local.m273["connector_pack_op_type"], null)
  create_time = try(local.m273["create_time"], null)
  domain_group_moid = try(local.m273["domain_group_moid"], null)
  id = try(local.m273["id"], null)
  mod_time = try(local.m273["mod_time"], null)
  moid = try(local.m273["moid"], null)
  object_type = try(local.m273["object_type"], null)
  owners = try(local.m273["owners"], null)
  results = try(local.m273["results"], null)
  shared_scope = try(local.m273["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m273["ancestors"], null) == null ? [] : local.m273["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m273["parent"], null) == null ? [] : local.m273["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m273["permission_resources"], null) == null ? [] : local.m273["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m273["tags"], null) == null ? [] : local.m273["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ucsd_info" {
    for_each = try(local.m273["ucsd_info"], null) == null ? [] : local.m273["ucsd_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m273["version_context"], null) == null ? [] : local.m273["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m273["workflow"], null) == null ? [] : local.m273["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
