# Sample data source intersight_niatelemetry_site_inventory — reads ../models/data_intersight_niatelemetry_site_inventory.yml
locals { m993 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_site_inventory.yml"))["data_intersight_niatelemetry_site_inventory"] }

data "intersight_niatelemetry_site_inventory" "n993" {
  account_moid = try(local.m993["account_moid"], null)
  additional_properties = try(local.m993["additional_properties"], null)
  apps = try(local.m993["apps"], null)
  class_id = try(local.m993["class_id"], null)
  configuration_change_tracking_count = try(local.m993["configuration_change_tracking_count"], null)
  connectivity_analysis_count = try(local.m993["connectivity_analysis_count"], null)
  create_time = try(local.m993["create_time"], null)
  domain_group_moid = try(local.m993["domain_group_moid"], null)
  dpu_count = try(local.m993["dpu_count"], null)
  endpoint_locator_count = try(local.m993["endpoint_locator_count"], null)
  fabric_technology = try(local.m993["fabric_technology"], null)
  fabric_update_status = try(local.m993["fabric_update_status"], null)
  firmware_version = try(local.m993["firmware_version"], null)
  id = try(local.m993["id"], null)
  install_type = try(local.m993["install_type"], null)
  ip_address = try(local.m993["ip_address"], null)
  mod_time = try(local.m993["mod_time"], null)
  moid = try(local.m993["moid"], null)
  name = try(local.m993["name"], null)
  nexus_dashboard = try(local.m993["nexus_dashboard"], null)
  nodes = try(local.m993["nodes"], null)
  object_type = try(local.m993["object_type"], null)
  on_demand_backups = try(local.m993["on_demand_backups"], null)
  owners = try(local.m993["owners"], null)
  perimeter_service = try(local.m993["perimeter_service"], null)
  record_type = try(local.m993["record_type"], null)
  redirect_to_service_chain = try(local.m993["redirect_to_service_chain"], null)
  results = try(local.m993["results"], null)
  scheduled_backups = try(local.m993["scheduled_backups"], null)
  security_groups_count = try(local.m993["security_groups_count"], null)
  service_as_gateway = try(local.m993["service_as_gateway"], null)
  service_clusters_count = try(local.m993["service_clusters_count"], null)
  service_function_count = try(local.m993["service_function_count"], null)
  service_insertion_count = try(local.m993["service_insertion_count"], null)
  shared_scope = try(local.m993["shared_scope"], null)
  sum_count = try(local.m993["sum_count"], null)
  switch_count = try(local.m993["switch_count"], null)
  total_networks = try(local.m993["total_networks"], null)
  total_vrfs = try(local.m993["total_vrfs"], null)
  type = try(local.m993["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m993["ancestors"], null) == null ? [] : local.m993["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m993["parent"], null) == null ? [] : local.m993["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m993["permission_resources"], null) == null ? [] : local.m993["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m993["registered_device"], null) == null ? [] : local.m993["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m993["tags"], null) == null ? [] : local.m993["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m993["version_context"], null) == null ? [] : local.m993["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
