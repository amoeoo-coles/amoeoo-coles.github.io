# Sample data source intersight_niatelemetry_nia_inventory_dcnm — reads ../models/data_intersight_niatelemetry_nia_inventory_dcnm.yml
locals { m984 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nia_inventory_dcnm.yml"))["data_intersight_niatelemetry_nia_inventory_dcnm"] }

data "intersight_niatelemetry_nia_inventory_dcnm" "n984" {
  account_moid = try(local.m984["account_moid"], null)
  additional_properties = try(local.m984["additional_properties"], null)
  class_id = try(local.m984["class_id"], null)
  controller_health = try(local.m984["controller_health"], null)
  create_time = try(local.m984["create_time"], null)
  dev = try(local.m984["dev"], null)
  domain_group_moid = try(local.m984["domain_group_moid"], null)
  epld_image_count = try(local.m984["epld_image_count"], null)
  ha_enabled = try(local.m984["ha_enabled"], null)
  ha_replication_status = try(local.m984["ha_replication_status"], null)
  id = try(local.m984["id"], null)
  install = try(local.m984["install"], null)
  installation_type = try(local.m984["installation_type"], null)
  installation_type_description = try(local.m984["installation_type_description"], null)
  is_isn_configured = try(local.m984["is_isn_configured"], null)
  is_media_controller = try(local.m984["is_media_controller"], null)
  is_smart_license_enabled = try(local.m984["is_smart_license_enabled"], null)
  mod_time = try(local.m984["mod_time"], null)
  mode = try(local.m984["mode"], null)
  moid = try(local.m984["moid"], null)
  ndfc_fabric_name = try(local.m984["ndfc_fabric_name"], null)
  ndfc_oper_state = try(local.m984["ndfc_oper_state"], null)
  nr_version = try(local.m984["nr_version"], null)
  num_dcnm_site = try(local.m984["num_dcnm_site"], null)
  num_fabrics = try(local.m984["num_fabrics"], null)
  num_fabrics_in_msd = try(local.m984["num_fabrics_in_msd"], null)
  num_ingress_replication_fabrics = try(local.m984["num_ingress_replication_fabrics"], null)
  num_local_users = try(local.m984["num_local_users"], null)
  num_msd = try(local.m984["num_msd"], null)
  num_svi_vrf_count = try(local.m984["num_svi_vrf_count"], null)
  num_trm_enabled_count = try(local.m984["num_trm_enabled_count"], null)
  num_upg_users = try(local.m984["num_upg_users"], null)
  nxos_image_count = try(local.m984["nxos_image_count"], null)
  object_type = try(local.m984["object_type"], null)
  outofband_ip = try(local.m984["outofband_ip"], null)
  owners = try(local.m984["owners"], null)
  record_type = try(local.m984["record_type"], null)
  record_version = try(local.m984["record_version"], null)
  results = try(local.m984["results"], null)
  serial = try(local.m984["serial"], null)
  shared_scope = try(local.m984["shared_scope"], null)
  site_name = try(local.m984["site_name"], null)
  underlay_peering_active_links_count = try(local.m984["underlay_peering_active_links_count"], null)
  upg_job_count = try(local.m984["upg_job_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m984["ancestors"], null) == null ? [] : local.m984["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "golden_image_details" {
    for_each = try(local.m984["golden_image_details"], null) == null ? [] : local.m984["golden_image_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_info" {
    for_each = try(local.m984["network_info"], null) == null ? [] : local.m984["network_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m984["parent"], null) == null ? [] : local.m984["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m984["permission_resources"], null) == null ? [] : local.m984["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m984["registered_device"], null) == null ? [] : local.m984["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m984["tags"], null) == null ? [] : local.m984["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upg_status" {
    for_each = try(local.m984["upg_status"], null) == null ? [] : local.m984["upg_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m984["version_context"], null) == null ? [] : local.m984["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
