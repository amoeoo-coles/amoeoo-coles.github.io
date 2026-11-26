# Sample data source intersight_niatelemetry_password_strength_check — reads ../models/data_intersight_niatelemetry_password_strength_check.yml
locals { m988 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_password_strength_check.yml"))["data_intersight_niatelemetry_password_strength_check"] }

data "intersight_niatelemetry_password_strength_check" "n988" {
  account_moid = try(local.m988["account_moid"], null)
  additional_properties = try(local.m988["additional_properties"], null)
  class_id = try(local.m988["class_id"], null)
  create_time = try(local.m988["create_time"], null)
  dn = try(local.m988["dn"], null)
  domain_group_moid = try(local.m988["domain_group_moid"], null)
  id = try(local.m988["id"], null)
  mod_time = try(local.m988["mod_time"], null)
  moid = try(local.m988["moid"], null)
  object_type = try(local.m988["object_type"], null)
  owners = try(local.m988["owners"], null)
  pwd_strength_check = try(local.m988["pwd_strength_check"], null)
  record_type = try(local.m988["record_type"], null)
  record_version = try(local.m988["record_version"], null)
  results = try(local.m988["results"], null)
  shared_scope = try(local.m988["shared_scope"], null)
  site_name = try(local.m988["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m988["ancestors"], null) == null ? [] : local.m988["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m988["parent"], null) == null ? [] : local.m988["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m988["permission_resources"], null) == null ? [] : local.m988["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m988["registered_device"], null) == null ? [] : local.m988["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m988["tags"], null) == null ? [] : local.m988["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m988["version_context"], null) == null ? [] : local.m988["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
