# Sample data source intersight_niatelemetry_epg — reads ../models/data_intersight_niatelemetry_epg.yml
locals { m950 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_epg.yml"))["data_intersight_niatelemetry_epg"] }

data "intersight_niatelemetry_epg" "n950" {
  account_moid = try(local.m950["account_moid"], null)
  additional_properties = try(local.m950["additional_properties"], null)
  azure_pack_count = try(local.m950["azure_pack_count"], null)
  class_id = try(local.m950["class_id"], null)
  create_time = try(local.m950["create_time"], null)
  dn = try(local.m950["dn"], null)
  domain_group_moid = try(local.m950["domain_group_moid"], null)
  epg_delimiter_count = try(local.m950["epg_delimiter_count"], null)
  fc_npv_count = try(local.m950["fc_npv_count"], null)
  fcoe_count = try(local.m950["fcoe_count"], null)
  fv_rs_dom_att_count = try(local.m950["fv_rs_dom_att_count"], null)
  id = try(local.m950["id"], null)
  intra_epg_dvs_bm_count = try(local.m950["intra_epg_dvs_bm_count"], null)
  intra_epg_hyperv = try(local.m950["intra_epg_hyperv"], null)
  is_attr_based = try(local.m950["is_attr_based"], null)
  microsegmentation = try(local.m950["microsegmentation"], null)
  microsoft_useg_count = try(local.m950["microsoft_useg_count"], null)
  mod_time = try(local.m950["mod_time"], null)
  moid = try(local.m950["moid"], null)
  name = try(local.m950["name"], null)
  object_type = try(local.m950["object_type"], null)
  orchsl_dev_vip_cfg_count = try(local.m950["orchsl_dev_vip_cfg_count"], null)
  owners = try(local.m950["owners"], null)
  record_type = try(local.m950["record_type"], null)
  record_version = try(local.m950["record_version"], null)
  results = try(local.m950["results"], null)
  shared_scope = try(local.m950["shared_scope"], null)
  site_name = try(local.m950["site_name"], null)
  useg_hyperv_count = try(local.m950["useg_hyperv_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m950["ancestors"], null) == null ? [] : local.m950["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m950["parent"], null) == null ? [] : local.m950["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m950["permission_resources"], null) == null ? [] : local.m950["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m950["registered_device"], null) == null ? [] : local.m950["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m950["tags"], null) == null ? [] : local.m950["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m950["version_context"], null) == null ? [] : local.m950["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
