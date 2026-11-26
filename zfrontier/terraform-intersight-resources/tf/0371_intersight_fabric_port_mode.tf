# Sample resource intersight_fabric_port_mode — reads ../models/intersight_fabric_port_mode.yml
locals { m371 = yamldecode(file("${path.module}/../models/intersight_fabric_port_mode.yml"))["intersight_fabric_port_mode"] }

resource "intersight_fabric_port_mode" "n371" {
  account_moid = try(local.m371["account_moid"], null)
  additional_properties = try(local.m371["additional_properties"], null)
  ancestors = try(local.m371["ancestors"], null)
  class_id = try(local.m371["class_id"], null)
  create_time = try(local.m371["create_time"], null)
  custom_mode = try(local.m371["custom_mode"], null)
  domain_group_moid = try(local.m371["domain_group_moid"], null)
  id = try(local.m371["id"], null)
  mod_time = try(local.m371["mod_time"], null)
  moid = try(local.m371["moid"], null)
  object_type = try(local.m371["object_type"], null)
  owners = try(local.m371["owners"], null)
  parent = try(local.m371["parent"], null)
  permission_resources = try(local.m371["permission_resources"], null)
  port_id_end = try(local.m371["port_id_end"], null)
  port_id_start = try(local.m371["port_id_start"], null)
  port_policy = try(local.m371["port_policy"], null)
  shared_scope = try(local.m371["shared_scope"], null)
  slot_id = try(local.m371["slot_id"], null)
  tags = try(local.m371["tags"], null)
  version_context = try(local.m371["version_context"], null)
}
