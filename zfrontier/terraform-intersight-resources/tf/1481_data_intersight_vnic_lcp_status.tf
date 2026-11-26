# Sample data source intersight_vnic_lcp_status — reads ../models/data_intersight_vnic_lcp_status.yml
locals { m1481 = yamldecode(file("${path.module}/../models/data_intersight_vnic_lcp_status.yml"))["data_intersight_vnic_lcp_status"] }

data "intersight_vnic_lcp_status" "n1481" {
  account_moid = try(local.m1481["account_moid"], null)
  additional_properties = try(local.m1481["additional_properties"], null)
  class_id = try(local.m1481["class_id"], null)
  create_time = try(local.m1481["create_time"], null)
  domain_group_moid = try(local.m1481["domain_group_moid"], null)
  id = try(local.m1481["id"], null)
  mod_time = try(local.m1481["mod_time"], null)
  moid = try(local.m1481["moid"], null)
  object_type = try(local.m1481["object_type"], null)
  owners = try(local.m1481["owners"], null)
  reason = try(local.m1481["reason"], null)
  results = try(local.m1481["results"], null)
  shared_scope = try(local.m1481["shared_scope"], null)
  status = try(local.m1481["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1481["ancestors"], null) == null ? [] : local.m1481["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1481["parent"], null) == null ? [] : local.m1481["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1481["permission_resources"], null) == null ? [] : local.m1481["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1481["profile"], null) == null ? [] : local.m1481["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1481["tags"], null) == null ? [] : local.m1481["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1481["version_context"], null) == null ? [] : local.m1481["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vnic_info" {
    for_each = try(local.m1481["vnic_info"], null) == null ? [] : local.m1481["vnic_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
