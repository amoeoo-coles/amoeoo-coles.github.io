# Sample resource intersight_appliance_diag_setting — reads ../models/intersight_appliance_diag_setting.yml
locals { m027 = yamldecode(file("${path.module}/../models/intersight_appliance_diag_setting.yml"))["intersight_appliance_diag_setting"] }

resource "intersight_appliance_diag_setting" "n027" {
  account = try(local.m027["account"], null)
  account_moid = try(local.m027["account_moid"], null)
  additional_properties = try(local.m027["additional_properties"], null)
  ancestors = try(local.m027["ancestors"], null)
  class_id = try(local.m027["class_id"], null)
  create_time = try(local.m027["create_time"], null)
  domain_group_moid = try(local.m027["domain_group_moid"], null)
  id = try(local.m027["id"], null)
  is_password_set = try(var.secrets["intersight_appliance_diag_setting.is_password_set"], local.m027["is_password_set"])
  message = try(local.m027["message"], null)
  mod_time = try(local.m027["mod_time"], null)
  moid = try(local.m027["moid"], null)
  object_type = try(local.m027["object_type"], null)
  owners = try(local.m027["owners"], null)
  parent = try(local.m027["parent"], null)
  password = try(var.secrets["intersight_appliance_diag_setting.password"], local.m027["password"])
  permission_resources = try(local.m027["permission_resources"], null)
  shared_scope = try(local.m027["shared_scope"], null)
  tags = try(local.m027["tags"], null)
  version_context = try(local.m027["version_context"], null)
}
