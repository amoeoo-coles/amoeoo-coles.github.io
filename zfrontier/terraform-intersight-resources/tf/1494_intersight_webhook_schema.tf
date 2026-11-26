# Sample resource intersight_webhook_schema — reads ../models/intersight_webhook_schema.yml
locals { m1494 = yamldecode(file("${path.module}/../models/intersight_webhook_schema.yml"))["intersight_webhook_schema"] }

resource "intersight_webhook_schema" "n1494" {
  account = try(local.m1494["account"], null)
  account_moid = try(local.m1494["account_moid"], null)
  additional_properties = try(local.m1494["additional_properties"], null)
  ancestors = try(local.m1494["ancestors"], null)
  class_id = try(local.m1494["class_id"], null)
  create_time = try(local.m1494["create_time"], null)
  data = try(local.m1494["data"], null)
  description = try(local.m1494["description"], null)
  domain_group_moid = try(local.m1494["domain_group_moid"], null)
  event_type = try(local.m1494["event_type"], null)
  id = try(local.m1494["id"], null)
  mod_time = try(local.m1494["mod_time"], null)
  moid = try(local.m1494["moid"], null)
  nr_source = try(local.m1494["nr_source"], null)
  object_type = try(local.m1494["object_type"], null)
  owners = try(local.m1494["owners"], null)
  parent = try(local.m1494["parent"], null)
  permission_resources = try(local.m1494["permission_resources"], null)
  shared_scope = try(local.m1494["shared_scope"], null)
  tags = try(local.m1494["tags"], null)
  version_context = try(local.m1494["version_context"], null)
}
