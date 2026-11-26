# Sample data source intersight_vnic_scp_status — reads ../models/data_intersight_vnic_scp_status.yml
locals { m1485 = yamldecode(file("${path.module}/../models/data_intersight_vnic_scp_status.yml"))["data_intersight_vnic_scp_status"] }

data "intersight_vnic_scp_status" "n1485" {
  account_moid = try(local.m1485["account_moid"], null)
  additional_properties = try(local.m1485["additional_properties"], null)
  class_id = try(local.m1485["class_id"], null)
  create_time = try(local.m1485["create_time"], null)
  domain_group_moid = try(local.m1485["domain_group_moid"], null)
  id = try(local.m1485["id"], null)
  mod_time = try(local.m1485["mod_time"], null)
  moid = try(local.m1485["moid"], null)
  object_type = try(local.m1485["object_type"], null)
  owners = try(local.m1485["owners"], null)
  reason = try(local.m1485["reason"], null)
  results = try(local.m1485["results"], null)
  shared_scope = try(local.m1485["shared_scope"], null)
  status = try(local.m1485["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1485["ancestors"], null) == null ? [] : local.m1485["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1485["parent"], null) == null ? [] : local.m1485["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1485["permission_resources"], null) == null ? [] : local.m1485["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1485["profile"], null) == null ? [] : local.m1485["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1485["tags"], null) == null ? [] : local.m1485["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1485["version_context"], null) == null ? [] : local.m1485["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vhba_info" {
    for_each = try(local.m1485["vhba_info"], null) == null ? [] : local.m1485["vhba_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
