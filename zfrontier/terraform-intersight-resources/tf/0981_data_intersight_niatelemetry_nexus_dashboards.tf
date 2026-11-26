# Sample data source intersight_niatelemetry_nexus_dashboards — reads ../models/data_intersight_niatelemetry_nexus_dashboards.yml
locals { m981 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nexus_dashboards.yml"))["data_intersight_niatelemetry_nexus_dashboards"] }

data "intersight_niatelemetry_nexus_dashboards" "n981" {
  account_moid = try(local.m981["account_moid"], null)
  additional_properties = try(local.m981["additional_properties"], null)
  backup_status = try(local.m981["backup_status"], null)
  bandwidth_usage_monitoring = try(local.m981["bandwidth_usage_monitoring"], null)
  change_approval_count = try(local.m981["change_approval_count"], null)
  change_rollback_count = try(local.m981["change_rollback_count"], null)
  class_id = try(local.m981["class_id"], null)
  cluster_name = try(local.m981["cluster_name"], null)
  cluster_uuid = try(local.m981["cluster_uuid"], null)
  compliance_rules = try(local.m981["compliance_rules"], null)
  create_time = try(local.m981["create_time"], null)
  dashboard_count = try(local.m981["dashboard_count"], null)
  device_snapshots_count = try(local.m981["device_snapshots_count"], null)
  dn = try(local.m981["dn"], null)
  domain_group_moid = try(local.m981["domain_group_moid"], null)
  endpoint_count = try(local.m981["endpoint_count"], null)
  fabric_image_policies_count = try(local.m981["fabric_image_policies_count"], null)
  feature_oper_status = try(local.m981["feature_oper_status"], null)
  hs_integrations_count = try(local.m981["hs_integrations_count"], null)
  id = try(local.m981["id"], null)
  image_file_staging_count = try(local.m981["image_file_staging_count"], null)
  ipam_oper_state = try(local.m981["ipam_oper_state"], null)
  is_cluster_healthy = try(local.m981["is_cluster_healthy"], null)
  k8_visualizer_admin_state = try(local.m981["k8_visualizer_admin_state"], null)
  latest_version_list = try(local.m981["latest_version_list"], null)
  live_protect_enabled_count = try(local.m981["live_protect_enabled_count"], null)
  mod_time = try(local.m981["mod_time"], null)
  moid = try(local.m981["moid"], null)
  multicast_route_count = try(local.m981["multicast_route_count"], null)
  nd_cluster_size = try(local.m981["nd_cluster_size"], null)
  nd_healthy = try(local.m981["nd_healthy"], null)
  nd_type = try(local.m981["nd_type"], null)
  nd_version = try(local.m981["nd_version"], null)
  number_of_apps = try(local.m981["number_of_apps"], null)
  number_of_insight_groups = try(local.m981["number_of_insight_groups"], null)
  number_of_nir_dashboards = try(local.m981["number_of_nir_dashboards"], null)
  number_of_schemas_in_mso = try(local.m981["number_of_schemas_in_mso"], null)
  number_of_sites_in_mso = try(local.m981["number_of_sites_in_mso"], null)
  number_of_sites_serviced = try(local.m981["number_of_sites_serviced"], null)
  number_of_tenants_in_mso = try(local.m981["number_of_tenants_in_mso"], null)
  number_of_vxlan_fabric_sites_in_mso = try(local.m981["number_of_vxlan_fabric_sites_in_mso"], null)
  oam_enabled = try(local.m981["oam_enabled"], null)
  object_type = try(local.m981["object_type"], null)
  owners = try(local.m981["owners"], null)
  performance_monitoring = try(local.m981["performance_monitoring"], null)
  post_upgrade_report_generation_count = try(local.m981["post_upgrade_report_generation_count"], null)
  pre_upgrade_report_generation_count = try(local.m981["pre_upgrade_report_generation_count"], null)
  preupgrade_validation_count = try(local.m981["preupgrade_validation_count"], null)
  ptp_admin_state = try(local.m981["ptp_admin_state"], null)
  rec_version_list = try(local.m981["rec_version_list"], null)
  record_type = try(local.m981["record_type"], null)
  release_version = try(local.m981["release_version"], null)
  results = try(local.m981["results"], null)
  shared_scope = try(local.m981["shared_scope"], null)
  smart_switch_count = try(local.m981["smart_switch_count"], null)
  sustainability_report_status = try(local.m981["sustainability_report_status"], null)
  type_of_site_in_mso = try(local.m981["type_of_site_in_mso"], null)
  vcenter_count = try(local.m981["vcenter_count"], null)
  vmm_visualizer_admin_state = try(local.m981["vmm_visualizer_admin_state"], null)
  vx_lan_fab_count = try(local.m981["vx_lan_fab_count"], null)
  vx_lan_fab_names = try(local.m981["vx_lan_fab_names"], null)
  dynamic "ancestors" {
    for_each = try(local.m981["ancestors"], null) == null ? [] : local.m981["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nd_sites" {
    for_each = try(local.m981["nd_sites"], null) == null ? [] : local.m981["nd_sites"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m981["parent"], null) == null ? [] : local.m981["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m981["permission_resources"], null) == null ? [] : local.m981["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m981["registered_device"], null) == null ? [] : local.m981["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m981["tags"], null) == null ? [] : local.m981["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m981["version_context"], null) == null ? [] : local.m981["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
