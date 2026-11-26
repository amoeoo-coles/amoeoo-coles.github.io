# Sample resource intersight_iwotenant_tenant_customization — reads ../models/intersight_iwotenant_tenant_customization.yml
locals { m774 = yamldecode(file("${path.module}/../models/intersight_iwotenant_tenant_customization.yml"))["intersight_iwotenant_tenant_customization"] }

resource "intersight_iwotenant_tenant_customization" "n774" {
  account = try(local.m774["account"], null)
  account_moid = try(local.m774["account_moid"], null)
  additional_properties = try(local.m774["additional_properties"], null)
  ancestors = try(local.m774["ancestors"], null)
  class_id = try(local.m774["class_id"], null)
  create_time = try(local.m774["create_time"], null)
  domain_group_moid = try(local.m774["domain_group_moid"], null)
  enable_data_extractor = try(local.m774["enable_data_extractor"], null)
  id = try(local.m774["id"], null)
  is_write_user_access_key_id_set = try(local.m774["is_write_user_access_key_id_set"], null)
  is_write_user_secret_access_key_set = try(var.secrets["intersight_iwotenant_tenant_customization.is_write_user_secret_access_key_set"], local.m774["is_write_user_secret_access_key_set"])
  iwo_id = try(local.m774["iwo_id"], null)
  mod_time = try(local.m774["mod_time"], null)
  moid = try(local.m774["moid"], null)
  msk_server_for_data_extractor = try(local.m774["msk_server_for_data_extractor"], null)
  object_type = try(local.m774["object_type"], null)
  owners = try(local.m774["owners"], null)
  parent = try(local.m774["parent"], null)
  permission_resources = try(local.m774["permission_resources"], null)
  shared_scope = try(local.m774["shared_scope"], null)
  tags = try(local.m774["tags"], null)
  version_context = try(local.m774["version_context"], null)
  write_user_access_key_id = try(local.m774["write_user_access_key_id"], null)
  write_user_secret_access_key = try(var.secrets["intersight_iwotenant_tenant_customization.write_user_secret_access_key"], local.m774["write_user_secret_access_key"])
}
