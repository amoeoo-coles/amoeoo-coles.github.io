# Sample data source intersight_mgmt_object_backup_meta — reads ../models/data_intersight_mgmt_object_backup_meta.yml
locals { m857 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_object_backup_meta.yml"))["data_intersight_mgmt_object_backup_meta"] }

data "intersight_mgmt_object_backup_meta" "n857" {
  account_moid = try(local.m857["account_moid"], null)
  additional_properties = try(local.m857["additional_properties"], null)
  class_id = try(local.m857["class_id"], null)
  create_time = try(local.m857["create_time"], null)
  domain_group_moid = try(local.m857["domain_group_moid"], null)
  exclude_relations = try(local.m857["exclude_relations"], null)
  excluded_peers = try(local.m857["excluded_peers"], null)
  export_timeout = try(local.m857["export_timeout"], null)
  filter = try(local.m857["filter"], null)
  id = try(local.m857["id"], null)
  mod_time = try(local.m857["mod_time"], null)
  moid = try(local.m857["moid"], null)
  name = try(local.m857["name"], null)
  object_type = try(local.m857["object_type"], null)
  owners = try(local.m857["owners"], null)
  reporting_service = try(local.m857["reporting_service"], null)
  rest_path = try(local.m857["rest_path"], null)
  results = try(local.m857["results"], null)
  shared_scope = try(local.m857["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m857["ancestors"], null) == null ? [] : local.m857["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "category" {
    for_each = try(local.m857["category"], null) == null ? [] : local.m857["category"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m857["parent"], null) == null ? [] : local.m857["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m857["permission_resources"], null) == null ? [] : local.m857["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "related_type_options" {
    for_each = try(local.m857["related_type_options"], null) == null ? [] : local.m857["related_type_options"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m857["tags"], null) == null ? [] : local.m857["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m857["version_context"], null) == null ? [] : local.m857["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
