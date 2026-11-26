# Sample resource intersight_iam_certificate — reads ../models/intersight_iam_certificate.yml
locals { m659 = yamldecode(file("${path.module}/../models/intersight_iam_certificate.yml"))["intersight_iam_certificate"] }

resource "intersight_iam_certificate" "n659" {
  account_moid = try(local.m659["account_moid"], null)
  additional_properties = try(local.m659["additional_properties"], null)
  ancestors = try(local.m659["ancestors"], null)
  certificate = try(local.m659["certificate"], null)
  certificate_request = try(local.m659["certificate_request"], null)
  class_id = try(local.m659["class_id"], null)
  create_time = try(local.m659["create_time"], null)
  domain_group_moid = try(local.m659["domain_group_moid"], null)
  id = try(local.m659["id"], null)
  mod_time = try(local.m659["mod_time"], null)
  moid = try(local.m659["moid"], null)
  object_type = try(local.m659["object_type"], null)
  owners = try(local.m659["owners"], null)
  parent = try(local.m659["parent"], null)
  permission_resources = try(local.m659["permission_resources"], null)
  shared_scope = try(local.m659["shared_scope"], null)
  status = try(local.m659["status"], null)
  tags = try(local.m659["tags"], null)
  version_context = try(local.m659["version_context"], null)
}
