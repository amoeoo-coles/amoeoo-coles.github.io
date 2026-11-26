# Sample resource intersight_cond_hcl_status_job — reads ../models/intersight_cond_hcl_status_job.yml
locals { m258 = yamldecode(file("${path.module}/../models/intersight_cond_hcl_status_job.yml"))["intersight_cond_hcl_status_job"] }

resource "intersight_cond_hcl_status_job" "n258" {
  account_moid = try(local.m258["account_moid"], null)
  additional_properties = try(local.m258["additional_properties"], null)
  ancestors = try(local.m258["ancestors"], null)
  class_id = try(local.m258["class_id"], null)
  create_time = try(local.m258["create_time"], null)
  domain_group_moid = try(local.m258["domain_group_moid"], null)
  id = try(local.m258["id"], null)
  managed_object = try(local.m258["managed_object"], null)
  mod_time = try(local.m258["mod_time"], null)
  moid = try(local.m258["moid"], null)
  object_type = try(local.m258["object_type"], null)
  owners = try(local.m258["owners"], null)
  parent = try(local.m258["parent"], null)
  permission_resources = try(local.m258["permission_resources"], null)
  registered_device = try(local.m258["registered_device"], null)
  shared_scope = try(local.m258["shared_scope"], null)
  tags = try(local.m258["tags"], null)
  version_context = try(local.m258["version_context"], null)
}
