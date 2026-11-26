# Sample data source intersight_adapter_config_policy — reads ../models/data_intersight_adapter_config_policy.yml
locals { m010 = yamldecode(file("${path.module}/../models/data_intersight_adapter_config_policy.yml"))["data_intersight_adapter_config_policy"] }

data "intersight_adapter_config_policy" "n010" {
  account_moid = try(local.m010["account_moid"], null)
  additional_properties = try(local.m010["additional_properties"], null)
  class_id = try(local.m010["class_id"], null)
  create_time = try(local.m010["create_time"], null)
  description = try(local.m010["description"], null)
  domain_group_moid = try(local.m010["domain_group_moid"], null)
  id = try(local.m010["id"], null)
  mod_time = try(local.m010["mod_time"], null)
  moid = try(local.m010["moid"], null)
  name = try(local.m010["name"], null)
  object_type = try(local.m010["object_type"], null)
  owners = try(local.m010["owners"], null)
  results = try(local.m010["results"], null)
  shared_scope = try(local.m010["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m010["ancestors"], null) == null ? [] : local.m010["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m010["organization"], null) == null ? [] : local.m010["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m010["parent"], null) == null ? [] : local.m010["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m010["permission_resources"], null) == null ? [] : local.m010["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m010["profiles"], null) == null ? [] : local.m010["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "settings" {
    for_each = try(local.m010["settings"], null) == null ? [] : local.m010["settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m010["tags"], null) == null ? [] : local.m010["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m010["version_context"], null) == null ? [] : local.m010["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
