# Sample data source intersight_niatelemetry_nexus_dashboard_controller_details — reads ../models/data_intersight_niatelemetry_nexus_dashboard_controller_details.yml
locals { m978 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nexus_dashboard_controller_details.yml"))["data_intersight_niatelemetry_nexus_dashboard_controller_details"] }

data "intersight_niatelemetry_nexus_dashboard_controller_details" "n978" {
  account_moid = try(local.m978["account_moid"], null)
  additional_properties = try(local.m978["additional_properties"], null)
  class_id = try(local.m978["class_id"], null)
  create_time = try(local.m978["create_time"], null)
  domain_group_moid = try(local.m978["domain_group_moid"], null)
  id = try(local.m978["id"], null)
  mod_time = try(local.m978["mod_time"], null)
  moid = try(local.m978["moid"], null)
  object_type = try(local.m978["object_type"], null)
  owners = try(local.m978["owners"], null)
  results = try(local.m978["results"], null)
  shared_scope = try(local.m978["shared_scope"], null)
  site_health = try(local.m978["site_health"], null)
  site_name = try(local.m978["site_name"], null)
  version_of_controller = try(local.m978["version_of_controller"], null)
  dynamic "ancestors" {
    for_each = try(local.m978["ancestors"], null) == null ? [] : local.m978["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nexus_dashboard" {
    for_each = try(local.m978["nexus_dashboard"], null) == null ? [] : local.m978["nexus_dashboard"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m978["parent"], null) == null ? [] : local.m978["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m978["permission_resources"], null) == null ? [] : local.m978["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m978["registered_device"], null) == null ? [] : local.m978["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m978["tags"], null) == null ? [] : local.m978["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m978["version_context"], null) == null ? [] : local.m978["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
