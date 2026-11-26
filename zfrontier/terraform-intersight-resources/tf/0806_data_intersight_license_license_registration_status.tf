# Sample data source intersight_license_license_registration_status — reads ../models/data_intersight_license_license_registration_status.yml
locals { m806 = yamldecode(file("${path.module}/../models/data_intersight_license_license_registration_status.yml"))["data_intersight_license_license_registration_status"] }

data "intersight_license_license_registration_status" "n806" {
  account_creation_state = try(local.m806["account_creation_state"], null)
  account_moid = try(local.m806["account_moid"], null)
  additional_properties = try(local.m806["additional_properties"], null)
  class_id = try(local.m806["class_id"], null)
  create_time = try(local.m806["create_time"], null)
  domain_group_moid = try(local.m806["domain_group_moid"], null)
  id = try(local.m806["id"], null)
  is_new_account = try(local.m806["is_new_account"], null)
  license_registration_state = try(local.m806["license_registration_state"], null)
  mod_time = try(local.m806["mod_time"], null)
  moid = try(local.m806["moid"], null)
  object_type = try(local.m806["object_type"], null)
  owners = try(local.m806["owners"], null)
  results = try(local.m806["results"], null)
  shared_scope = try(local.m806["shared_scope"], null)
  trial_registration_complete = try(local.m806["trial_registration_complete"], null)
  dynamic "account_license_data" {
    for_each = try(local.m806["account_license_data"], null) == null ? [] : local.m806["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m806["ancestors"], null) == null ? [] : local.m806["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m806["parent"], null) == null ? [] : local.m806["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m806["permission_resources"], null) == null ? [] : local.m806["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m806["tags"], null) == null ? [] : local.m806["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m806["version_context"], null) == null ? [] : local.m806["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
