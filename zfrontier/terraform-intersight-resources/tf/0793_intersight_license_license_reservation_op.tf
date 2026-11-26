# Sample resource intersight_license_license_reservation_op — reads ../models/intersight_license_license_reservation_op.yml
locals { m793 = yamldecode(file("${path.module}/../models/intersight_license_license_reservation_op.yml"))["intersight_license_license_reservation_op"] }

resource "intersight_license_license_reservation_op" "n793" {
  account = try(local.m793["account"], null)
  account_moid = try(local.m793["account_moid"], null)
  additional_properties = try(local.m793["additional_properties"], null)
  ancestors = try(local.m793["ancestors"], null)
  auth_code = try(local.m793["auth_code"], null)
  auth_code_installed = try(local.m793["auth_code_installed"], null)
  class_id = try(local.m793["class_id"], null)
  confirm_code = try(local.m793["confirm_code"], null)
  create_time = try(local.m793["create_time"], null)
  domain_group_moid = try(local.m793["domain_group_moid"], null)
  generate_request_code = try(local.m793["generate_request_code"], null)
  generate_return_code = try(local.m793["generate_return_code"], null)
  id = try(local.m793["id"], null)
  mod_time = try(local.m793["mod_time"], null)
  moid = try(local.m793["moid"], null)
  object_type = try(local.m793["object_type"], null)
  owners = try(local.m793["owners"], null)
  parent = try(local.m793["parent"], null)
  permission_resources = try(local.m793["permission_resources"], null)
  request_code = try(local.m793["request_code"], null)
  return_code = try(local.m793["return_code"], null)
  shared_scope = try(local.m793["shared_scope"], null)
  tags = try(local.m793["tags"], null)
  version_context = try(local.m793["version_context"], null)
}
