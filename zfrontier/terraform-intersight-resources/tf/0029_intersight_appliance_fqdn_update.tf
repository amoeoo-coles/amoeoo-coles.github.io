# Sample resource intersight_appliance_fqdn_update — reads ../models/intersight_appliance_fqdn_update.yml
locals { m029 = yamldecode(file("${path.module}/../models/intersight_appliance_fqdn_update.yml"))["intersight_appliance_fqdn_update"] }

resource "intersight_appliance_fqdn_update" "n029" {
  account = try(local.m029["account"], null)
  account_moid = try(local.m029["account_moid"], null)
  additional_properties = try(local.m029["additional_properties"], null)
  ancestors = try(local.m029["ancestors"], null)
  class_id = try(local.m029["class_id"], null)
  create_time = try(local.m029["create_time"], null)
  domain_group_moid = try(local.m029["domain_group_moid"], null)
  end_time = try(local.m029["end_time"], null)
  fqdn = try(local.m029["fqdn"], null)
  id = try(local.m029["id"], null)
  mod_time = try(local.m029["mod_time"], null)
  moid = try(local.m029["moid"], null)
  object_type = try(local.m029["object_type"], null)
  owners = try(local.m029["owners"], null)
  parent = try(local.m029["parent"], null)
  permission_resources = try(local.m029["permission_resources"], null)
  shared_scope = try(local.m029["shared_scope"], null)
  start_time = try(local.m029["start_time"], null)
  status = try(local.m029["status"], null)
  tags = try(local.m029["tags"], null)
  version_context = try(local.m029["version_context"], null)
}
