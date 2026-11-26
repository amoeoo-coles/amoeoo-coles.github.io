# Sample data source intersight_niaapi_upgrade_assist_file — reads ../models/data_intersight_niaapi_upgrade_assist_file.yml
locals { m907 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_upgrade_assist_file.yml"))["data_intersight_niaapi_upgrade_assist_file"] }

data "intersight_niaapi_upgrade_assist_file" "n907" {
  account_moid = try(local.m907["account_moid"], null)
  additional_properties = try(local.m907["additional_properties"], null)
  class_id = try(local.m907["class_id"], null)
  create_time = try(local.m907["create_time"], null)
  domain_group_moid = try(local.m907["domain_group_moid"], null)
  file_name = try(local.m907["file_name"], null)
  id = try(local.m907["id"], null)
  mod_time = try(local.m907["mod_time"], null)
  moid = try(local.m907["moid"], null)
  object_type = try(local.m907["object_type"], null)
  owners = try(local.m907["owners"], null)
  presigned_url = try(local.m907["presigned_url"], null)
  results = try(local.m907["results"], null)
  shared_scope = try(local.m907["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m907["ancestors"], null) == null ? [] : local.m907["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m907["parent"], null) == null ? [] : local.m907["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m907["permission_resources"], null) == null ? [] : local.m907["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m907["tags"], null) == null ? [] : local.m907["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m907["version_context"], null) == null ? [] : local.m907["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
