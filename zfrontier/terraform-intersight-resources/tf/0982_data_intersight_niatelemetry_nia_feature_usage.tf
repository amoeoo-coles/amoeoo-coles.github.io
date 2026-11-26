# Sample data source intersight_niatelemetry_nia_feature_usage — reads ../models/data_intersight_niatelemetry_nia_feature_usage.yml
locals { m982 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nia_feature_usage.yml"))["data_intersight_niatelemetry_nia_feature_usage"] }

data "intersight_niatelemetry_nia_feature_usage" "n982" {
  aaa_ldap_provider_count = try(local.m982["aaa_ldap_provider_count"], null)
  aaa_radius_provider_count = try(local.m982["aaa_radius_provider_count"], null)
  aaa_tacacs_provider_count = try(local.m982["aaa_tacacs_provider_count"], null)
  account_moid = try(local.m982["account_moid"], null)
  additional_properties = try(local.m982["additional_properties"], null)
  apic_cluster_health = try(local.m982["apic_cluster_health"], null)
  apic_count = try(local.m982["apic_count"], null)
  apic_is_telnet_enabled = try(local.m982["apic_is_telnet_enabled"], null)
  apic_ntp_count = try(local.m982["apic_ntp_count"], null)
  apic_snmp_community_count = try(var.secrets["data_intersight_niatelemetry_nia_feature_usage.apic_snmp_community_count"], local.m982["apic_snmp_community_count"])
  apic_sys_log_grp_count = try(local.m982["apic_sys_log_grp_count"], null)
  apic_sys_log_src_count = try(local.m982["apic_sys_log_src_count"], null)
  app_center_count = try(local.m982["app_center_count"], null)
  ave = try(local.m982["ave"], null)
  bd_count = try(local.m982["bd_count"], null)
  callhome_smart_group_count = try(local.m982["callhome_smart_group_count"], null)
  class_id = try(local.m982["class_id"], null)
  cloud_sec_peer_count = try(local.m982["cloud_sec_peer_count"], null)
  cloud_tenant_count = try(local.m982["cloud_tenant_count"], null)
  comp_hv_count = try(local.m982["comp_hv_count"], null)
  config_exportp_count = try(local.m982["config_exportp_count"], null)
  config_job_count = try(local.m982["config_job_count"], null)
  consistency_checker_app = try(local.m982["consistency_checker_app"], null)
  contract_count = try(local.m982["contract_count"], null)
  create_time = try(local.m982["create_time"], null)
  dns_count = try(local.m982["dns_count"], null)
  domain_group_moid = try(local.m982["domain_group_moid"], null)
  eigrp_count = try(local.m982["eigrp_count"], null)
  epg_count = try(local.m982["epg_count"], null)
  fabric_module_count = try(local.m982["fabric_module_count"], null)
  fabric_setupp_count = try(local.m982["fabric_setupp_count"], null)
  fcoe_nport_count = try(local.m982["fcoe_nport_count"], null)
  fcoe_nport_dom_count = try(local.m982["fcoe_nport_dom_count"], null)
  fcoe_nport_vlan_count = try(local.m982["fcoe_nport_vlan_count"], null)
  fcoe_nport_vsan_count = try(local.m982["fcoe_nport_vsan_count"], null)
  fv_sla_def_count = try(local.m982["fv_sla_def_count"], null)
  hsrp_count = try(local.m982["hsrp_count"], null)
  ibgp_count = try(local.m982["ibgp_count"], null)
  id = try(local.m982["id"], null)
  igmp_access_list_count = try(local.m982["igmp_access_list_count"], null)
  igmp_snoop = try(local.m982["igmp_snoop"], null)
  ip_epg_count = try(local.m982["ip_epg_count"], null)
  is_bgp_route_reflectors_feature_used = try(local.m982["is_bgp_route_reflectors_feature_used"], null)
  is_bridge_domains_feature_used = try(local.m982["is_bridge_domains_feature_used"], null)
  is_common_local_user_name = try(local.m982["is_common_local_user_name"], null)
  is_contracts_feature_used = try(local.m982["is_contracts_feature_used"], null)
  is_epg_feature_used = try(local.m982["is_epg_feature_used"], null)
  is_filters_feature_used = try(local.m982["is_filters_feature_used"], null)
  is_http_configured = try(local.m982["is_http_configured"], null)
  is_https_configured = try(local.m982["is_https_configured"], null)
  is_ntp_feature_used = try(local.m982["is_ntp_feature_used"], null)
  is_ptp_feature_used = try(local.m982["is_ptp_feature_used"], null)
  is_synce_feature_used = try(local.m982["is_synce_feature_used"], null)
  is_tech_support_collected = try(local.m982["is_tech_support_collected"], null)
  is_tenants_feature_used = try(local.m982["is_tenants_feature_used"], null)
  is_vrfs_feature_used = try(local.m982["is_vrfs_feature_used"], null)
  isis_count = try(local.m982["isis_count"], null)
  l2_multicast = try(local.m982["l2_multicast"], null)
  latency_ptp_mode = try(local.m982["latency_ptp_mode"], null)
  leaf_count = try(local.m982["leaf_count"], null)
  local_username_count = try(local.m982["local_username_count"], null)
  login_block_duration = try(local.m982["login_block_duration"], null)
  login_max_failed_attempts = try(local.m982["login_max_failed_attempts"], null)
  login_max_failed_attempts_window = try(local.m982["login_max_failed_attempts_window"], null)
  maintenance_mode_count = try(local.m982["maintenance_mode_count"], null)
  management_over_v6_count = try(local.m982["management_over_v6_count"], null)
  microsoft_useg_vmm_ep_pd_count = try(local.m982["microsoft_useg_vmm_ep_pd_count"], null)
  mod_time = try(local.m982["mod_time"], null)
  moid = try(local.m982["moid"], null)
  net_flow_count = try(local.m982["net_flow_count"], null)
  nir = try(local.m982["nir"], null)
  object_type = try(local.m982["object_type"], null)
  open_stack = try(local.m982["open_stack"], null)
  opflex_kubernetes_count = try(local.m982["opflex_kubernetes_count"], null)
  ospf_count = try(local.m982["ospf_count"], null)
  owners = try(local.m982["owners"], null)
  password_history_count = try(var.secrets["data_intersight_niatelemetry_nia_feature_usage.password_history_count"], local.m982["password_history_count"])
  password_strength_check = try(var.secrets["data_intersight_niatelemetry_nia_feature_usage.password_strength_check"], local.m982["password_strength_check"])
  password_strength_profile_count = try(var.secrets["data_intersight_niatelemetry_nia_feature_usage.password_strength_profile_count"], local.m982["password_strength_profile_count"])
  poe_count = try(local.m982["poe_count"], null)
  port_security_count = try(local.m982["port_security_count"], null)
  qin_vni_tunnel_count = try(local.m982["qin_vni_tunnel_count"], null)
  qos_cong_count = try(local.m982["qos_cong_count"], null)
  qos_pfc_pol_count = try(local.m982["qos_pfc_pol_count"], null)
  realm_count = try(local.m982["realm_count"], null)
  record_type = try(local.m982["record_type"], null)
  record_version = try(local.m982["record_version"], null)
  remote_leaf_count = try(local.m982["remote_leaf_count"], null)
  results = try(local.m982["results"], null)
  scvmm_count = try(local.m982["scvmm_count"], null)
  shared_l3_out_count = try(local.m982["shared_l3_out_count"], null)
  shared_scope = try(local.m982["shared_scope"], null)
  site_name = try(local.m982["site_name"], null)
  smart_call_home = try(local.m982["smart_call_home"], null)
  snapshot_count = try(local.m982["snapshot_count"], null)
  snmp = try(local.m982["snmp"], null)
  snmp_community_access_count = try(var.secrets["data_intersight_niatelemetry_nia_feature_usage.snmp_community_access_count"], local.m982["snmp_community_access_count"])
  snmp_group_count = try(local.m982["snmp_group_count"], null)
  snmp_trap_count = try(local.m982["snmp_trap_count"], null)
  snmp_v3_count = try(local.m982["snmp_v3_count"], null)
  span_count = try(local.m982["span_count"], null)
  span_dst_count = try(local.m982["span_dst_count"], null)
  span_src_count = try(local.m982["span_src_count"], null)
  spine_count = try(local.m982["spine_count"], null)
  ssh_over_v6_count = try(local.m982["ssh_over_v6_count"], null)
  ssh_v2_count = try(local.m982["ssh_v2_count"], null)
  supervisor_module_count = try(local.m982["supervisor_module_count"], null)
  syslog_group_count = try(local.m982["syslog_group_count"], null)
  syslog_over_v6_count = try(local.m982["syslog_over_v6_count"], null)
  system_controller_count = try(local.m982["system_controller_count"], null)
  tacacs_group_count = try(local.m982["tacacs_group_count"], null)
  tenant_count = try(local.m982["tenant_count"], null)
  tier_two_leaf_count = try(local.m982["tier_two_leaf_count"], null)
  total_critical_faults = try(local.m982["total_critical_faults"], null)
  twamp = try(local.m982["twamp"], null)
  useg = try(local.m982["useg"], null)
  vm_ware_vds_count = try(local.m982["vm_ware_vds_count"], null)
  vmm_ctrlrp_count = try(local.m982["vmm_ctrlrp_count"], null)
  vmm_domp_count = try(local.m982["vmm_domp_count"], null)
  vmm_ep_pd_count = try(local.m982["vmm_ep_pd_count"], null)
  vnsm_dev_count = try(local.m982["vnsm_dev_count"], null)
  vpod_count = try(local.m982["vpod_count"], null)
  webtoken_timeout_seconds = try(var.secrets["data_intersight_niatelemetry_nia_feature_usage.webtoken_timeout_seconds"], local.m982["webtoken_timeout_seconds"])
  dynamic "ancestors" {
    for_each = try(local.m982["ancestors"], null) == null ? [] : local.m982["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m982["parent"], null) == null ? [] : local.m982["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m982["permission_resources"], null) == null ? [] : local.m982["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m982["registered_device"], null) == null ? [] : local.m982["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "smart_license" {
    for_each = try(local.m982["smart_license"], null) == null ? [] : local.m982["smart_license"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m982["tags"], null) == null ? [] : local.m982["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m982["version_context"], null) == null ? [] : local.m982["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
