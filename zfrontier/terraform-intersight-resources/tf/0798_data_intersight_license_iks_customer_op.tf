# Sample data source intersight_license_iks_customer_op — reads ../models/data_intersight_license_iks_customer_op.yml
locals { m798 = yamldecode(file("${path.module}/../models/data_intersight_license_iks_customer_op.yml"))["data_intersight_license_iks_customer_op"] }

data "intersight_license_iks_customer_op" "n798" {
  account_moid = try(local.m798["account_moid"], null)
  active_admin = try(local.m798["active_admin"], null)
  additional_properties = try(local.m798["additional_properties"], null)
  class_id = try(local.m798["class_id"], null)
  create_time = try(local.m798["create_time"], null)
  domain_group_moid = try(local.m798["domain_group_moid"], null)
  enable_trial = try(local.m798["enable_trial"], null)
  evaluation_period = try(local.m798["evaluation_period"], null)
  extra_evaluation = try(local.m798["extra_evaluation"], null)
  id = try(local.m798["id"], null)
  mod_time = try(local.m798["mod_time"], null)
  moid = try(local.m798["moid"], null)
  object_type = try(local.m798["object_type"], null)
  owners = try(local.m798["owners"], null)
  results = try(local.m798["results"], null)
  shared_scope = try(local.m798["shared_scope"], null)
  dynamic "account_license_data" {
    for_each = try(local.m798["account_license_data"], null) == null ? [] : local.m798["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m798["ancestors"], null) == null ? [] : local.m798["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m798["parent"], null) == null ? [] : local.m798["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m798["permission_resources"], null) == null ? [] : local.m798["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m798["tags"], null) == null ? [] : local.m798["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m798["version_context"], null) == null ? [] : local.m798["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
