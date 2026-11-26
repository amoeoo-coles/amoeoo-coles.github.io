# Sample data source intersight_recovery_restore — reads ../models/data_intersight_recovery_restore.yml
locals { m1106 = yamldecode(file("${path.module}/../models/data_intersight_recovery_restore.yml"))["data_intersight_recovery_restore"] }

data "intersight_recovery_restore" "n1106" {
  account_moid = try(local.m1106["account_moid"], null)
  additional_properties = try(local.m1106["additional_properties"], null)
  class_id = try(local.m1106["class_id"], null)
  create_time = try(local.m1106["create_time"], null)
  domain_group_moid = try(local.m1106["domain_group_moid"], null)
  id = try(local.m1106["id"], null)
  mod_time = try(local.m1106["mod_time"], null)
  moid = try(local.m1106["moid"], null)
  object_type = try(local.m1106["object_type"], null)
  owners = try(local.m1106["owners"], null)
  results = try(local.m1106["results"], null)
  shared_scope = try(local.m1106["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1106["ancestors"], null) == null ? [] : local.m1106["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_info" {
    for_each = try(local.m1106["backup_info"], null) == null ? [] : local.m1106["backup_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_params" {
    for_each = try(local.m1106["config_params"], null) == null ? [] : local.m1106["config_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m1106["device"], null) == null ? [] : local.m1106["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1106["organization"], null) == null ? [] : local.m1106["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1106["parent"], null) == null ? [] : local.m1106["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1106["permission_resources"], null) == null ? [] : local.m1106["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1106["tags"], null) == null ? [] : local.m1106["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1106["version_context"], null) == null ? [] : local.m1106["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m1106["workflow"], null) == null ? [] : local.m1106["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
