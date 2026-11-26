# Sample data source intersight_iam_end_point_user — reads ../models/data_intersight_iam_end_point_user.yml
locals { m700 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_user.yml"))["data_intersight_iam_end_point_user"] }

data "intersight_iam_end_point_user" "n700" {
  account_moid = try(local.m700["account_moid"], null)
  additional_properties = try(local.m700["additional_properties"], null)
  class_id = try(local.m700["class_id"], null)
  create_time = try(local.m700["create_time"], null)
  domain_group_moid = try(local.m700["domain_group_moid"], null)
  id = try(local.m700["id"], null)
  mod_time = try(local.m700["mod_time"], null)
  moid = try(local.m700["moid"], null)
  name = try(local.m700["name"], null)
  object_type = try(local.m700["object_type"], null)
  owners = try(local.m700["owners"], null)
  results = try(local.m700["results"], null)
  shared_scope = try(local.m700["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m700["ancestors"], null) == null ? [] : local.m700["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user_role" {
    for_each = try(local.m700["end_point_user_role"], null) == null ? [] : local.m700["end_point_user_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m700["organization"], null) == null ? [] : local.m700["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m700["parent"], null) == null ? [] : local.m700["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m700["permission_resources"], null) == null ? [] : local.m700["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m700["tags"], null) == null ? [] : local.m700["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m700["version_context"], null) == null ? [] : local.m700["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
