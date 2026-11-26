# Sample data source intersight_hyperflex_health — reads ../models/data_intersight_hyperflex_health.yml
locals { m603 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_health.yml"))["data_intersight_hyperflex_health"] }

data "intersight_hyperflex_health" "n603" {
  account_moid = try(local.m603["account_moid"], null)
  additional_properties = try(local.m603["additional_properties"], null)
  arbitration_service_state = try(local.m603["arbitration_service_state"], null)
  class_id = try(local.m603["class_id"], null)
  create_time = try(local.m603["create_time"], null)
  data_replication_compliance = try(local.m603["data_replication_compliance"], null)
  domain_group_moid = try(local.m603["domain_group_moid"], null)
  id = try(local.m603["id"], null)
  mod_time = try(local.m603["mod_time"], null)
  moid = try(local.m603["moid"], null)
  object_type = try(local.m603["object_type"], null)
  owners = try(local.m603["owners"], null)
  results = try(local.m603["results"], null)
  shared_scope = try(local.m603["shared_scope"], null)
  state = try(local.m603["state"], null)
  uuid = try(local.m603["uuid"], null)
  zk_health = try(local.m603["zk_health"], null)
  dynamic "ancestors" {
    for_each = try(local.m603["ancestors"], null) == null ? [] : local.m603["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m603["cluster"], null) == null ? [] : local.m603["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m603["parent"], null) == null ? [] : local.m603["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m603["permission_resources"], null) == null ? [] : local.m603["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resiliency_details" {
    for_each = try(local.m603["resiliency_details"], null) == null ? [] : local.m603["resiliency_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m603["tags"], null) == null ? [] : local.m603["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m603["version_context"], null) == null ? [] : local.m603["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "zone_resiliency_list" {
    for_each = try(local.m603["zone_resiliency_list"], null) == null ? [] : local.m603["zone_resiliency_list"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
