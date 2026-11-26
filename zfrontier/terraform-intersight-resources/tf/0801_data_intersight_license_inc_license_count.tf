# Sample data source intersight_license_inc_license_count — reads ../models/data_intersight_license_inc_license_count.yml
locals { m801 = yamldecode(file("${path.module}/../models/data_intersight_license_inc_license_count.yml"))["data_intersight_license_inc_license_count"] }

data "intersight_license_inc_license_count" "n801" {
  account_moid = try(local.m801["account_moid"], null)
  additional_properties = try(local.m801["additional_properties"], null)
  class_id = try(local.m801["class_id"], null)
  create_time = try(local.m801["create_time"], null)
  domain_group_moid = try(local.m801["domain_group_moid"], null)
  id = try(local.m801["id"], null)
  mod_time = try(local.m801["mod_time"], null)
  moid = try(local.m801["moid"], null)
  object_type = try(local.m801["object_type"], null)
  owners = try(local.m801["owners"], null)
  premier100_gfx_count = try(local.m801["premier100_gfx_count"], null)
  premier10_gfx_count = try(local.m801["premier10_gfx_count"], null)
  premier1_gfx_count = try(local.m801["premier1_gfx_count"], null)
  premier_centralized_mod8_slot_count = try(local.m801["premier_centralized_mod8_slot_count"], null)
  premier_d2_ops_fixed_count = try(local.m801["premier_d2_ops_fixed_count"], null)
  premier_d2_ops_mod_count = try(local.m801["premier_d2_ops_mod_count"], null)
  premier_distributed_mod8_slot_count = try(local.m801["premier_distributed_mod8_slot_count"], null)
  premier_mod4_slot_count = try(local.m801["premier_mod4_slot_count"], null)
  premier_mod8_slot_count = try(local.m801["premier_mod8_slot_count"], null)
  results = try(local.m801["results"], null)
  shared_scope = try(local.m801["shared_scope"], null)
  dynamic "account_license_data" {
    for_each = try(local.m801["account_license_data"], null) == null ? [] : local.m801["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m801["ancestors"], null) == null ? [] : local.m801["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m801["parent"], null) == null ? [] : local.m801["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m801["permission_resources"], null) == null ? [] : local.m801["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m801["tags"], null) == null ? [] : local.m801["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m801["version_context"], null) == null ? [] : local.m801["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
