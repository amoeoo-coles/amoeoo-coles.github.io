# Sample data source intersight_partnerintegration_metrics — reads ../models/data_intersight_partnerintegration_metrics.yml
locals { m1058 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_metrics.yml"))["data_intersight_partnerintegration_metrics"] }

data "intersight_partnerintegration_metrics" "n1058" {
  account_moid = try(local.m1058["account_moid"], null)
  additional_properties = try(local.m1058["additional_properties"], null)
  class_id = try(local.m1058["class_id"], null)
  create_time = try(local.m1058["create_time"], null)
  domain_group_moid = try(local.m1058["domain_group_moid"], null)
  id = try(local.m1058["id"], null)
  mod_time = try(local.m1058["mod_time"], null)
  moid = try(local.m1058["moid"], null)
  name = try(local.m1058["name"], null)
  object_type = try(local.m1058["object_type"], null)
  owners = try(local.m1058["owners"], null)
  results = try(local.m1058["results"], null)
  shared_scope = try(local.m1058["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1058["ancestors"], null) == null ? [] : local.m1058["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "data" {
    for_each = try(local.m1058["data"], null) == null ? [] : local.m1058["data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory" {
    for_each = try(local.m1058["inventory"], null) == null ? [] : local.m1058["inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1058["parent"], null) == null ? [] : local.m1058["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1058["permission_resources"], null) == null ? [] : local.m1058["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1058["tags"], null) == null ? [] : local.m1058["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1058["version_context"], null) == null ? [] : local.m1058["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
