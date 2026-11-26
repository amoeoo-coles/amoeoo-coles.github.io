# Sample data source intersight_iam_user_group_membership — reads ../models/data_intersight_iam_user_group_membership.yml
locals { m743 = yamldecode(file("${path.module}/../models/data_intersight_iam_user_group_membership.yml"))["data_intersight_iam_user_group_membership"] }

data "intersight_iam_user_group_membership" "n743" {
  account_moid = try(local.m743["account_moid"], null)
  additional_properties = try(local.m743["additional_properties"], null)
  class_id = try(local.m743["class_id"], null)
  create_time = try(local.m743["create_time"], null)
  domain_group_moid = try(local.m743["domain_group_moid"], null)
  expiration_time = try(local.m743["expiration_time"], null)
  id = try(local.m743["id"], null)
  last_validated_time = try(local.m743["last_validated_time"], null)
  mod_time = try(local.m743["mod_time"], null)
  moid = try(local.m743["moid"], null)
  object_type = try(local.m743["object_type"], null)
  owners = try(local.m743["owners"], null)
  results = try(local.m743["results"], null)
  shared_scope = try(local.m743["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m743["ancestors"], null) == null ? [] : local.m743["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m743["parent"], null) == null ? [] : local.m743["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m743["permission_resources"], null) == null ? [] : local.m743["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m743["tags"], null) == null ? [] : local.m743["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m743["user"], null) == null ? [] : local.m743["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_group" {
    for_each = try(local.m743["user_group"], null) == null ? [] : local.m743["user_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m743["version_context"], null) == null ? [] : local.m743["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
