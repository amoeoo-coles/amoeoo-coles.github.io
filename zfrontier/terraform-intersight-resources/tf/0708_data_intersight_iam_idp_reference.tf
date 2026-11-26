# Sample data source intersight_iam_idp_reference — reads ../models/data_intersight_iam_idp_reference.yml
locals { m708 = yamldecode(file("${path.module}/../models/data_intersight_iam_idp_reference.yml"))["data_intersight_iam_idp_reference"] }

data "intersight_iam_idp_reference" "n708" {
  account_moid = try(local.m708["account_moid"], null)
  additional_properties = try(local.m708["additional_properties"], null)
  class_id = try(local.m708["class_id"], null)
  create_time = try(local.m708["create_time"], null)
  domain_group_moid = try(local.m708["domain_group_moid"], null)
  domain_name = try(local.m708["domain_name"], null)
  id = try(local.m708["id"], null)
  idp_entity_id = try(local.m708["idp_entity_id"], null)
  mod_time = try(local.m708["mod_time"], null)
  moid = try(local.m708["moid"], null)
  multi_factor_authentication = try(local.m708["multi_factor_authentication"], null)
  name = try(local.m708["name"], null)
  object_type = try(local.m708["object_type"], null)
  owners = try(local.m708["owners"], null)
  results = try(local.m708["results"], null)
  shared_scope = try(local.m708["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m708["account"], null) == null ? [] : local.m708["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m708["ancestors"], null) == null ? [] : local.m708["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m708["idp"], null) == null ? [] : local.m708["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m708["parent"], null) == null ? [] : local.m708["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m708["permission_resources"], null) == null ? [] : local.m708["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m708["tags"], null) == null ? [] : local.m708["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_preferences" {
    for_each = try(local.m708["user_preferences"], null) == null ? [] : local.m708["user_preferences"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_settings" {
    for_each = try(local.m708["user_settings"], null) == null ? [] : local.m708["user_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usergroups" {
    for_each = try(local.m708["usergroups"], null) == null ? [] : local.m708["usergroups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "users" {
    for_each = try(local.m708["users"], null) == null ? [] : local.m708["users"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m708["version_context"], null) == null ? [] : local.m708["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
