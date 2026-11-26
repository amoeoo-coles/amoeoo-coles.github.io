# Sample data source intersight_connectorpack_upgrade_impact — reads ../models/data_intersight_connectorpack_upgrade_impact.yml
locals { m274 = yamldecode(file("${path.module}/../models/data_intersight_connectorpack_upgrade_impact.yml"))["data_intersight_connectorpack_upgrade_impact"] }

data "intersight_connectorpack_upgrade_impact" "n274" {
  account_moid = try(local.m274["account_moid"], null)
  additional_properties = try(local.m274["additional_properties"], null)
  class_id = try(local.m274["class_id"], null)
  create_time = try(local.m274["create_time"], null)
  domain_group_moid = try(local.m274["domain_group_moid"], null)
  id = try(local.m274["id"], null)
  is_eligible_for_upgrade = try(local.m274["is_eligible_for_upgrade"], null)
  is_update_downloaded = try(local.m274["is_update_downloaded"], null)
  mod_time = try(local.m274["mod_time"], null)
  moid = try(local.m274["moid"], null)
  object_type = try(local.m274["object_type"], null)
  owners = try(local.m274["owners"], null)
  results = try(local.m274["results"], null)
  shared_scope = try(local.m274["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m274["ancestors"], null) == null ? [] : local.m274["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "connector_pack" {
    for_each = try(local.m274["connector_pack"], null) == null ? [] : local.m274["connector_pack"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m274["parent"], null) == null ? [] : local.m274["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m274["permission_resources"], null) == null ? [] : local.m274["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m274["tags"], null) == null ? [] : local.m274["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ucsd_info" {
    for_each = try(local.m274["ucsd_info"], null) == null ? [] : local.m274["ucsd_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m274["version_context"], null) == null ? [] : local.m274["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
