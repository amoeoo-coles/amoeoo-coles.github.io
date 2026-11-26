# Sample data source intersight_os_valid_remote_target — reads ../models/data_intersight_os_valid_remote_target.yml
locals { m1044 = yamldecode(file("${path.module}/../models/data_intersight_os_valid_remote_target.yml"))["data_intersight_os_valid_remote_target"] }

data "intersight_os_valid_remote_target" "n1044" {
  account_moid = try(local.m1044["account_moid"], null)
  additional_properties = try(local.m1044["additional_properties"], null)
  class_id = try(local.m1044["class_id"], null)
  create_time = try(local.m1044["create_time"], null)
  domain_group_moid = try(local.m1044["domain_group_moid"], null)
  id = try(local.m1044["id"], null)
  mod_time = try(local.m1044["mod_time"], null)
  moid = try(local.m1044["moid"], null)
  object_type = try(local.m1044["object_type"], null)
  owners = try(local.m1044["owners"], null)
  results = try(local.m1044["results"], null)
  shared_scope = try(local.m1044["shared_scope"], null)
  src = try(local.m1044["src"], null)
  dynamic "ancestors" {
    for_each = try(local.m1044["ancestors"], null) == null ? [] : local.m1044["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fibre_channel_luns" {
    for_each = try(local.m1044["fibre_channel_luns"], null) == null ? [] : local.m1044["fibre_channel_luns"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iscsi_luns" {
    for_each = try(local.m1044["iscsi_luns"], null) == null ? [] : local.m1044["iscsi_luns"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1044["parent"], null) == null ? [] : local.m1044["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1044["permission_resources"], null) == null ? [] : local.m1044["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m1044["server"], null) == null ? [] : local.m1044["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1044["tags"], null) == null ? [] : local.m1044["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1044["version_context"], null) == null ? [] : local.m1044["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
