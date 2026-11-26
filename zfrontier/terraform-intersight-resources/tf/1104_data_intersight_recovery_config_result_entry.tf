# Sample data source intersight_recovery_config_result_entry — reads ../models/data_intersight_recovery_config_result_entry.yml
locals { m1104 = yamldecode(file("${path.module}/../models/data_intersight_recovery_config_result_entry.yml"))["data_intersight_recovery_config_result_entry"] }

data "intersight_recovery_config_result_entry" "n1104" {
  account_moid = try(local.m1104["account_moid"], null)
  additional_properties = try(local.m1104["additional_properties"], null)
  class_id = try(local.m1104["class_id"], null)
  completed_time = try(local.m1104["completed_time"], null)
  create_time = try(local.m1104["create_time"], null)
  domain_group_moid = try(local.m1104["domain_group_moid"], null)
  id = try(local.m1104["id"], null)
  message = try(local.m1104["message"], null)
  mod_time = try(local.m1104["mod_time"], null)
  moid = try(local.m1104["moid"], null)
  object_type = try(local.m1104["object_type"], null)
  owner_id = try(local.m1104["owner_id"], null)
  owners = try(local.m1104["owners"], null)
  results = try(local.m1104["results"], null)
  shared_scope = try(local.m1104["shared_scope"], null)
  state = try(local.m1104["state"], null)
  type = try(local.m1104["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1104["ancestors"], null) == null ? [] : local.m1104["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m1104["config_result"], null) == null ? [] : local.m1104["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "context" {
    for_each = try(local.m1104["context"], null) == null ? [] : local.m1104["context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1104["parent"], null) == null ? [] : local.m1104["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1104["permission_resources"], null) == null ? [] : local.m1104["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1104["tags"], null) == null ? [] : local.m1104["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1104["version_context"], null) == null ? [] : local.m1104["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
