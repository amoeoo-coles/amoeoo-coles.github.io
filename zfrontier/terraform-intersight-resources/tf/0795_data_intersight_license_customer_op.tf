# Sample data source intersight_license_customer_op — reads ../models/data_intersight_license_customer_op.yml
locals { m795 = yamldecode(file("${path.module}/../models/data_intersight_license_customer_op.yml"))["data_intersight_license_customer_op"] }

data "intersight_license_customer_op" "n795" {
  account_moid = try(local.m795["account_moid"], null)
  active_admin = try(local.m795["active_admin"], null)
  additional_properties = try(local.m795["additional_properties"], null)
  all_devices_to_default_tier = try(local.m795["all_devices_to_default_tier"], null)
  class_id = try(local.m795["class_id"], null)
  clear_api_sync_status = try(local.m795["clear_api_sync_status"], null)
  create_time = try(local.m795["create_time"], null)
  deregister_device = try(local.m795["deregister_device"], null)
  domain_group_moid = try(local.m795["domain_group_moid"], null)
  enable_trial = try(local.m795["enable_trial"], null)
  evaluation_period = try(local.m795["evaluation_period"], null)
  extra_evaluation = try(local.m795["extra_evaluation"], null)
  id = try(local.m795["id"], null)
  mod_time = try(local.m795["mod_time"], null)
  moid = try(local.m795["moid"], null)
  object_type = try(local.m795["object_type"], null)
  owners = try(local.m795["owners"], null)
  renew_authorization = try(local.m795["renew_authorization"], null)
  renew_id_certificate = try(local.m795["renew_id_certificate"], null)
  results = try(local.m795["results"], null)
  shared_scope = try(local.m795["shared_scope"], null)
  show_agent_tech_support = try(local.m795["show_agent_tech_support"], null)
  dynamic "account_license_data" {
    for_each = try(local.m795["account_license_data"], null) == null ? [] : local.m795["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m795["ancestors"], null) == null ? [] : local.m795["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m795["parent"], null) == null ? [] : local.m795["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m795["permission_resources"], null) == null ? [] : local.m795["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m795["tags"], null) == null ? [] : local.m795["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m795["version_context"], null) == null ? [] : local.m795["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
