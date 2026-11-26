# Sample data source intersight_license_inc_customer_op — reads ../models/data_intersight_license_inc_customer_op.yml
locals { m800 = yamldecode(file("${path.module}/../models/data_intersight_license_inc_customer_op.yml"))["data_intersight_license_inc_customer_op"] }

data "intersight_license_inc_customer_op" "n800" {
  account_moid = try(local.m800["account_moid"], null)
  active_admin = try(local.m800["active_admin"], null)
  additional_properties = try(local.m800["additional_properties"], null)
  class_id = try(local.m800["class_id"], null)
  create_time = try(local.m800["create_time"], null)
  domain_group_moid = try(local.m800["domain_group_moid"], null)
  enable_trial = try(local.m800["enable_trial"], null)
  evaluation_period = try(local.m800["evaluation_period"], null)
  extra_evaluation = try(local.m800["extra_evaluation"], null)
  id = try(local.m800["id"], null)
  mod_time = try(local.m800["mod_time"], null)
  moid = try(local.m800["moid"], null)
  object_type = try(local.m800["object_type"], null)
  owners = try(local.m800["owners"], null)
  results = try(local.m800["results"], null)
  shared_scope = try(local.m800["shared_scope"], null)
  terminate_trial = try(local.m800["terminate_trial"], null)
  dynamic "account_license_data" {
    for_each = try(local.m800["account_license_data"], null) == null ? [] : local.m800["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m800["ancestors"], null) == null ? [] : local.m800["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m800["parent"], null) == null ? [] : local.m800["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m800["permission_resources"], null) == null ? [] : local.m800["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m800["tags"], null) == null ? [] : local.m800["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m800["version_context"], null) == null ? [] : local.m800["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
