# Sample resource intersight_firmware_upgrade_validity — reads ../models/intersight_firmware_upgrade_validity.yml
locals { m477 = yamldecode(file("${path.module}/../models/intersight_firmware_upgrade_validity.yml"))["intersight_firmware_upgrade_validity"] }

resource "intersight_firmware_upgrade_validity" "n477" {
  account_moid = try(local.m477["account_moid"], null)
  additional_properties = try(local.m477["additional_properties"], null)
  ancestors = try(local.m477["ancestors"], null)
  class_id = try(local.m477["class_id"], null)
  create_time = try(local.m477["create_time"], null)
  domain_group_moid = try(local.m477["domain_group_moid"], null)
  error_message = try(local.m477["error_message"], null)
  id = try(local.m477["id"], null)
  is_valid = try(local.m477["is_valid"], null)
  mod_time = try(local.m477["mod_time"], null)
  moid = try(local.m477["moid"], null)
  object_type = try(local.m477["object_type"], null)
  owners = try(local.m477["owners"], null)
  parent = try(local.m477["parent"], null)
  permission_resources = try(local.m477["permission_resources"], null)
  server = try(local.m477["server"], null)
  shared_scope = try(local.m477["shared_scope"], null)
  tags = try(local.m477["tags"], null)
  version_context = try(local.m477["version_context"], null)
}
