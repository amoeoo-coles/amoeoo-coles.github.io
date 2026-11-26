# Sample resource intersight_software_release_meta — reads ../models/intersight_software_release_meta.yml
locals { m1181 = yamldecode(file("${path.module}/../models/intersight_software_release_meta.yml"))["intersight_software_release_meta"] }

resource "intersight_software_release_meta" "n1181" {
  account_moid = try(local.m1181["account_moid"], null)
  additional_properties = try(local.m1181["additional_properties"], null)
  ancestors = try(local.m1181["ancestors"], null)
  catalog = try(local.m1181["catalog"], null)
  class_id = try(local.m1181["class_id"], null)
  create_time = try(local.m1181["create_time"], null)
  domain_group_moid = try(local.m1181["domain_group_moid"], null)
  id = try(local.m1181["id"], null)
  image = try(local.m1181["image"], null)
  image_type = try(local.m1181["image_type"], null)
  latest_file_name = try(local.m1181["latest_file_name"], null)
  latest_version = try(local.m1181["latest_version"], null)
  mod_time = try(local.m1181["mod_time"], null)
  moid = try(local.m1181["moid"], null)
  object_type = try(local.m1181["object_type"], null)
  owners = try(local.m1181["owners"], null)
  parent = try(local.m1181["parent"], null)
  permission_resources = try(local.m1181["permission_resources"], null)
  shared_scope = try(local.m1181["shared_scope"], null)
  software_type_id = try(local.m1181["software_type_id"], null)
  tags = try(local.m1181["tags"], null)
  version_context = try(local.m1181["version_context"], null)
}
