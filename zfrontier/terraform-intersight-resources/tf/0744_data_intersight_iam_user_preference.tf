# Sample data source intersight_iam_user_preference — reads ../models/data_intersight_iam_user_preference.yml
locals { m744 = yamldecode(file("${path.module}/../models/data_intersight_iam_user_preference.yml"))["data_intersight_iam_user_preference"] }

data "intersight_iam_user_preference" "n744" {
  account_moid = try(local.m744["account_moid"], null)
  additional_properties = try(local.m744["additional_properties"], null)
  class_id = try(local.m744["class_id"], null)
  create_time = try(local.m744["create_time"], null)
  domain_group_moid = try(local.m744["domain_group_moid"], null)
  id = try(local.m744["id"], null)
  mod_time = try(local.m744["mod_time"], null)
  moid = try(local.m744["moid"], null)
  object_type = try(local.m744["object_type"], null)
  owners = try(local.m744["owners"], null)
  preference = try(local.m744["preference"], null)
  results = try(local.m744["results"], null)
  shared_scope = try(local.m744["shared_scope"], null)
  user_unique_identifier = try(local.m744["user_unique_identifier"], null)
  dynamic "ancestors" {
    for_each = try(local.m744["ancestors"], null) == null ? [] : local.m744["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m744["idp"], null) == null ? [] : local.m744["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp_reference" {
    for_each = try(local.m744["idp_reference"], null) == null ? [] : local.m744["idp_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m744["parent"], null) == null ? [] : local.m744["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m744["permission_resources"], null) == null ? [] : local.m744["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m744["tags"], null) == null ? [] : local.m744["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m744["version_context"], null) == null ? [] : local.m744["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
