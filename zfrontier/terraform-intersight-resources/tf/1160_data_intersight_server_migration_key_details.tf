# Sample data source intersight_server_migration_key_details — reads ../models/data_intersight_server_migration_key_details.yml
locals { m1160 = yamldecode(file("${path.module}/../models/data_intersight_server_migration_key_details.yml"))["data_intersight_server_migration_key_details"] }

data "intersight_server_migration_key_details" "n1160" {
  account_moid = try(local.m1160["account_moid"], null)
  additional_properties = try(local.m1160["additional_properties"], null)
  class_id = try(local.m1160["class_id"], null)
  create_time = try(local.m1160["create_time"], null)
  domain_group_moid = try(local.m1160["domain_group_moid"], null)
  id = try(local.m1160["id"], null)
  mod_time = try(local.m1160["mod_time"], null)
  moid = try(local.m1160["moid"], null)
  object_type = try(local.m1160["object_type"], null)
  owners = try(local.m1160["owners"], null)
  results = try(local.m1160["results"], null)
  shared_scope = try(local.m1160["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1160["ancestors"], null) == null ? [] : local.m1160["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "download_status" {
    for_each = try(local.m1160["download_status"], null) == null ? [] : local.m1160["download_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "migration_key_info" {
    for_each = try(local.m1160["migration_key_info"], null) == null ? [] : local.m1160["migration_key_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1160["parent"], null) == null ? [] : local.m1160["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1160["permission_resources"], null) == null ? [] : local.m1160["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1160["profile"], null) == null ? [] : local.m1160["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m1160["server"], null) == null ? [] : local.m1160["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1160["tags"], null) == null ? [] : local.m1160["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1160["version_context"], null) == null ? [] : local.m1160["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
