# Sample resource intersight_recommendation_hardware_expansion_request — reads ../models/intersight_recommendation_hardware_expansion_request.yml
locals { m1085 = yamldecode(file("${path.module}/../models/intersight_recommendation_hardware_expansion_request.yml"))["intersight_recommendation_hardware_expansion_request"] }

resource "intersight_recommendation_hardware_expansion_request" "n1085" {
  account_moid = try(local.m1085["account_moid"], null)
  action = try(local.m1085["action"], null)
  additional_properties = try(local.m1085["additional_properties"], null)
  ancestors = try(local.m1085["ancestors"], null)
  class_id = try(local.m1085["class_id"], null)
  create_time = try(local.m1085["create_time"], null)
  domain_group_moid = try(local.m1085["domain_group_moid"], null)
  hw_expansion_request_items = try(local.m1085["hw_expansion_request_items"], null)
  id = try(local.m1085["id"], null)
  message = try(local.m1085["message"], null)
  mod_time = try(local.m1085["mod_time"], null)
  moid = try(local.m1085["moid"], null)
  name = try(local.m1085["name"], null)
  object_type = try(local.m1085["object_type"], null)
  owners = try(local.m1085["owners"], null)
  parent = try(local.m1085["parent"], null)
  permission_resources = try(local.m1085["permission_resources"], null)
  registered_device = try(local.m1085["registered_device"], null)
  request_time = try(local.m1085["request_time"], null)
  shared_scope = try(local.m1085["shared_scope"], null)
  status = try(local.m1085["status"], null)
  tags = try(local.m1085["tags"], null)
  version_context = try(local.m1085["version_context"], null)
}
