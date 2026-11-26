# Sample data source intersight_deviceconnector_policy — reads ../models/data_intersight_deviceconnector_policy.yml
locals { m287 = yamldecode(file("${path.module}/../models/data_intersight_deviceconnector_policy.yml"))["data_intersight_deviceconnector_policy"] }

data "intersight_deviceconnector_policy" "n287" {
  account_moid = try(local.m287["account_moid"], null)
  additional_properties = try(local.m287["additional_properties"], null)
  class_id = try(local.m287["class_id"], null)
  create_time = try(local.m287["create_time"], null)
  description = try(local.m287["description"], null)
  domain_group_moid = try(local.m287["domain_group_moid"], null)
  id = try(local.m287["id"], null)
  lockout_enabled = try(local.m287["lockout_enabled"], null)
  mod_time = try(local.m287["mod_time"], null)
  moid = try(local.m287["moid"], null)
  name = try(local.m287["name"], null)
  object_type = try(local.m287["object_type"], null)
  owners = try(local.m287["owners"], null)
  results = try(local.m287["results"], null)
  shared_scope = try(local.m287["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m287["ancestors"], null) == null ? [] : local.m287["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m287["organization"], null) == null ? [] : local.m287["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m287["parent"], null) == null ? [] : local.m287["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m287["permission_resources"], null) == null ? [] : local.m287["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m287["profiles"], null) == null ? [] : local.m287["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m287["tags"], null) == null ? [] : local.m287["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m287["version_context"], null) == null ? [] : local.m287["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
