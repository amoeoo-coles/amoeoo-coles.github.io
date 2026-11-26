# Sample data source intersight_storage_nvme_raid_configuration — reads ../models/data_intersight_storage_nvme_raid_configuration.yml
locals { m1308 = yamldecode(file("${path.module}/../models/data_intersight_storage_nvme_raid_configuration.yml"))["data_intersight_storage_nvme_raid_configuration"] }

data "intersight_storage_nvme_raid_configuration" "n1308" {
  account_moid = try(local.m1308["account_moid"], null)
  additional_properties = try(local.m1308["additional_properties"], null)
  class_id = try(local.m1308["class_id"], null)
  controller_dn = try(local.m1308["controller_dn"], null)
  controller_moid = try(local.m1308["controller_moid"], null)
  controller_series = try(local.m1308["controller_series"], null)
  create_time = try(local.m1308["create_time"], null)
  domain_group_moid = try(local.m1308["domain_group_moid"], null)
  id = try(local.m1308["id"], null)
  mod_time = try(local.m1308["mod_time"], null)
  moid = try(local.m1308["moid"], null)
  object_type = try(local.m1308["object_type"], null)
  owners = try(local.m1308["owners"], null)
  results = try(local.m1308["results"], null)
  shared_scope = try(local.m1308["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1308["ancestors"], null) == null ? [] : local.m1308["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_states" {
    for_each = try(local.m1308["disk_states"], null) == null ? [] : local.m1308["disk_states"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "drive_groups" {
    for_each = try(local.m1308["drive_groups"], null) == null ? [] : local.m1308["drive_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1308["parent"], null) == null ? [] : local.m1308["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1308["permission_resources"], null) == null ? [] : local.m1308["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_profile" {
    for_each = try(local.m1308["server_profile"], null) == null ? [] : local.m1308["server_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_policy" {
    for_each = try(local.m1308["storage_policy"], null) == null ? [] : local.m1308["storage_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1308["tags"], null) == null ? [] : local.m1308["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1308["version_context"], null) == null ? [] : local.m1308["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
