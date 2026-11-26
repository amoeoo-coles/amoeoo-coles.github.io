# Sample resource intersight_webhook_endpoint — reads ../models/intersight_webhook_endpoint.yml
locals { m1493 = yamldecode(file("${path.module}/../models/intersight_webhook_endpoint.yml"))["intersight_webhook_endpoint"] }

resource "intersight_webhook_endpoint" "n1493" {
  account = try(local.m1493["account"], null)
  account_moid = try(local.m1493["account_moid"], null)
  additional_properties = try(local.m1493["additional_properties"], null)
  ancestors = try(local.m1493["ancestors"], null)
  class_id = try(local.m1493["class_id"], null)
  create_time = try(local.m1493["create_time"], null)
  domain_group_moid = try(local.m1493["domain_group_moid"], null)
  id = try(local.m1493["id"], null)
  mod_time = try(local.m1493["mod_time"], null)
  moid = try(local.m1493["moid"], null)
  name = try(local.m1493["name"], null)
  object_type = try(local.m1493["object_type"], null)
  organization = try(local.m1493["organization"], null)
  owners = try(local.m1493["owners"], null)
  parent = try(local.m1493["parent"], null)
  permission_resources = try(local.m1493["permission_resources"], null)
  schemas = try(local.m1493["schemas"], null)
  shared_scope = try(local.m1493["shared_scope"], null)
  tags = try(local.m1493["tags"], null)
  target = try(local.m1493["target"], null)
  url = try(local.m1493["url"], null)
  version_context = try(local.m1493["version_context"], null)
}
