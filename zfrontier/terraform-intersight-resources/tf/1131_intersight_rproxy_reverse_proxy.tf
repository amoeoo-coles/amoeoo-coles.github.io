# Sample resource intersight_rproxy_reverse_proxy — reads ../models/intersight_rproxy_reverse_proxy.yml
locals { m1131 = yamldecode(file("${path.module}/../models/intersight_rproxy_reverse_proxy.yml"))["intersight_rproxy_reverse_proxy"] }

resource "intersight_rproxy_reverse_proxy" "n1131" {
  account = try(local.m1131["account"], null)
  account_moid = try(local.m1131["account_moid"], null)
  additional_properties = try(local.m1131["additional_properties"], null)
  ancestors = try(local.m1131["ancestors"], null)
  class_id = try(local.m1131["class_id"], null)
  create_time = try(local.m1131["create_time"], null)
  domain_group_moid = try(local.m1131["domain_group_moid"], null)
  id = try(local.m1131["id"], null)
  mod_time = try(local.m1131["mod_time"], null)
  moid = try(local.m1131["moid"], null)
  object_type = try(local.m1131["object_type"], null)
  owners = try(local.m1131["owners"], null)
  parent = try(local.m1131["parent"], null)
  permission_resources = try(local.m1131["permission_resources"], null)
  shared_scope = try(local.m1131["shared_scope"], null)
  tags = try(local.m1131["tags"], null)
  version_context = try(local.m1131["version_context"], null)
}
