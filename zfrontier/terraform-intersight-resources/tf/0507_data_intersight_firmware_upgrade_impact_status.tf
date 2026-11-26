# Sample data source intersight_firmware_upgrade_impact_status — reads ../models/data_intersight_firmware_upgrade_impact_status.yml
locals { m507 = yamldecode(file("${path.module}/../models/data_intersight_firmware_upgrade_impact_status.yml"))["data_intersight_firmware_upgrade_impact_status"] }

data "intersight_firmware_upgrade_impact_status" "n507" {
  account_moid = try(local.m507["account_moid"], null)
  additional_properties = try(local.m507["additional_properties"], null)
  class_id = try(local.m507["class_id"], null)
  components = try(local.m507["components"], null)
  computation_state = try(local.m507["computation_state"], null)
  create_time = try(local.m507["create_time"], null)
  domain_group_moid = try(local.m507["domain_group_moid"], null)
  exclude_components = try(local.m507["exclude_components"], null)
  id = try(local.m507["id"], null)
  mod_time = try(local.m507["mod_time"], null)
  moid = try(local.m507["moid"], null)
  object_type = try(local.m507["object_type"], null)
  owners = try(local.m507["owners"], null)
  results = try(local.m507["results"], null)
  shared_scope = try(local.m507["shared_scope"], null)
  summary = try(local.m507["summary"], null)
  dynamic "ancestors" {
    for_each = try(local.m507["ancestors"], null) == null ? [] : local.m507["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "impacts" {
    for_each = try(local.m507["impacts"], null) == null ? [] : local.m507["impacts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m507["parent"], null) == null ? [] : local.m507["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m507["permission_resources"], null) == null ? [] : local.m507["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m507["tags"], null) == null ? [] : local.m507["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade" {
    for_each = try(local.m507["upgrade"], null) == null ? [] : local.m507["upgrade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m507["version_context"], null) == null ? [] : local.m507["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
