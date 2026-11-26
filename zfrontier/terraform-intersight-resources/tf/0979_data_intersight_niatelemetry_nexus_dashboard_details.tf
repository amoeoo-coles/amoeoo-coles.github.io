# Sample data source intersight_niatelemetry_nexus_dashboard_details — reads ../models/data_intersight_niatelemetry_nexus_dashboard_details.yml
locals { m979 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nexus_dashboard_details.yml"))["data_intersight_niatelemetry_nexus_dashboard_details"] }

data "intersight_niatelemetry_nexus_dashboard_details" "n979" {
  account_moid = try(local.m979["account_moid"], null)
  additional_properties = try(local.m979["additional_properties"], null)
  class_id = try(local.m979["class_id"], null)
  cluster_name = try(local.m979["cluster_name"], null)
  create_time = try(local.m979["create_time"], null)
  device_model = try(local.m979["device_model"], null)
  domain_group_moid = try(local.m979["domain_group_moid"], null)
  id = try(local.m979["id"], null)
  mod_time = try(local.m979["mod_time"], null)
  moid = try(local.m979["moid"], null)
  nexus_dashboard_name = try(local.m979["nexus_dashboard_name"], null)
  nexus_dashboard_serial_number = try(local.m979["nexus_dashboard_serial_number"], null)
  object_type = try(local.m979["object_type"], null)
  owners = try(local.m979["owners"], null)
  results = try(local.m979["results"], null)
  shared_scope = try(local.m979["shared_scope"], null)
  type = try(local.m979["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m979["ancestors"], null) == null ? [] : local.m979["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m979["parent"], null) == null ? [] : local.m979["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m979["permission_resources"], null) == null ? [] : local.m979["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m979["registered_device"], null) == null ? [] : local.m979["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m979["tags"], null) == null ? [] : local.m979["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m979["version_context"], null) == null ? [] : local.m979["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
