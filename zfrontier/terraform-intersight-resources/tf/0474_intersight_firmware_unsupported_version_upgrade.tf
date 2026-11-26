# Sample resource intersight_firmware_unsupported_version_upgrade — reads ../models/intersight_firmware_unsupported_version_upgrade.yml
locals { m474 = yamldecode(file("${path.module}/../models/intersight_firmware_unsupported_version_upgrade.yml"))["intersight_firmware_unsupported_version_upgrade"] }

resource "intersight_firmware_unsupported_version_upgrade" "n474" {
  account_moid = try(local.m474["account_moid"], null)
  additional_properties = try(local.m474["additional_properties"], null)
  ancestors = try(local.m474["ancestors"], null)
  checksum = try(local.m474["checksum"], null)
  class_id = try(local.m474["class_id"], null)
  create_time = try(local.m474["create_time"], null)
  device = try(local.m474["device"], null)
  distributable = try(local.m474["distributable"], null)
  domain_group_moid = try(local.m474["domain_group_moid"], null)
  download_error = try(local.m474["download_error"], null)
  download_progress = try(local.m474["download_progress"], null)
  download_retries = try(local.m474["download_retries"], null)
  id = try(local.m474["id"], null)
  mod_time = try(local.m474["mod_time"], null)
  moid = try(local.m474["moid"], null)
  object_type = try(local.m474["object_type"], null)
  owners = try(local.m474["owners"], null)
  parent = try(local.m474["parent"], null)
  permission_resources = try(local.m474["permission_resources"], null)
  physical_identity = try(local.m474["physical_identity"], null)
  shared_scope = try(local.m474["shared_scope"], null)
  tags = try(local.m474["tags"], null)
  upgrade_status = try(local.m474["upgrade_status"], null)
  version_context = try(local.m474["version_context"], null)
}
