# Sample data source intersight_iam_security_holder — reads ../models/data_intersight_iam_security_holder.yml
locals { m733 = yamldecode(file("${path.module}/../models/data_intersight_iam_security_holder.yml"))["data_intersight_iam_security_holder"] }

data "intersight_iam_security_holder" "n733" {
  account_moid = try(local.m733["account_moid"], null)
  additional_properties = try(local.m733["additional_properties"], null)
  class_id = try(local.m733["class_id"], null)
  create_time = try(local.m733["create_time"], null)
  domain_group_moid = try(local.m733["domain_group_moid"], null)
  id = try(local.m733["id"], null)
  mod_time = try(local.m733["mod_time"], null)
  moid = try(local.m733["moid"], null)
  object_type = try(local.m733["object_type"], null)
  owners = try(local.m733["owners"], null)
  results = try(local.m733["results"], null)
  shared_scope = try(local.m733["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m733["account"], null) == null ? [] : local.m733["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m733["ancestors"], null) == null ? [] : local.m733["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_rules_configuration" {
    for_each = try(local.m733["ip_rules_configuration"], null) == null ? [] : local.m733["ip_rules_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m733["parent"], null) == null ? [] : local.m733["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m733["permission_resources"], null) == null ? [] : local.m733["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_permissions" {
    for_each = try(local.m733["resource_permissions"], null) == null ? [] : local.m733["resource_permissions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m733["tags"], null) == null ? [] : local.m733["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m733["version_context"], null) == null ? [] : local.m733["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
