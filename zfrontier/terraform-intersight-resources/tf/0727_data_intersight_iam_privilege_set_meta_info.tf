# Sample data source intersight_iam_privilege_set_meta_info — reads ../models/data_intersight_iam_privilege_set_meta_info.yml
locals { m727 = yamldecode(file("${path.module}/../models/data_intersight_iam_privilege_set_meta_info.yml"))["data_intersight_iam_privilege_set_meta_info"] }

data "intersight_iam_privilege_set_meta_info" "n727" {
  account_moid = try(local.m727["account_moid"], null)
  additional_properties = try(local.m727["additional_properties"], null)
  all_dependency_info = try(local.m727["all_dependency_info"], null)
  associated_privilege_set_names = try(local.m727["associated_privilege_set_names"], null)
  class_id = try(local.m727["class_id"], null)
  create_time = try(local.m727["create_time"], null)
  domain_group_moid = try(local.m727["domain_group_moid"], null)
  downstream_dependencies = try(local.m727["downstream_dependencies"], null)
  id = try(local.m727["id"], null)
  missing_dependency_info = try(local.m727["missing_dependency_info"], null)
  mod_time = try(local.m727["mod_time"], null)
  moid = try(local.m727["moid"], null)
  name = try(local.m727["name"], null)
  object_type = try(local.m727["object_type"], null)
  owners = try(local.m727["owners"], null)
  results = try(local.m727["results"], null)
  shared_scope = try(local.m727["shared_scope"], null)
  upstream_dependencies = try(local.m727["upstream_dependencies"], null)
  uuid = try(local.m727["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m727["ancestors"], null) == null ? [] : local.m727["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_privilege_sets" {
    for_each = try(local.m727["associated_privilege_sets"], null) == null ? [] : local.m727["associated_privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "missing_privilege_sets" {
    for_each = try(local.m727["missing_privilege_sets"], null) == null ? [] : local.m727["missing_privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m727["parent"], null) == null ? [] : local.m727["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m727["permission_resources"], null) == null ? [] : local.m727["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m727["tags"], null) == null ? [] : local.m727["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m727["version_context"], null) == null ? [] : local.m727["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
