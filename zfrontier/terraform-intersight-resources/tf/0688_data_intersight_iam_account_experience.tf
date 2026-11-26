# Sample data source intersight_iam_account_experience — reads ../models/data_intersight_iam_account_experience.yml
locals { m688 = yamldecode(file("${path.module}/../models/data_intersight_iam_account_experience.yml"))["data_intersight_iam_account_experience"] }

data "intersight_iam_account_experience" "n688" {
  account_moid = try(local.m688["account_moid"], null)
  additional_properties = try(local.m688["additional_properties"], null)
  class_id = try(local.m688["class_id"], null)
  create_time = try(local.m688["create_time"], null)
  domain_group_moid = try(local.m688["domain_group_moid"], null)
  id = try(local.m688["id"], null)
  mod_time = try(local.m688["mod_time"], null)
  moid = try(local.m688["moid"], null)
  object_type = try(local.m688["object_type"], null)
  owners = try(local.m688["owners"], null)
  results = try(local.m688["results"], null)
  shared_scope = try(local.m688["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m688["account"], null) == null ? [] : local.m688["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m688["ancestors"], null) == null ? [] : local.m688["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "features" {
    for_each = try(local.m688["features"], null) == null ? [] : local.m688["features"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m688["parent"], null) == null ? [] : local.m688["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m688["permission_resources"], null) == null ? [] : local.m688["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m688["tags"], null) == null ? [] : local.m688["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m688["version_context"], null) == null ? [] : local.m688["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
