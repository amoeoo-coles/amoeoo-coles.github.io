# Sample data source intersight_iam_test_idp_configuration — reads ../models/data_intersight_iam_test_idp_configuration.yml
locals { m739 = yamldecode(file("${path.module}/../models/data_intersight_iam_test_idp_configuration.yml"))["data_intersight_iam_test_idp_configuration"] }

data "intersight_iam_test_idp_configuration" "n739" {
  account_moid = try(local.m739["account_moid"], null)
  additional_properties = try(local.m739["additional_properties"], null)
  class_id = try(local.m739["class_id"], null)
  create_time = try(local.m739["create_time"], null)
  domain_group_moid = try(local.m739["domain_group_moid"], null)
  error_details = try(local.m739["error_details"], null)
  id = try(local.m739["id"], null)
  idp_entity_id = try(local.m739["idp_entity_id"], null)
  is_password_set = try(var.secrets["data_intersight_iam_test_idp_configuration.is_password_set"], local.m739["is_password_set"])
  mod_time = try(local.m739["mod_time"], null)
  moid = try(local.m739["moid"], null)
  no_of_groups = try(local.m739["no_of_groups"], null)
  object_type = try(local.m739["object_type"], null)
  owners = try(local.m739["owners"], null)
  password = try(var.secrets["data_intersight_iam_test_idp_configuration.password"], local.m739["password"])
  results = try(local.m739["results"], null)
  shared_scope = try(local.m739["shared_scope"], null)
  status = try(local.m739["status"], null)
  trigger_test = try(local.m739["trigger_test"], null)
  username = try(local.m739["username"], null)
  dynamic "ancestors" {
    for_each = try(local.m739["ancestors"], null) == null ? [] : local.m739["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m739["idp"], null) == null ? [] : local.m739["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m739["parent"], null) == null ? [] : local.m739["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m739["permission_resources"], null) == null ? [] : local.m739["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m739["tags"], null) == null ? [] : local.m739["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m739["version_context"], null) == null ? [] : local.m739["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
