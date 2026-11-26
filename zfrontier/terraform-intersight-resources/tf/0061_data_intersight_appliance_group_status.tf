# Sample data source intersight_appliance_group_status — reads ../models/data_intersight_appliance_group_status.yml
locals { m061 = yamldecode(file("${path.module}/../models/data_intersight_appliance_group_status.yml"))["data_intersight_appliance_group_status"] }

data "intersight_appliance_group_status" "n061" {
  account_moid = try(local.m061["account_moid"], null)
  additional_properties = try(local.m061["additional_properties"], null)
  class_id = try(local.m061["class_id"], null)
  create_time = try(local.m061["create_time"], null)
  description = try(local.m061["description"], null)
  domain_group_moid = try(local.m061["domain_group_moid"], null)
  group_name = try(local.m061["group_name"], null)
  id = try(local.m061["id"], null)
  mod_time = try(local.m061["mod_time"], null)
  moid = try(local.m061["moid"], null)
  object_type = try(local.m061["object_type"], null)
  overall_status = try(local.m061["overall_status"], null)
  owners = try(local.m061["owners"], null)
  results = try(local.m061["results"], null)
  shared_scope = try(local.m061["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m061["ancestors"], null) == null ? [] : local.m061["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "apps" {
    for_each = try(local.m061["apps"], null) == null ? [] : local.m061["apps"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m061["parent"], null) == null ? [] : local.m061["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m061["permission_resources"], null) == null ? [] : local.m061["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_status" {
    for_each = try(local.m061["system_status"], null) == null ? [] : local.m061["system_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m061["tags"], null) == null ? [] : local.m061["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m061["version_context"], null) == null ? [] : local.m061["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
