# Sample data source intersight_license_license_reservation_op — reads ../models/data_intersight_license_license_reservation_op.yml
locals { m807 = yamldecode(file("${path.module}/../models/data_intersight_license_license_reservation_op.yml"))["data_intersight_license_license_reservation_op"] }

data "intersight_license_license_reservation_op" "n807" {
  account_moid = try(local.m807["account_moid"], null)
  additional_properties = try(local.m807["additional_properties"], null)
  auth_code = try(local.m807["auth_code"], null)
  auth_code_installed = try(local.m807["auth_code_installed"], null)
  class_id = try(local.m807["class_id"], null)
  confirm_code = try(local.m807["confirm_code"], null)
  create_time = try(local.m807["create_time"], null)
  domain_group_moid = try(local.m807["domain_group_moid"], null)
  generate_request_code = try(local.m807["generate_request_code"], null)
  generate_return_code = try(local.m807["generate_return_code"], null)
  id = try(local.m807["id"], null)
  mod_time = try(local.m807["mod_time"], null)
  moid = try(local.m807["moid"], null)
  object_type = try(local.m807["object_type"], null)
  owners = try(local.m807["owners"], null)
  request_code = try(local.m807["request_code"], null)
  results = try(local.m807["results"], null)
  return_code = try(local.m807["return_code"], null)
  shared_scope = try(local.m807["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m807["account"], null) == null ? [] : local.m807["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m807["ancestors"], null) == null ? [] : local.m807["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m807["parent"], null) == null ? [] : local.m807["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m807["permission_resources"], null) == null ? [] : local.m807["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m807["tags"], null) == null ? [] : local.m807["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m807["version_context"], null) == null ? [] : local.m807["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
