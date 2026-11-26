# Sample data source intersight_bulk_exported_item — reads ../models/data_intersight_bulk_exported_item.yml
locals { m133 = yamldecode(file("${path.module}/../models/data_intersight_bulk_exported_item.yml"))["data_intersight_bulk_exported_item"] }

data "intersight_bulk_exported_item" "n133" {
  account_moid = try(local.m133["account_moid"], null)
  additional_properties = try(local.m133["additional_properties"], null)
  class_id = try(local.m133["class_id"], null)
  create_time = try(local.m133["create_time"], null)
  domain_group_moid = try(local.m133["domain_group_moid"], null)
  exclude_peers = try(local.m133["exclude_peers"], null)
  exclude_relations = try(local.m133["exclude_relations"], null)
  export_tags = try(local.m133["export_tags"], null)
  file_name = try(local.m133["file_name"], null)
  id = try(local.m133["id"], null)
  include_org_identity = try(local.m133["include_org_identity"], null)
  is_aes_key_set = try(local.m133["is_aes_key_set"], null)
  mod_time = try(local.m133["mod_time"], null)
  moid = try(local.m133["moid"], null)
  name = try(local.m133["name"], null)
  object_type = try(local.m133["object_type"], null)
  owners = try(local.m133["owners"], null)
  results = try(local.m133["results"], null)
  service_name = try(local.m133["service_name"], null)
  service_version = try(local.m133["service_version"], null)
  shared_scope = try(local.m133["shared_scope"], null)
  status = try(local.m133["status"], null)
  status_message = try(local.m133["status_message"], null)
  dynamic "ancestors" {
    for_each = try(local.m133["ancestors"], null) == null ? [] : local.m133["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "export" {
    for_each = try(local.m133["export"], null) == null ? [] : local.m133["export"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "item" {
    for_each = try(local.m133["item"], null) == null ? [] : local.m133["item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m133["parent"], null) == null ? [] : local.m133["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_item" {
    for_each = try(local.m133["parent_item"], null) == null ? [] : local.m133["parent_item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m133["permission_resources"], null) == null ? [] : local.m133["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "related_items" {
    for_each = try(local.m133["related_items"], null) == null ? [] : local.m133["related_items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "related_type_options" {
    for_each = try(local.m133["related_type_options"], null) == null ? [] : local.m133["related_type_options"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m133["tags"], null) == null ? [] : local.m133["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m133["version_context"], null) == null ? [] : local.m133["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
