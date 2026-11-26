# Sample data source intersight_certificatemanagement_policy — reads ../models/data_intersight_certificatemanagement_policy.yml
locals { m210 = yamldecode(file("${path.module}/../models/data_intersight_certificatemanagement_policy.yml"))["data_intersight_certificatemanagement_policy"] }

data "intersight_certificatemanagement_policy" "n210" {
  account_moid = try(local.m210["account_moid"], null)
  additional_properties = try(local.m210["additional_properties"], null)
  class_id = try(local.m210["class_id"], null)
  create_time = try(local.m210["create_time"], null)
  description = try(local.m210["description"], null)
  domain_group_moid = try(local.m210["domain_group_moid"], null)
  id = try(local.m210["id"], null)
  mod_time = try(local.m210["mod_time"], null)
  moid = try(local.m210["moid"], null)
  name = try(local.m210["name"], null)
  object_type = try(local.m210["object_type"], null)
  owners = try(local.m210["owners"], null)
  results = try(local.m210["results"], null)
  shared_scope = try(local.m210["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m210["ancestors"], null) == null ? [] : local.m210["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificates" {
    for_each = try(local.m210["certificates"], null) == null ? [] : local.m210["certificates"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m210["organization"], null) == null ? [] : local.m210["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m210["parent"], null) == null ? [] : local.m210["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m210["permission_resources"], null) == null ? [] : local.m210["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m210["profiles"], null) == null ? [] : local.m210["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m210["tags"], null) == null ? [] : local.m210["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m210["version_context"], null) == null ? [] : local.m210["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
