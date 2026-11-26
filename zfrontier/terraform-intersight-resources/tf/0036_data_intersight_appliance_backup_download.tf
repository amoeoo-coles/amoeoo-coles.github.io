# Sample data source intersight_appliance_backup_download — reads ../models/data_intersight_appliance_backup_download.yml
locals { m036 = yamldecode(file("${path.module}/../models/data_intersight_appliance_backup_download.yml"))["data_intersight_appliance_backup_download"] }

data "intersight_appliance_backup_download" "n036" {
  account_moid = try(local.m036["account_moid"], null)
  additional_properties = try(local.m036["additional_properties"], null)
  class_id = try(local.m036["class_id"], null)
  create_time = try(local.m036["create_time"], null)
  domain_group_moid = try(local.m036["domain_group_moid"], null)
  id = try(local.m036["id"], null)
  mod_time = try(local.m036["mod_time"], null)
  moid = try(local.m036["moid"], null)
  object_type = try(local.m036["object_type"], null)
  owners = try(local.m036["owners"], null)
  results = try(local.m036["results"], null)
  shared_scope = try(local.m036["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m036["ancestors"], null) == null ? [] : local.m036["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup" {
    for_each = try(local.m036["backup"], null) == null ? [] : local.m036["backup"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m036["parent"], null) == null ? [] : local.m036["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m036["permission_resources"], null) == null ? [] : local.m036["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m036["tags"], null) == null ? [] : local.m036["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m036["version_context"], null) == null ? [] : local.m036["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
