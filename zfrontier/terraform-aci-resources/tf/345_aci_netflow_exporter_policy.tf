# 345 · resource aci_netflow_exporter_policy · 3. Tenant and networking
# Manages ACI NetFlow Exporter Policy
# APIC class: netflowExporterPol · DN: uni/infra/exporterpol-{name} | uni/tn-{name}/exporterpol-{name}
# Reads models/aci_netflow_exporter_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_345 = yamldecode(file("${path.module}/../models/aci_netflow_exporter_policy.yml"))["aci_netflow_exporter_policy"]
}

resource "aci_netflow_exporter_policy" "n345" {
  annotation             = local.m_345["annotation"]
  annotations            = local.m_345["annotations"]
  description            = local.m_345["description"]
  destination_ip_address = local.m_345["destination_ip_address"]
  destination_port       = local.m_345["destination_port"]
  name                   = local.m_345["name"]
  name_alias             = local.m_345["name_alias"]
  owner_key              = local.m_345["owner_key"]
  owner_tag              = local.m_345["owner_tag"]
  parent_dn              = local.m_345["parent_dn"]
  qos_dscp_value         = local.m_345["qos_dscp_value"]
  relation_to_epg        = local.m_345["relation_to_epg"]
  relation_to_vrf        = local.m_345["relation_to_vrf"]
  source_ip_address      = local.m_345["source_ip_address"]
  source_ip_type         = local.m_345["source_ip_type"]
  tags                   = local.m_345["tags"]
  version                = local.m_345["version"]
}
