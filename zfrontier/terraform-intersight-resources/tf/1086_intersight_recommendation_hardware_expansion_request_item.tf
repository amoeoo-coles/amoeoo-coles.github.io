# Sample resource intersight_recommendation_hardware_expansion_request_item — reads ../models/intersight_recommendation_hardware_expansion_request_item.yml
locals { m1086 = yamldecode(file("${path.module}/../models/intersight_recommendation_hardware_expansion_request_item.yml"))["intersight_recommendation_hardware_expansion_request_item"] }

resource "intersight_recommendation_hardware_expansion_request_item" "n1086" {
  account_moid = try(local.m1086["account_moid"], null)
  additional_properties = try(local.m1086["additional_properties"], null)
  ancestors = try(local.m1086["ancestors"], null)
  class_id = try(local.m1086["class_id"], null)
  create_time = try(local.m1086["create_time"], null)
  domain_group_moid = try(local.m1086["domain_group_moid"], null)
  expansion_request = try(local.m1086["expansion_request"], null)
  id = try(local.m1086["id"], null)
  item_type = try(local.m1086["item_type"], null)
  max_value = try(local.m1086["max_value"], null)
  max_value_unit = try(local.m1086["max_value_unit"], null)
  mod_time = try(local.m1086["mod_time"], null)
  moid = try(local.m1086["moid"], null)
  object_type = try(local.m1086["object_type"], null)
  owners = try(local.m1086["owners"], null)
  parent = try(local.m1086["parent"], null)
  permission_resources = try(local.m1086["permission_resources"], null)
  shared_scope = try(local.m1086["shared_scope"], null)
  tags = try(local.m1086["tags"], null)
  unit_type = try(local.m1086["unit_type"], null)
  value = try(local.m1086["value"], null)
  version_context = try(local.m1086["version_context"], null)
}
