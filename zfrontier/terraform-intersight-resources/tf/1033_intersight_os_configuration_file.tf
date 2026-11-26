# Sample resource intersight_os_configuration_file — reads ../models/intersight_os_configuration_file.yml
locals { m1033 = yamldecode(file("${path.module}/../models/intersight_os_configuration_file.yml"))["intersight_os_configuration_file"] }

resource "intersight_os_configuration_file" "n1033" {
  account_moid = try(local.m1033["account_moid"], null)
  additional_properties = try(local.m1033["additional_properties"], null)
  ancestors = try(local.m1033["ancestors"], null)
  catalog = try(local.m1033["catalog"], null)
  class_id = try(local.m1033["class_id"], null)
  create_time = try(local.m1033["create_time"], null)
  description = try(local.m1033["description"], null)
  distributions = try(local.m1033["distributions"], null)
  domain_group_moid = try(local.m1033["domain_group_moid"], null)
  file_content = try(local.m1033["file_content"], null)
  id = try(local.m1033["id"], null)
  internal = try(local.m1033["internal"], null)
  mod_time = try(local.m1033["mod_time"], null)
  moid = try(local.m1033["moid"], null)
  name = try(local.m1033["name"], null)
  object_type = try(local.m1033["object_type"], null)
  owners = try(local.m1033["owners"], null)
  parent = try(local.m1033["parent"], null)
  permission_resources = try(local.m1033["permission_resources"], null)
  placeholders = try(local.m1033["placeholders"], null)
  shared_scope = try(local.m1033["shared_scope"], null)
  supported = try(local.m1033["supported"], null)
  tags = try(local.m1033["tags"], null)
  version_context = try(local.m1033["version_context"], null)
}
