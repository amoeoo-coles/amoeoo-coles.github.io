# Sample resource intersight_metrics_resource_configuration — reads ../models/intersight_metrics_resource_configuration.yml
locals { m841 = yamldecode(file("${path.module}/../models/intersight_metrics_resource_configuration.yml"))["intersight_metrics_resource_configuration"] }

resource "intersight_metrics_resource_configuration" "n841" {
  account_moid = try(local.m841["account_moid"], null)
  additional_properties = try(local.m841["additional_properties"], null)
  ancestors = try(local.m841["ancestors"], null)
  class_id = try(local.m841["class_id"], null)
  create_time = try(local.m841["create_time"], null)
  domain = try(local.m841["domain"], null)
  domain_group_moid = try(local.m841["domain_group_moid"], null)
  enabled = try(local.m841["enabled"], null)
  id = try(local.m841["id"], null)
  mod_time = try(local.m841["mod_time"], null)
  moid = try(local.m841["moid"], null)
  object_type = try(local.m841["object_type"], null)
  owners = try(local.m841["owners"], null)
  parent = try(local.m841["parent"], null)
  permission_resources = try(local.m841["permission_resources"], null)
  resource = try(local.m841["resource"], null)
  shared_scope = try(local.m841["shared_scope"], null)
  tags = try(local.m841["tags"], null)
  version_context = try(local.m841["version_context"], null)
}
