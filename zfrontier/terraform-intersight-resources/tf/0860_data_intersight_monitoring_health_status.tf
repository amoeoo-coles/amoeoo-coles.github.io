# Sample data source intersight_monitoring_health_status — reads ../models/data_intersight_monitoring_health_status.yml
locals { m860 = yamldecode(file("${path.module}/../models/data_intersight_monitoring_health_status.yml"))["data_intersight_monitoring_health_status"] }

data "intersight_monitoring_health_status" "n860" {
  account_moid = try(local.m860["account_moid"], null)
  additional_properties = try(local.m860["additional_properties"], null)
  class_id = try(local.m860["class_id"], null)
  create_time = try(local.m860["create_time"], null)
  domain_group_moid = try(local.m860["domain_group_moid"], null)
  health_data_schema_version = try(local.m860["health_data_schema_version"], null)
  id = try(local.m860["id"], null)
  mod_time = try(local.m860["mod_time"], null)
  moid = try(local.m860["moid"], null)
  nr_source = try(local.m860["nr_source"], null)
  object_type = try(local.m860["object_type"], null)
  owners = try(local.m860["owners"], null)
  results = try(local.m860["results"], null)
  shared_scope = try(local.m860["shared_scope"], null)
  status_time_stamp = try(local.m860["status_time_stamp"], null)
  dynamic "ancestors" {
    for_each = try(local.m860["ancestors"], null) == null ? [] : local.m860["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "category_status" {
    for_each = try(local.m860["category_status"], null) == null ? [] : local.m860["category_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m860["organization"], null) == null ? [] : local.m860["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m860["parent"], null) == null ? [] : local.m860["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m860["permission_resources"], null) == null ? [] : local.m860["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m860["tags"], null) == null ? [] : local.m860["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m860["version_context"], null) == null ? [] : local.m860["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
