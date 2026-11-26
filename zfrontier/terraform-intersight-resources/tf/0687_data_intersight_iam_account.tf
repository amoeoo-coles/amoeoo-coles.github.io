# Sample data source intersight_iam_account — reads ../models/data_intersight_iam_account.yml
locals { m687 = yamldecode(file("${path.module}/../models/data_intersight_iam_account.yml"))["data_intersight_iam_account"] }

data "intersight_iam_account" "n687" {
  account_moid = try(local.m687["account_moid"], null)
  additional_properties = try(local.m687["additional_properties"], null)
  class_id = try(local.m687["class_id"], null)
  create_time = try(local.m687["create_time"], null)
  domain_group_moid = try(local.m687["domain_group_moid"], null)
  external_identifier = try(local.m687["external_identifier"], null)
  id = try(local.m687["id"], null)
  mod_time = try(local.m687["mod_time"], null)
  moid = try(local.m687["moid"], null)
  name = try(local.m687["name"], null)
  object_type = try(local.m687["object_type"], null)
  owners = try(local.m687["owners"], null)
  regions = try(local.m687["regions"], null)
  results = try(local.m687["results"], null)
  shared_scope = try(local.m687["shared_scope"], null)
  single_admin_lockout = try(local.m687["single_admin_lockout"], null)
  status = try(local.m687["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m687["ancestors"], null) == null ? [] : local.m687["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_registrations" {
    for_each = try(local.m687["app_registrations"], null) == null ? [] : local.m687["app_registrations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "domain_groups" {
    for_each = try(local.m687["domain_groups"], null) == null ? [] : local.m687["domain_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_roles" {
    for_each = try(local.m687["end_point_roles"], null) == null ? [] : local.m687["end_point_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idpreferences" {
    for_each = try(local.m687["idpreferences"], null) == null ? [] : local.m687["idpreferences"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idps" {
    for_each = try(local.m687["idps"], null) == null ? [] : local.m687["idps"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m687["parent"], null) == null ? [] : local.m687["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m687["permission_resources"], null) == null ? [] : local.m687["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permissions" {
    for_each = try(local.m687["permissions"], null) == null ? [] : local.m687["permissions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privilege_sets" {
    for_each = try(local.m687["privilege_sets"], null) == null ? [] : local.m687["privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privileges" {
    for_each = try(local.m687["privileges"], null) == null ? [] : local.m687["privileges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_limits" {
    for_each = try(local.m687["resource_limits"], null) == null ? [] : local.m687["resource_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "roles" {
    for_each = try(local.m687["roles"], null) == null ? [] : local.m687["roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "security_holder" {
    for_each = try(local.m687["security_holder"], null) == null ? [] : local.m687["security_holder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "session_limits" {
    for_each = try(local.m687["session_limits"], null) == null ? [] : local.m687["session_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m687["tags"], null) == null ? [] : local.m687["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m687["version_context"], null) == null ? [] : local.m687["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
