# Sample data source intersight_iam_private_key_spec — reads ../models/data_intersight_iam_private_key_spec.yml
locals { m724 = yamldecode(file("${path.module}/../models/data_intersight_iam_private_key_spec.yml"))["data_intersight_iam_private_key_spec"] }

data "intersight_iam_private_key_spec" "n724" {
  account_moid = try(local.m724["account_moid"], null)
  additional_properties = try(local.m724["additional_properties"], null)
  class_id = try(local.m724["class_id"], null)
  create_time = try(local.m724["create_time"], null)
  domain_group_moid = try(local.m724["domain_group_moid"], null)
  id = try(local.m724["id"], null)
  mod_time = try(local.m724["mod_time"], null)
  moid = try(local.m724["moid"], null)
  object_type = try(local.m724["object_type"], null)
  owners = try(local.m724["owners"], null)
  results = try(local.m724["results"], null)
  shared_scope = try(local.m724["shared_scope"], null)
  dynamic "algorithm" {
    for_each = try(local.m724["algorithm"], null) == null ? [] : local.m724["algorithm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m724["ancestors"], null) == null ? [] : local.m724["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate_request" {
    for_each = try(local.m724["certificate_request"], null) == null ? [] : local.m724["certificate_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m724["parent"], null) == null ? [] : local.m724["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m724["permission_resources"], null) == null ? [] : local.m724["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m724["tags"], null) == null ? [] : local.m724["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m724["version_context"], null) == null ? [] : local.m724["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
