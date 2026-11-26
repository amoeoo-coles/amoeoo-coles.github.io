# Sample data source intersight_hyperflex_auto_support_policy — reads ../models/data_intersight_hyperflex_auto_support_policy.yml
locals { m579 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_auto_support_policy.yml"))["data_intersight_hyperflex_auto_support_policy"] }

data "intersight_hyperflex_auto_support_policy" "n579" {
  account_moid = try(local.m579["account_moid"], null)
  additional_properties = try(local.m579["additional_properties"], null)
  admin_state = try(local.m579["admin_state"], null)
  class_id = try(local.m579["class_id"], null)
  create_time = try(local.m579["create_time"], null)
  description = try(local.m579["description"], null)
  domain_group_moid = try(local.m579["domain_group_moid"], null)
  id = try(local.m579["id"], null)
  mod_time = try(local.m579["mod_time"], null)
  moid = try(local.m579["moid"], null)
  name = try(local.m579["name"], null)
  object_type = try(local.m579["object_type"], null)
  owners = try(local.m579["owners"], null)
  results = try(local.m579["results"], null)
  service_ticket_receipient = try(local.m579["service_ticket_receipient"], null)
  shared_scope = try(local.m579["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m579["ancestors"], null) == null ? [] : local.m579["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m579["cluster_profiles"], null) == null ? [] : local.m579["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m579["organization"], null) == null ? [] : local.m579["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m579["parent"], null) == null ? [] : local.m579["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m579["permission_resources"], null) == null ? [] : local.m579["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m579["tags"], null) == null ? [] : local.m579["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m579["version_context"], null) == null ? [] : local.m579["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
