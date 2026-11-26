# Sample resource intersight_iwotenant_migrate — reads ../models/intersight_iwotenant_migrate.yml
locals { m773 = yamldecode(file("${path.module}/../models/intersight_iwotenant_migrate.yml"))["intersight_iwotenant_migrate"] }

resource "intersight_iwotenant_migrate" "n773" {
  account = try(local.m773["account"], null)
  account_moid = try(local.m773["account_moid"], null)
  additional_properties = try(local.m773["additional_properties"], null)
  ancestors = try(local.m773["ancestors"], null)
  class_id = try(local.m773["class_id"], null)
  create_time = try(local.m773["create_time"], null)
  domain_group_moid = try(local.m773["domain_group_moid"], null)
  id = try(local.m773["id"], null)
  is_password_set = try(var.secrets["intersight_iwotenant_migrate.is_password_set"], local.m773["is_password_set"])
  mod_time = try(local.m773["mod_time"], null)
  moid = try(local.m773["moid"], null)
  object_type = try(local.m773["object_type"], null)
  owners = try(local.m773["owners"], null)
  parent = try(local.m773["parent"], null)
  password = try(var.secrets["intersight_iwotenant_migrate.password"], local.m773["password"])
  permission_resources = try(local.m773["permission_resources"], null)
  shared_scope = try(local.m773["shared_scope"], null)
  tags = try(local.m773["tags"], null)
  url = try(local.m773["url"], null)
  version_context = try(local.m773["version_context"], null)
}
