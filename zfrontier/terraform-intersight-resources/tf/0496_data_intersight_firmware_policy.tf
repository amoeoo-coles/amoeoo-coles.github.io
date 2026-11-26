# Sample data source intersight_firmware_policy — reads ../models/data_intersight_firmware_policy.yml
locals { m496 = yamldecode(file("${path.module}/../models/data_intersight_firmware_policy.yml"))["data_intersight_firmware_policy"] }

data "intersight_firmware_policy" "n496" {
  account_moid = try(local.m496["account_moid"], null)
  additional_properties = try(local.m496["additional_properties"], null)
  class_id = try(local.m496["class_id"], null)
  create_time = try(local.m496["create_time"], null)
  description = try(local.m496["description"], null)
  domain_group_moid = try(local.m496["domain_group_moid"], null)
  exclude_component_list = try(local.m496["exclude_component_list"], null)
  id = try(local.m496["id"], null)
  mod_time = try(local.m496["mod_time"], null)
  moid = try(local.m496["moid"], null)
  name = try(local.m496["name"], null)
  object_type = try(local.m496["object_type"], null)
  owners = try(local.m496["owners"], null)
  results = try(local.m496["results"], null)
  shared_scope = try(local.m496["shared_scope"], null)
  target_platform = try(local.m496["target_platform"], null)
  dynamic "ancestors" {
    for_each = try(local.m496["ancestors"], null) == null ? [] : local.m496["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "model_bundle_combo" {
    for_each = try(local.m496["model_bundle_combo"], null) == null ? [] : local.m496["model_bundle_combo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m496["organization"], null) == null ? [] : local.m496["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m496["parent"], null) == null ? [] : local.m496["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m496["permission_resources"], null) == null ? [] : local.m496["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m496["profiles"], null) == null ? [] : local.m496["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m496["tags"], null) == null ? [] : local.m496["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m496["version_context"], null) == null ? [] : local.m496["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
