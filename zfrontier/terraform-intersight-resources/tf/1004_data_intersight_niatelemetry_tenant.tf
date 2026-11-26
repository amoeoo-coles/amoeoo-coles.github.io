# Sample data source intersight_niatelemetry_tenant — reads ../models/data_intersight_niatelemetry_tenant.yml
locals { m1004 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_tenant.yml"))["data_intersight_niatelemetry_tenant"] }

data "intersight_niatelemetry_tenant" "n1004" {
  account_moid = try(local.m1004["account_moid"], null)
  additional_properties = try(local.m1004["additional_properties"], null)
  bfd_if_pol_count = try(local.m1004["bfd_if_pol_count"], null)
  bfd_ifp_count = try(local.m1004["bfd_ifp_count"], null)
  class_id = try(local.m1004["class_id"], null)
  create_time = try(local.m1004["create_time"], null)
  dhcp_rs_prov_count = try(local.m1004["dhcp_rs_prov_count"], null)
  dn = try(local.m1004["dn"], null)
  domain_group_moid = try(local.m1004["domain_group_moid"], null)
  fhs_bd_pol_count = try(local.m1004["fhs_bd_pol_count"], null)
  fv_ap_count = try(local.m1004["fv_ap_count"], null)
  fv_bd_count = try(local.m1004["fv_bd_count"], null)
  fv_bd_subnet_count = try(local.m1004["fv_bd_subnet_count"], null)
  fv_bdno_arp_count = try(local.m1004["fv_bdno_arp_count"], null)
  fv_cep_count = try(local.m1004["fv_cep_count"], null)
  fv_rs_bd_to_fhs_count = try(local.m1004["fv_rs_bd_to_fhs_count"], null)
  fv_rs_bd_to_out_count = try(local.m1004["fv_rs_bd_to_out_count"], null)
  fv_site_connp_count = try(local.m1004["fv_site_connp_count"], null)
  fv_subnet_count = try(local.m1004["fv_subnet_count"], null)
  id = try(local.m1004["id"], null)
  ip_static_route_count = try(local.m1004["ip_static_route_count"], null)
  l3_multicast_count = try(local.m1004["l3_multicast_count"], null)
  l3_multicast_ctx_count = try(local.m1004["l3_multicast_ctx_count"], null)
  l3_multicast_if_count = try(local.m1004["l3_multicast_if_count"], null)
  l3out_count = try(local.m1004["l3out_count"], null)
  mod_time = try(local.m1004["mod_time"], null)
  moid = try(local.m1004["moid"], null)
  object_type = try(local.m1004["object_type"], null)
  owners = try(local.m1004["owners"], null)
  qos_custom_pol_count = try(local.m1004["qos_custom_pol_count"], null)
  record_type = try(local.m1004["record_type"], null)
  record_version = try(local.m1004["record_version"], null)
  results = try(local.m1004["results"], null)
  shared_scope = try(local.m1004["shared_scope"], null)
  site_name = try(local.m1004["site_name"], null)
  ssm = try(local.m1004["ssm"], null)
  ssm_count = try(local.m1004["ssm_count"], null)
  tcam_opt_count = try(local.m1004["tcam_opt_count"], null)
  tenant_health = try(local.m1004["tenant_health"], null)
  trace_route_ep_count = try(local.m1004["trace_route_ep_count"], null)
  trace_route_ep_ext_count = try(local.m1004["trace_route_ep_ext_count"], null)
  trace_route_ext_ep_count = try(local.m1004["trace_route_ext_ep_count"], null)
  trace_route_ext_ext_count = try(local.m1004["trace_route_ext_ext_count"], null)
  vns_abs_graph_count = try(local.m1004["vns_abs_graph_count"], null)
  vns_backup_pol_count = try(local.m1004["vns_backup_pol_count"], null)
  vns_redirect_dest_count = try(local.m1004["vns_redirect_dest_count"], null)
  vns_svc_redirect_pol_count = try(local.m1004["vns_svc_redirect_pol_count"], null)
  vrf_count = try(local.m1004["vrf_count"], null)
  vz_br_cp_count = try(local.m1004["vz_br_cp_count"], null)
  vz_rt_cons_count = try(local.m1004["vz_rt_cons_count"], null)
  vz_rt_prov_count = try(local.m1004["vz_rt_prov_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1004["ancestors"], null) == null ? [] : local.m1004["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1004["parent"], null) == null ? [] : local.m1004["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1004["permission_resources"], null) == null ? [] : local.m1004["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1004["registered_device"], null) == null ? [] : local.m1004["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1004["tags"], null) == null ? [] : local.m1004["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1004["version_context"], null) == null ? [] : local.m1004["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
