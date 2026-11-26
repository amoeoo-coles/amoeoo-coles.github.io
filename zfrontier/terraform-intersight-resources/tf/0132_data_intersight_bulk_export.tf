# Sample data source intersight_bulk_export — reads ../models/data_intersight_bulk_export.yml
locals { m132 = yamldecode(file("${path.module}/../models/data_intersight_bulk_export.yml"))["data_intersight_bulk_export"] }

data "intersight_bulk_export" "n132" {
  account_moid = try(local.m132["account_moid"], null)
  action = try(local.m132["action"], null)
  additional_properties = try(local.m132["additional_properties"], null)
  class_id = try(local.m132["class_id"], null)
  create_time = try(local.m132["create_time"], null)
  domain_group_moid = try(local.m132["domain_group_moid"], null)
  exclude_peers = try(local.m132["exclude_peers"], null)
  exclude_relations = try(local.m132["exclude_relations"], null)
  export_tags = try(local.m132["export_tags"], null)
  id = try(local.m132["id"], null)
  import_order = try(local.m132["import_order"], null)
  include_org_identity = try(local.m132["include_org_identity"], null)
  is_aes_key_set = try(local.m132["is_aes_key_set"], null)
  item_names = try(local.m132["item_names"], null)
  mod_time = try(local.m132["mod_time"], null)
  moid = try(local.m132["moid"], null)
  name = try(local.m132["name"], null)
  object_type = try(local.m132["object_type"], null)
  owners = try(local.m132["owners"], null)
  permission_id = try(local.m132["permission_id"], null)
  preserve_identities = try(local.m132["preserve_identities"], null)
  results = try(local.m132["results"], null)
  shared_scope = try(local.m132["shared_scope"], null)
  split_requests = try(local.m132["split_requests"], null)
  status = try(local.m132["status"], null)
  status_message = try(local.m132["status_message"], null)
  user_id = try(local.m132["user_id"], null)
  dynamic "account" {
    for_each = try(local.m132["account"], null) == null ? [] : local.m132["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m132["ancestors"], null) == null ? [] : local.m132["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exported_items" {
    for_each = try(local.m132["exported_items"], null) == null ? [] : local.m132["exported_items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exported_objects" {
    for_each = try(local.m132["exported_objects"], null) == null ? [] : local.m132["exported_objects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exported_objects_as_groups" {
    for_each = try(local.m132["exported_objects_as_groups"], null) == null ? [] : local.m132["exported_objects_as_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m132["idp"], null) == null ? [] : local.m132["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp_reference" {
    for_each = try(local.m132["idp_reference"], null) == null ? [] : local.m132["idp_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "items" {
    for_each = try(local.m132["items"], null) == null ? [] : local.m132["items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m132["organization"], null) == null ? [] : local.m132["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m132["parent"], null) == null ? [] : local.m132["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m132["permission_resources"], null) == null ? [] : local.m132["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "related_type_options" {
    for_each = try(local.m132["related_type_options"], null) == null ? [] : local.m132["related_type_options"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m132["tags"], null) == null ? [] : local.m132["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m132["user"], null) == null ? [] : local.m132["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m132["version_context"], null) == null ? [] : local.m132["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
