# Sample data source intersight_license_iwo_customer_op — reads ../models/data_intersight_license_iwo_customer_op.yml
locals { m802 = yamldecode(file("${path.module}/../models/data_intersight_license_iwo_customer_op.yml"))["data_intersight_license_iwo_customer_op"] }

data "intersight_license_iwo_customer_op" "n802" {
  account_moid = try(local.m802["account_moid"], null)
  active_admin = try(local.m802["active_admin"], null)
  active_license_type = try(local.m802["active_license_type"], null)
  additional_properties = try(local.m802["additional_properties"], null)
  class_id = try(local.m802["class_id"], null)
  create_time = try(local.m802["create_time"], null)
  domain_group_moid = try(local.m802["domain_group_moid"], null)
  enable_trial = try(local.m802["enable_trial"], null)
  evaluation_period = try(local.m802["evaluation_period"], null)
  extra_evaluation = try(local.m802["extra_evaluation"], null)
  id = try(local.m802["id"], null)
  mod_time = try(local.m802["mod_time"], null)
  moid = try(local.m802["moid"], null)
  object_type = try(local.m802["object_type"], null)
  owners = try(local.m802["owners"], null)
  results = try(local.m802["results"], null)
  shared_scope = try(local.m802["shared_scope"], null)
  dynamic "account_license_data" {
    for_each = try(local.m802["account_license_data"], null) == null ? [] : local.m802["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m802["ancestors"], null) == null ? [] : local.m802["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m802["parent"], null) == null ? [] : local.m802["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m802["permission_resources"], null) == null ? [] : local.m802["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m802["tags"], null) == null ? [] : local.m802["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m802["version_context"], null) == null ? [] : local.m802["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
