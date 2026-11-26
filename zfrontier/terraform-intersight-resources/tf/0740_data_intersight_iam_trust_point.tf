# Sample data source intersight_iam_trust_point — reads ../models/data_intersight_iam_trust_point.yml
locals { m740 = yamldecode(file("${path.module}/../models/data_intersight_iam_trust_point.yml"))["data_intersight_iam_trust_point"] }

data "intersight_iam_trust_point" "n740" {
  account_moid = try(local.m740["account_moid"], null)
  additional_properties = try(local.m740["additional_properties"], null)
  chain = try(local.m740["chain"], null)
  class_id = try(local.m740["class_id"], null)
  create_time = try(local.m740["create_time"], null)
  domain_group_moid = try(local.m740["domain_group_moid"], null)
  id = try(local.m740["id"], null)
  mod_time = try(local.m740["mod_time"], null)
  moid = try(local.m740["moid"], null)
  object_type = try(local.m740["object_type"], null)
  owners = try(local.m740["owners"], null)
  results = try(local.m740["results"], null)
  shared_scope = try(local.m740["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m740["account"], null) == null ? [] : local.m740["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m740["ancestors"], null) == null ? [] : local.m740["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m740["assigned_to_entity"], null) == null ? [] : local.m740["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificates" {
    for_each = try(local.m740["certificates"], null) == null ? [] : local.m740["certificates"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m740["parent"], null) == null ? [] : local.m740["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m740["permission_resources"], null) == null ? [] : local.m740["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m740["tags"], null) == null ? [] : local.m740["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m740["version_context"], null) == null ? [] : local.m740["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
