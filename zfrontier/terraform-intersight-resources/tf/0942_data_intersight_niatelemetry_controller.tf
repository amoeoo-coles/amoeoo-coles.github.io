# Sample data source intersight_niatelemetry_controller — reads ../models/data_intersight_niatelemetry_controller.yml
locals { m942 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_controller.yml"))["data_intersight_niatelemetry_controller"] }

data "intersight_niatelemetry_controller" "n942" {
  account_moid = try(local.m942["account_moid"], null)
  additional_properties = try(local.m942["additional_properties"], null)
  anomaly_status = try(local.m942["anomaly_status"], null)
  class_id = try(local.m942["class_id"], null)
  compliance_status = try(local.m942["compliance_status"], null)
  create_time = try(local.m942["create_time"], null)
  domain_group_moid = try(local.m942["domain_group_moid"], null)
  fabric_type = try(local.m942["fabric_type"], null)
  hardware_conformance = try(local.m942["hardware_conformance"], null)
  hardware_end_of_vulnerability_support_date = try(local.m942["hardware_end_of_vulnerability_support_date"], null)
  hardware_last_date_of_support = try(local.m942["hardware_last_date_of_support"], null)
  hostname = try(local.m942["hostname"], null)
  id = try(local.m942["id"], null)
  in_band_ip_v4_address = try(local.m942["in_band_ip_v4_address"], null)
  in_band_ip_v6_address = try(local.m942["in_band_ip_v6_address"], null)
  mod_time = try(local.m942["mod_time"], null)
  model = try(local.m942["model"], null)
  moid = try(local.m942["moid"], null)
  object_type = try(local.m942["object_type"], null)
  operating_system = try(local.m942["operating_system"], null)
  operating_system_version = try(local.m942["operating_system_version"], null)
  out_of_band_ip_v4_address = try(local.m942["out_of_band_ip_v4_address"], null)
  out_of_band_ip_v6_address = try(local.m942["out_of_band_ip_v6_address"], null)
  owners = try(local.m942["owners"], null)
  results = try(local.m942["results"], null)
  role = try(local.m942["role"], null)
  serial = try(local.m942["serial"], null)
  shared_scope = try(local.m942["shared_scope"], null)
  site = try(local.m942["site"], null)
  software_conformance = try(local.m942["software_conformance"], null)
  software_end_of_vulnerability_support_date = try(local.m942["software_end_of_vulnerability_support_date"], null)
  software_last_date_of_support = try(local.m942["software_last_date_of_support"], null)
  software_version = try(local.m942["software_version"], null)
  strong_asset_id = try(local.m942["strong_asset_id"], null)
  telemetry_enabled = try(local.m942["telemetry_enabled"], null)
  dynamic "ancestors" {
    for_each = try(local.m942["ancestors"], null) == null ? [] : local.m942["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m942["fabric"], null) == null ? [] : local.m942["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m942["parent"], null) == null ? [] : local.m942["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m942["permission_resources"], null) == null ? [] : local.m942["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m942["tags"], null) == null ? [] : local.m942["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m942["version_context"], null) == null ? [] : local.m942["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
