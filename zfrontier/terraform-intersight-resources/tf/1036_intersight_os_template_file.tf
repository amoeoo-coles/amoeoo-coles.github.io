# Sample resource intersight_os_template_file — reads ../models/intersight_os_template_file.yml
locals { m1036 = yamldecode(file("${path.module}/../models/intersight_os_template_file.yml"))["intersight_os_template_file"] }

resource "intersight_os_template_file" "n1036" {
  account_moid = try(local.m1036["account_moid"], null)
  additional_properties = try(local.m1036["additional_properties"], null)
  ancestors = try(local.m1036["ancestors"], null)
  class_id = try(local.m1036["class_id"], null)
  create_time = try(local.m1036["create_time"], null)
  domain_group_moid = try(local.m1036["domain_group_moid"], null)
  id = try(local.m1036["id"], null)
  mod_time = try(local.m1036["mod_time"], null)
  moid = try(local.m1036["moid"], null)
  name = try(local.m1036["name"], null)
  object_type = try(local.m1036["object_type"], null)
  owners = try(local.m1036["owners"], null)
  parent = try(local.m1036["parent"], null)
  permission_resources = try(local.m1036["permission_resources"], null)
  placeholders = try(local.m1036["placeholders"], null)
  shared_scope = try(local.m1036["shared_scope"], null)
  tags = try(local.m1036["tags"], null)
  template_content = try(local.m1036["template_content"], null)
  version_context = try(local.m1036["version_context"], null)
}
