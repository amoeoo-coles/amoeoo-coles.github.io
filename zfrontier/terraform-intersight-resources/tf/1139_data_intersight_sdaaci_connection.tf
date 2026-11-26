# Sample data source intersight_sdaaci_connection — reads ../models/data_intersight_sdaaci_connection.yml
locals { m1139 = yamldecode(file("${path.module}/../models/data_intersight_sdaaci_connection.yml"))["data_intersight_sdaaci_connection"] }

data "intersight_sdaaci_connection" "n1139" {
  account_moid = try(local.m1139["account_moid"], null)
  aci_l3_out = try(local.m1139["aci_l3_out"], null)
  aci_match_rule_name = try(local.m1139["aci_match_rule_name"], null)
  aci_tenant = try(local.m1139["aci_tenant"], null)
  additional_properties = try(local.m1139["additional_properties"], null)
  campus_fabric_site = try(local.m1139["campus_fabric_site"], null)
  class_id = try(local.m1139["class_id"], null)
  create_time = try(local.m1139["create_time"], null)
  domain_group_moid = try(local.m1139["domain_group_moid"], null)
  epg = try(local.m1139["epg"], null)
  epg_subnet = try(local.m1139["epg_subnet"], null)
  firewall_device = try(local.m1139["firewall_device"], null)
  firewall_domain = try(local.m1139["firewall_domain"], null)
  id = try(local.m1139["id"], null)
  mod_time = try(local.m1139["mod_time"], null)
  moid = try(local.m1139["moid"], null)
  node_profile = try(local.m1139["node_profile"], null)
  object_type = try(local.m1139["object_type"], null)
  owners = try(local.m1139["owners"], null)
  results = try(local.m1139["results"], null)
  shared_scope = try(local.m1139["shared_scope"], null)
  status = try(local.m1139["status"], null)
  transit = try(local.m1139["transit"], null)
  virtual_network = try(local.m1139["virtual_network"], null)
  vn_epg = try(local.m1139["vn_epg"], null)
  vrf = try(local.m1139["vrf"], null)
  dynamic "ancestors" {
    for_each = try(local.m1139["ancestors"], null) == null ? [] : local.m1139["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "apic_target" {
    for_each = try(local.m1139["apic_target"], null) == null ? [] : local.m1139["apic_target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalyst_center_target" {
    for_each = try(local.m1139["catalyst_center_target"], null) == null ? [] : local.m1139["catalyst_center_target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fmc_target" {
    for_each = try(local.m1139["fmc_target"], null) == null ? [] : local.m1139["fmc_target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1139["organization"], null) == null ? [] : local.m1139["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1139["parent"], null) == null ? [] : local.m1139["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1139["permission_resources"], null) == null ? [] : local.m1139["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1139["tags"], null) == null ? [] : local.m1139["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1139["version_context"], null) == null ? [] : local.m1139["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
