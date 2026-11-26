# Sample resource intersight_hyperflex_vm_import_operation — reads ../models/intersight_hyperflex_vm_import_operation.yml
locals { m575 = yamldecode(file("${path.module}/../models/intersight_hyperflex_vm_import_operation.yml"))["intersight_hyperflex_vm_import_operation"] }

resource "intersight_hyperflex_vm_import_operation" "n575" {
  account_moid = try(local.m575["account_moid"], null)
  additional_properties = try(local.m575["additional_properties"], null)
  ancestors = try(local.m575["ancestors"], null)
  class_id = try(local.m575["class_id"], null)
  create_time = try(local.m575["create_time"], null)
  device_moid = try(local.m575["device_moid"], null)
  domain_group_moid = try(local.m575["domain_group_moid"], null)
  id = try(local.m575["id"], null)
  mod_time = try(local.m575["mod_time"], null)
  moid = try(local.m575["moid"], null)
  object_type = try(local.m575["object_type"], null)
  organization = try(local.m575["organization"], null)
  owners = try(local.m575["owners"], null)
  parent = try(local.m575["parent"], null)
  permission_resources = try(local.m575["permission_resources"], null)
  shared_scope = try(local.m575["shared_scope"], null)
  tags = try(local.m575["tags"], null)
  version_context = try(local.m575["version_context"], null)
}
