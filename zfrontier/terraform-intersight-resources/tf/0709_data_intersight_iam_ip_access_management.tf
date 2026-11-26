# Sample data source intersight_iam_ip_access_management — reads ../models/data_intersight_iam_ip_access_management.yml
locals { m709 = yamldecode(file("${path.module}/../models/data_intersight_iam_ip_access_management.yml"))["data_intersight_iam_ip_access_management"] }

data "intersight_iam_ip_access_management" "n709" {
  account_moid = try(local.m709["account_moid"], null)
  additional_properties = try(local.m709["additional_properties"], null)
  class_id = try(local.m709["class_id"], null)
  create_time = try(local.m709["create_time"], null)
  domain_group_moid = try(local.m709["domain_group_moid"], null)
  enable = try(local.m709["enable"], null)
  id = try(local.m709["id"], null)
  last_recovery_time = try(local.m709["last_recovery_time"], null)
  mod_time = try(local.m709["mod_time"], null)
  moid = try(local.m709["moid"], null)
  object_type = try(local.m709["object_type"], null)
  owners = try(local.m709["owners"], null)
  results = try(local.m709["results"], null)
  shared_scope = try(local.m709["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m709["ancestors"], null) == null ? [] : local.m709["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "holder" {
    for_each = try(local.m709["holder"], null) == null ? [] : local.m709["holder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_addresses" {
    for_each = try(local.m709["ip_addresses"], null) == null ? [] : local.m709["ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m709["parent"], null) == null ? [] : local.m709["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m709["permission_resources"], null) == null ? [] : local.m709["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m709["tags"], null) == null ? [] : local.m709["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m709["version_context"], null) == null ? [] : local.m709["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
