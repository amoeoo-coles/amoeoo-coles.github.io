# Sample resource intersight_storage_drive_group — reads ../models/intersight_storage_drive_group.yml
locals { m1215 = yamldecode(file("${path.module}/../models/intersight_storage_drive_group.yml"))["intersight_storage_drive_group"] }

resource "intersight_storage_drive_group" "n1215" {
  account_moid = try(local.m1215["account_moid"], null)
  additional_properties = try(local.m1215["additional_properties"], null)
  ancestors = try(local.m1215["ancestors"], null)
  automatic_drive_group = try(local.m1215["automatic_drive_group"], null)
  class_id = try(local.m1215["class_id"], null)
  create_time = try(local.m1215["create_time"], null)
  domain_group_moid = try(local.m1215["domain_group_moid"], null)
  id = try(local.m1215["id"], null)
  manual_drive_group = try(local.m1215["manual_drive_group"], null)
  mod_time = try(local.m1215["mod_time"], null)
  moid = try(local.m1215["moid"], null)
  name = try(local.m1215["name"], null)
  object_type = try(local.m1215["object_type"], null)
  owners = try(local.m1215["owners"], null)
  parent = try(local.m1215["parent"], null)
  permission_resources = try(local.m1215["permission_resources"], null)
  raid_level = try(local.m1215["raid_level"], null)
  secure_drive_group = try(local.m1215["secure_drive_group"], null)
  shared_scope = try(local.m1215["shared_scope"], null)
  storage_policy = try(local.m1215["storage_policy"], null)
  tags = try(local.m1215["tags"], null)
  type = try(local.m1215["type"], null)
  version_context = try(local.m1215["version_context"], null)
  virtual_drives = try(local.m1215["virtual_drives"], null)
}
