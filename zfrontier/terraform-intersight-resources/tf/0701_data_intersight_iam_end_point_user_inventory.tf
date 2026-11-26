# Sample data source intersight_iam_end_point_user_inventory — reads ../models/data_intersight_iam_end_point_user_inventory.yml
locals { m701 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_user_inventory.yml"))["data_intersight_iam_end_point_user_inventory"] }

data "intersight_iam_end_point_user_inventory" "n701" {
  account_moid = try(local.m701["account_moid"], null)
  additional_properties = try(local.m701["additional_properties"], null)
  class_id = try(local.m701["class_id"], null)
  create_time = try(local.m701["create_time"], null)
  device_mo_id = try(local.m701["device_mo_id"], null)
  domain_group_moid = try(local.m701["domain_group_moid"], null)
  id = try(local.m701["id"], null)
  mod_time = try(local.m701["mod_time"], null)
  moid = try(local.m701["moid"], null)
  name = try(local.m701["name"], null)
  object_type = try(local.m701["object_type"], null)
  owners = try(local.m701["owners"], null)
  results = try(local.m701["results"], null)
  shared_scope = try(local.m701["shared_scope"], null)
  user_id = try(local.m701["user_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m701["ancestors"], null) == null ? [] : local.m701["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user_role" {
    for_each = try(local.m701["end_point_user_role"], null) == null ? [] : local.m701["end_point_user_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m701["parent"], null) == null ? [] : local.m701["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m701["permission_resources"], null) == null ? [] : local.m701["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m701["tags"], null) == null ? [] : local.m701["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m701["target_mo"], null) == null ? [] : local.m701["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m701["version_context"], null) == null ? [] : local.m701["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
