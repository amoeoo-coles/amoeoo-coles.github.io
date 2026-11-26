# Sample resource intersight_firmware_eula — reads ../models/intersight_firmware_eula.yml
locals { m468 = yamldecode(file("${path.module}/../models/intersight_firmware_eula.yml"))["intersight_firmware_eula"] }

resource "intersight_firmware_eula" "n468" {
  accepted = try(local.m468["accepted"], null)
  account = try(local.m468["account"], null)
  account_moid = try(local.m468["account_moid"], null)
  additional_properties = try(local.m468["additional_properties"], null)
  ancestors = try(local.m468["ancestors"], null)
  class_id = try(local.m468["class_id"], null)
  content = try(local.m468["content"], null)
  create_time = try(local.m468["create_time"], null)
  domain_group_moid = try(local.m468["domain_group_moid"], null)
  eula_accepted = try(local.m468["eula_accepted"], null)
  eula_content = try(local.m468["eula_content"], null)
  id = try(local.m468["id"], null)
  k9_accepted = try(local.m468["k9_accepted"], null)
  k9_content = try(local.m468["k9_content"], null)
  mod_time = try(local.m468["mod_time"], null)
  moid = try(local.m468["moid"], null)
  object_type = try(local.m468["object_type"], null)
  owners = try(local.m468["owners"], null)
  parent = try(local.m468["parent"], null)
  permission_resources = try(local.m468["permission_resources"], null)
  shared_scope = try(local.m468["shared_scope"], null)
  tags = try(local.m468["tags"], null)
  version_context = try(local.m468["version_context"], null)
}
