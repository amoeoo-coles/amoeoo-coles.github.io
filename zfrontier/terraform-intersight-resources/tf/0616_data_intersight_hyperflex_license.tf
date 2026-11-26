# Sample data source intersight_hyperflex_license — reads ../models/data_intersight_hyperflex_license.yml
locals { m616 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_license.yml"))["data_intersight_hyperflex_license"] }

data "intersight_hyperflex_license" "n616" {
  account_moid = try(local.m616["account_moid"], null)
  additional_properties = try(local.m616["additional_properties"], null)
  class_id = try(local.m616["class_id"], null)
  compliance_state = try(local.m616["compliance_state"], null)
  create_time = try(local.m616["create_time"], null)
  domain_group_moid = try(local.m616["domain_group_moid"], null)
  get_out_of_compliance_start_at = try(local.m616["get_out_of_compliance_start_at"], null)
  id = try(local.m616["id"], null)
  in_evaluation = try(local.m616["in_evaluation"], null)
  license_type = try(local.m616["license_type"], null)
  mod_time = try(local.m616["mod_time"], null)
  moid = try(local.m616["moid"], null)
  object_type = try(local.m616["object_type"], null)
  owners = try(local.m616["owners"], null)
  plr_enabled = try(local.m616["plr_enabled"], null)
  results = try(local.m616["results"], null)
  shared_scope = try(local.m616["shared_scope"], null)
  smart_licensing_enabled = try(local.m616["smart_licensing_enabled"], null)
  dynamic "ancestors" {
    for_each = try(local.m616["ancestors"], null) == null ? [] : local.m616["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m616["cluster"], null) == null ? [] : local.m616["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_authorization" {
    for_each = try(local.m616["license_authorization"], null) == null ? [] : local.m616["license_authorization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_registration" {
    for_each = try(local.m616["license_registration"], null) == null ? [] : local.m616["license_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m616["parent"], null) == null ? [] : local.m616["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m616["permission_resources"], null) == null ? [] : local.m616["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m616["registered_device"], null) == null ? [] : local.m616["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m616["tags"], null) == null ? [] : local.m616["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m616["version_context"], null) == null ? [] : local.m616["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
