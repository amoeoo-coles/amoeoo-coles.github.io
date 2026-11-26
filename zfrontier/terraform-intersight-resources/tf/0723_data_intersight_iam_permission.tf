# Sample data source intersight_iam_permission — reads ../models/data_intersight_iam_permission.yml
locals { m723 = yamldecode(file("${path.module}/../models/data_intersight_iam_permission.yml"))["data_intersight_iam_permission"] }

data "intersight_iam_permission" "n723" {
  account_moid = try(local.m723["account_moid"], null)
  additional_properties = try(local.m723["additional_properties"], null)
  class_id = try(local.m723["class_id"], null)
  create_time = try(local.m723["create_time"], null)
  description = try(local.m723["description"], null)
  domain_group_moid = try(local.m723["domain_group_moid"], null)
  id = try(local.m723["id"], null)
  mod_time = try(local.m723["mod_time"], null)
  moid = try(local.m723["moid"], null)
  name = try(local.m723["name"], null)
  object_type = try(local.m723["object_type"], null)
  owners = try(local.m723["owners"], null)
  results = try(local.m723["results"], null)
  shared_scope = try(local.m723["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m723["account"], null) == null ? [] : local.m723["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m723["ancestors"], null) == null ? [] : local.m723["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_roles" {
    for_each = try(local.m723["end_point_roles"], null) == null ? [] : local.m723["end_point_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m723["parent"], null) == null ? [] : local.m723["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m723["permission_resources"], null) == null ? [] : local.m723["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privilege_sets" {
    for_each = try(local.m723["privilege_sets"], null) == null ? [] : local.m723["privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_roles" {
    for_each = try(local.m723["resource_roles"], null) == null ? [] : local.m723["resource_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "roles" {
    for_each = try(local.m723["roles"], null) == null ? [] : local.m723["roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "session_limits" {
    for_each = try(local.m723["session_limits"], null) == null ? [] : local.m723["session_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m723["tags"], null) == null ? [] : local.m723["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_groups" {
    for_each = try(local.m723["user_groups"], null) == null ? [] : local.m723["user_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "users" {
    for_each = try(local.m723["users"], null) == null ? [] : local.m723["users"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m723["version_context"], null) == null ? [] : local.m723["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
