# Sample data source intersight_softwarerepository_authorization — reads ../models/data_intersight_softwarerepository_authorization.yml
locals { m1199 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_authorization.yml"))["data_intersight_softwarerepository_authorization"] }

data "intersight_softwarerepository_authorization" "n1199" {
  account_moid = try(local.m1199["account_moid"], null)
  additional_properties = try(local.m1199["additional_properties"], null)
  class_id = try(local.m1199["class_id"], null)
  create_time = try(local.m1199["create_time"], null)
  domain_group_moid = try(local.m1199["domain_group_moid"], null)
  id = try(local.m1199["id"], null)
  is_asdv4_alarm_dismissed = try(local.m1199["is_asdv4_alarm_dismissed"], null)
  is_password_set = try(var.secrets["data_intersight_softwarerepository_authorization.is_password_set"], local.m1199["is_password_set"])
  mod_time = try(local.m1199["mod_time"], null)
  moid = try(local.m1199["moid"], null)
  nr_version = try(local.m1199["nr_version"], null)
  object_type = try(local.m1199["object_type"], null)
  owners = try(local.m1199["owners"], null)
  password = try(var.secrets["data_intersight_softwarerepository_authorization.password"], local.m1199["password"])
  repository_type = try(local.m1199["repository_type"], null)
  results = try(local.m1199["results"], null)
  shared_scope = try(local.m1199["shared_scope"], null)
  user_id = try(local.m1199["user_id"], null)
  dynamic "account" {
    for_each = try(local.m1199["account"], null) == null ? [] : local.m1199["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1199["ancestors"], null) == null ? [] : local.m1199["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1199["parent"], null) == null ? [] : local.m1199["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1199["permission_resources"], null) == null ? [] : local.m1199["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1199["tags"], null) == null ? [] : local.m1199["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1199["version_context"], null) == null ? [] : local.m1199["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
