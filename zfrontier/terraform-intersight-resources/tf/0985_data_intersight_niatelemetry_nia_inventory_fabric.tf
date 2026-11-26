# Sample data source intersight_niatelemetry_nia_inventory_fabric — reads ../models/data_intersight_niatelemetry_nia_inventory_fabric.yml
locals { m985 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nia_inventory_fabric.yml"))["data_intersight_niatelemetry_nia_inventory_fabric"] }

data "intersight_niatelemetry_nia_inventory_fabric" "n985" {
  account_moid = try(local.m985["account_moid"], null)
  additional_properties = try(local.m985["additional_properties"], null)
  anycast_gw_mac = try(local.m985["anycast_gw_mac"], null)
  bgp_established_interface_count = try(local.m985["bgp_established_interface_count"], null)
  bgw_count = try(local.m985["bgw_count"], null)
  bgw_interface_up_count = try(local.m985["bgw_interface_up_count"], null)
  border_gateway_spine_count = try(local.m985["border_gateway_spine_count"], null)
  border_leaf_count = try(local.m985["border_leaf_count"], null)
  class_id = try(local.m985["class_id"], null)
  cloudsec_autoconfig = try(local.m985["cloudsec_autoconfig"], null)
  create_time = try(local.m985["create_time"], null)
  dci_subnet_range = try(local.m985["dci_subnet_range"], null)
  dci_subnet_target_mask = try(local.m985["dci_subnet_target_mask"], null)
  dcnmtracker_enabled = try(local.m985["dcnmtracker_enabled"], null)
  domain_group_moid = try(local.m985["domain_group_moid"], null)
  ebgp_evpn_link_up_count = try(local.m985["ebgp_evpn_link_up_count"], null)
  fabric_id = try(local.m985["fabric_id"], null)
  fabric_name = try(local.m985["fabric_name"], null)
  fabric_parent = try(local.m985["fabric_parent"], null)
  fabric_technology = try(local.m985["fabric_technology"], null)
  fabric_type = try(local.m985["fabric_type"], null)
  feature_ptp = try(local.m985["feature_ptp"], null)
  id = try(local.m985["id"], null)
  is_bgw_present = try(local.m985["is_bgw_present"], null)
  is_enable_nxapi_http = try(local.m985["is_enable_nxapi_http"], null)
  is_enable_real_time_backup = try(local.m985["is_enable_real_time_backup"], null)
  is_ngoam_enabled = try(local.m985["is_ngoam_enabled"], null)
  is_scheduled_back_up_enabled = try(local.m985["is_scheduled_back_up_enabled"], null)
  is_trm_enabled = try(local.m985["is_trm_enabled"], null)
  leaf_count = try(local.m985["leaf_count"], null)
  link_state_routing = try(local.m985["link_state_routing"], null)
  link_type = try(local.m985["link_type"], null)
  mod_time = try(local.m985["mod_time"], null)
  moid = try(local.m985["moid"], null)
  network_deployment_count = try(local.m985["network_deployment_count"], null)
  ntp_server_ip_list = try(local.m985["ntp_server_ip_list"], null)
  nxos_vni_bw_sites_count = try(local.m985["nxos_vni_bw_sites_count"], null)
  nxos_vrf_bw_sites_count = try(local.m985["nxos_vrf_bw_sites_count"], null)
  nxos_vrf_count = try(local.m985["nxos_vrf_count"], null)
  object_type = try(local.m985["object_type"], null)
  oper_status = try(local.m985["oper_status"], null)
  owners = try(local.m985["owners"], null)
  record_type = try(local.m985["record_type"], null)
  record_version = try(local.m985["record_version"], null)
  replication_mode = try(local.m985["replication_mode"], null)
  results = try(local.m985["results"], null)
  rp_mode = try(local.m985["rp_mode"], null)
  serial = try(local.m985["serial"], null)
  shared_scope = try(local.m985["shared_scope"], null)
  site_name = try(local.m985["site_name"], null)
  software_image = try(local.m985["software_image"], null)
  spine_count = try(local.m985["spine_count"], null)
  syslog_server_ip_list = try(local.m985["syslog_server_ip_list"], null)
  syslog_sev = try(local.m985["syslog_sev"], null)
  template_name = try(local.m985["template_name"], null)
  vlan_vni_mappings = try(local.m985["vlan_vni_mappings"], null)
  vni_ip_count = try(local.m985["vni_ip_count"], null)
  vrf_deployment_count = try(local.m985["vrf_deployment_count"], null)
  xsite_network_count = try(local.m985["xsite_network_count"], null)
  xsite_vrf_count = try(local.m985["xsite_vrf_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m985["ancestors"], null) == null ? [] : local.m985["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "logical_links" {
    for_each = try(local.m985["logical_links"], null) == null ? [] : local.m985["logical_links"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_deployment_status" {
    for_each = try(local.m985["network_deployment_status"], null) == null ? [] : local.m985["network_deployment_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m985["parent"], null) == null ? [] : local.m985["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m985["permission_resources"], null) == null ? [] : local.m985["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m985["registered_device"], null) == null ? [] : local.m985["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m985["tags"], null) == null ? [] : local.m985["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m985["version_context"], null) == null ? [] : local.m985["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vpc_details" {
    for_each = try(local.m985["vpc_details"], null) == null ? [] : local.m985["vpc_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf_deployment_status" {
    for_each = try(local.m985["vrf_deployment_status"], null) == null ? [] : local.m985["vrf_deployment_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
