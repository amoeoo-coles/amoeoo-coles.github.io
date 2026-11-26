# Sample data source intersight_vnic_iscsi_static_target_policy — reads ../models/data_intersight_vnic_iscsi_static_target_policy.yml
locals { m1476 = yamldecode(file("${path.module}/../models/data_intersight_vnic_iscsi_static_target_policy.yml"))["data_intersight_vnic_iscsi_static_target_policy"] }

data "intersight_vnic_iscsi_static_target_policy" "n1476" {
  account_moid = try(local.m1476["account_moid"], null)
  additional_properties = try(local.m1476["additional_properties"], null)
  class_id = try(local.m1476["class_id"], null)
  create_time = try(local.m1476["create_time"], null)
  description = try(local.m1476["description"], null)
  domain_group_moid = try(local.m1476["domain_group_moid"], null)
  id = try(local.m1476["id"], null)
  ip_address = try(local.m1476["ip_address"], null)
  iscsi_ip_type = try(local.m1476["iscsi_ip_type"], null)
  mod_time = try(local.m1476["mod_time"], null)
  moid = try(local.m1476["moid"], null)
  name = try(local.m1476["name"], null)
  object_type = try(local.m1476["object_type"], null)
  owners = try(local.m1476["owners"], null)
  port = try(local.m1476["port"], null)
  results = try(local.m1476["results"], null)
  shared_scope = try(local.m1476["shared_scope"], null)
  target_name = try(local.m1476["target_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1476["ancestors"], null) == null ? [] : local.m1476["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lun" {
    for_each = try(local.m1476["lun"], null) == null ? [] : local.m1476["lun"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1476["organization"], null) == null ? [] : local.m1476["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1476["parent"], null) == null ? [] : local.m1476["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1476["permission_resources"], null) == null ? [] : local.m1476["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1476["tags"], null) == null ? [] : local.m1476["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1476["version_context"], null) == null ? [] : local.m1476["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
