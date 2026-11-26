# Sample data source intersight_license_erp_customer_op — reads ../models/data_intersight_license_erp_customer_op.yml
locals { m796 = yamldecode(file("${path.module}/../models/data_intersight_license_erp_customer_op.yml"))["data_intersight_license_erp_customer_op"] }

data "intersight_license_erp_customer_op" "n796" {
  account_moid = try(local.m796["account_moid"], null)
  active_admin = try(local.m796["active_admin"], null)
  additional_properties = try(local.m796["additional_properties"], null)
  class_id = try(local.m796["class_id"], null)
  create_time = try(local.m796["create_time"], null)
  domain_group_moid = try(local.m796["domain_group_moid"], null)
  enable_trial = try(local.m796["enable_trial"], null)
  evaluation_period = try(local.m796["evaluation_period"], null)
  extra_evaluation = try(local.m796["extra_evaluation"], null)
  id = try(local.m796["id"], null)
  mod_time = try(local.m796["mod_time"], null)
  moid = try(local.m796["moid"], null)
  object_type = try(local.m796["object_type"], null)
  owners = try(local.m796["owners"], null)
  results = try(local.m796["results"], null)
  shared_scope = try(local.m796["shared_scope"], null)
  dynamic "account_license_data" {
    for_each = try(local.m796["account_license_data"], null) == null ? [] : local.m796["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m796["ancestors"], null) == null ? [] : local.m796["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m796["parent"], null) == null ? [] : local.m796["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m796["permission_resources"], null) == null ? [] : local.m796["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m796["tags"], null) == null ? [] : local.m796["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m796["version_context"], null) == null ? [] : local.m796["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
