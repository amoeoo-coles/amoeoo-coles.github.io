# Sample data source intersight_onprem_user_preference — reads ../models/data_intersight_onprem_user_preference.yml
locals { m1017 = yamldecode(file("${path.module}/../models/data_intersight_onprem_user_preference.yml"))["data_intersight_onprem_user_preference"] }

data "intersight_onprem_user_preference" "n1017" {
  account_moid = try(local.m1017["account_moid"], null)
  additional_properties = try(local.m1017["additional_properties"], null)
  class_id = try(local.m1017["class_id"], null)
  create_time = try(local.m1017["create_time"], null)
  domain_group_moid = try(local.m1017["domain_group_moid"], null)
  id = try(local.m1017["id"], null)
  mod_time = try(local.m1017["mod_time"], null)
  moid = try(local.m1017["moid"], null)
  object_type = try(local.m1017["object_type"], null)
  owners = try(local.m1017["owners"], null)
  preference = try(local.m1017["preference"], null)
  results = try(local.m1017["results"], null)
  shared_scope = try(local.m1017["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1017["ancestors"], null) == null ? [] : local.m1017["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1017["parent"], null) == null ? [] : local.m1017["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1017["permission_resources"], null) == null ? [] : local.m1017["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1017["tags"], null) == null ? [] : local.m1017["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1017["version_context"], null) == null ? [] : local.m1017["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
