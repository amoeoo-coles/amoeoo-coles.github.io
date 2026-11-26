# Sample data source intersight_iam_user_setting — reads ../models/data_intersight_iam_user_setting.yml
locals { m746 = yamldecode(file("${path.module}/../models/data_intersight_iam_user_setting.yml"))["data_intersight_iam_user_setting"] }

data "intersight_iam_user_setting" "n746" {
  account_moid = try(local.m746["account_moid"], null)
  additional_properties = try(local.m746["additional_properties"], null)
  allow_ui_session_recording = try(local.m746["allow_ui_session_recording"], null)
  class_id = try(local.m746["class_id"], null)
  create_time = try(local.m746["create_time"], null)
  domain_group_moid = try(local.m746["domain_group_moid"], null)
  id = try(local.m746["id"], null)
  mod_time = try(local.m746["mod_time"], null)
  moid = try(local.m746["moid"], null)
  object_type = try(local.m746["object_type"], null)
  owners = try(local.m746["owners"], null)
  results = try(local.m746["results"], null)
  shared_scope = try(local.m746["shared_scope"], null)
  user_id_or_email = try(local.m746["user_id_or_email"], null)
  user_unique_identifier = try(local.m746["user_unique_identifier"], null)
  dynamic "ancestors" {
    for_each = try(local.m746["ancestors"], null) == null ? [] : local.m746["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "default_permission" {
    for_each = try(local.m746["default_permission"], null) == null ? [] : local.m746["default_permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m746["idp"], null) == null ? [] : local.m746["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp_reference" {
    for_each = try(local.m746["idp_reference"], null) == null ? [] : local.m746["idp_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m746["parent"], null) == null ? [] : local.m746["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m746["permission_resources"], null) == null ? [] : local.m746["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m746["tags"], null) == null ? [] : local.m746["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m746["version_context"], null) == null ? [] : local.m746["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
