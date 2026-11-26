# Sample data source intersight_niatelemetry_apic_core_file_details — reads ../models/data_intersight_niatelemetry_apic_core_file_details.yml
locals { m915 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_core_file_details.yml"))["data_intersight_niatelemetry_apic_core_file_details"] }

data "intersight_niatelemetry_apic_core_file_details" "n915" {
  account_moid = try(local.m915["account_moid"], null)
  additional_properties = try(local.m915["additional_properties"], null)
  annotation = try(local.m915["annotation"], null)
  child_action = try(local.m915["child_action"], null)
  class_id = try(local.m915["class_id"], null)
  collection_time = try(local.m915["collection_time"], null)
  create_time = try(local.m915["create_time"], null)
  data_type = try(local.m915["data_type"], null)
  dn = try(local.m915["dn"], null)
  domain_group_moid = try(local.m915["domain_group_moid"], null)
  export_file_uri = try(local.m915["export_file_uri"], null)
  export_status = try(local.m915["export_status"], null)
  export_status_str = try(local.m915["export_status_str"], null)
  export_tech_sup_file_uri = try(local.m915["export_tech_sup_file_uri"], null)
  exported_to_controller = try(local.m915["exported_to_controller"], null)
  ext_mngd_by = try(local.m915["ext_mngd_by"], null)
  file_size = try(local.m915["file_size"], null)
  host_name = try(local.m915["host_name"], null)
  id = try(local.m915["id"], null)
  lc_own = try(local.m915["lc_own"], null)
  mod_time = try(local.m915["mod_time"], null)
  mod_ts = try(local.m915["mod_ts"], null)
  moid = try(local.m915["moid"], null)
  node_id = try(local.m915["node_id"], null)
  object_type = try(local.m915["object_type"], null)
  owners = try(local.m915["owners"], null)
  pol_name = try(local.m915["pol_name"], null)
  record_type = try(local.m915["record_type"], null)
  record_version = try(local.m915["record_version"], null)
  results = try(local.m915["results"], null)
  shared_scope = try(local.m915["shared_scope"], null)
  site_name = try(local.m915["site_name"], null)
  status = try(local.m915["status"], null)
  uid = try(local.m915["uid"], null)
  userdom = try(local.m915["userdom"], null)
  dynamic "ancestors" {
    for_each = try(local.m915["ancestors"], null) == null ? [] : local.m915["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m915["parent"], null) == null ? [] : local.m915["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m915["permission_resources"], null) == null ? [] : local.m915["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m915["registered_device"], null) == null ? [] : local.m915["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m915["tags"], null) == null ? [] : local.m915["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m915["version_context"], null) == null ? [] : local.m915["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
