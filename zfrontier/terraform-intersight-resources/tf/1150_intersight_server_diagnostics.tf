# Sample resource intersight_server_diagnostics — reads ../models/intersight_server_diagnostics.yml
locals { m1150 = yamldecode(file("${path.module}/../models/intersight_server_diagnostics.yml"))["intersight_server_diagnostics"] }

resource "intersight_server_diagnostics" "n1150" {
  account_moid = try(local.m1150["account_moid"], null)
  action = try(local.m1150["action"], null)
  additional_properties = try(local.m1150["additional_properties"], null)
  ancestors = try(local.m1150["ancestors"], null)
  class_id = try(local.m1150["class_id"], null)
  component_list = try(local.m1150["component_list"], null)
  create_time = try(local.m1150["create_time"], null)
  diagnostic_status = try(local.m1150["diagnostic_status"], null)
  diagnostics_type = try(local.m1150["diagnostics_type"], null)
  domain_group_moid = try(local.m1150["domain_group_moid"], null)
  id = try(local.m1150["id"], null)
  mod_time = try(local.m1150["mod_time"], null)
  moid = try(local.m1150["moid"], null)
  name = try(local.m1150["name"], null)
  object_type = try(local.m1150["object_type"], null)
  owners = try(local.m1150["owners"], null)
  parent = try(local.m1150["parent"], null)
  permission_resources = try(local.m1150["permission_resources"], null)
  server = try(local.m1150["server"], null)
  shared_scope = try(local.m1150["shared_scope"], null)
  tags = try(local.m1150["tags"], null)
  version_context = try(local.m1150["version_context"], null)
}
