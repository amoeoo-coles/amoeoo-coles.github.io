# Sample resource intersight_compute_host_utility_operation — reads ../models/intersight_compute_host_utility_operation.yml
locals { m232 = yamldecode(file("${path.module}/../models/intersight_compute_host_utility_operation.yml"))["intersight_compute_host_utility_operation"] }

resource "intersight_compute_host_utility_operation" "n232" {
  account_moid = try(local.m232["account_moid"], null)
  additional_properties = try(local.m232["additional_properties"], null)
  ancestors = try(local.m232["ancestors"], null)
  class_id = try(local.m232["class_id"], null)
  create_time = try(local.m232["create_time"], null)
  domain_group_moid = try(local.m232["domain_group_moid"], null)
  download_status = try(local.m232["download_status"], null)
  host_op_config = try(local.m232["host_op_config"], null)
  host_utility_operation_mode = try(local.m232["host_utility_operation_mode"], null)
  host_utility_operation_status = try(local.m232["host_utility_operation_status"], null)
  id = try(local.m232["id"], null)
  mod_time = try(local.m232["mod_time"], null)
  moid = try(local.m232["moid"], null)
  object_type = try(local.m232["object_type"], null)
  owners = try(local.m232["owners"], null)
  parent = try(local.m232["parent"], null)
  permission_resources = try(local.m232["permission_resources"], null)
  server = try(local.m232["server"], null)
  shared_scope = try(local.m232["shared_scope"], null)
  tags = try(local.m232["tags"], null)
  version_context = try(local.m232["version_context"], null)
  wait_for_completion = try(local.m232["wait_for_completion"], null)
  workflow = try(local.m232["workflow"], null)
}
