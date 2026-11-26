# Sample resource intersight_hyperflex_vm_restore_operation — reads ../models/intersight_hyperflex_vm_restore_operation.yml
locals { m576 = yamldecode(file("${path.module}/../models/intersight_hyperflex_vm_restore_operation.yml"))["intersight_hyperflex_vm_restore_operation"] }

resource "intersight_hyperflex_vm_restore_operation" "n576" {
  account_moid = try(local.m576["account_moid"], null)
  additional_properties = try(local.m576["additional_properties"], null)
  ancestors = try(local.m576["ancestors"], null)
  class_id = try(local.m576["class_id"], null)
  create_time = try(local.m576["create_time"], null)
  domain_group_moid = try(local.m576["domain_group_moid"], null)
  id = try(local.m576["id"], null)
  mod_time = try(local.m576["mod_time"], null)
  moid = try(local.m576["moid"], null)
  new_name = try(local.m576["new_name"], null)
  object_type = try(local.m576["object_type"], null)
  organization = try(local.m576["organization"], null)
  owners = try(local.m576["owners"], null)
  parent = try(local.m576["parent"], null)
  permission_resources = try(local.m576["permission_resources"], null)
  power_on = try(local.m576["power_on"], null)
  restore_edge_cluster_moid = try(local.m576["restore_edge_cluster_moid"], null)
  shared_scope = try(local.m576["shared_scope"], null)
  start_time = try(local.m576["start_time"], null)
  tags = try(local.m576["tags"], null)
  version_context = try(local.m576["version_context"], null)
  vm_backup_info_moid = try(local.m576["vm_backup_info_moid"], null)
  vm_snapshot_info_moid = try(local.m576["vm_snapshot_info_moid"], null)
}
