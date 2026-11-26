# 090 · resource mso_schema_template_filter_entry · 7. Contracts, filters and external EPGs
# Manages MSO Resource Schema Template Filter Entry
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_filter_entry.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_090 = yamldecode(file("${path.module}/../models/mso_schema_template_filter_entry.yml"))["mso_schema_template_filter_entry"]
}

resource "mso_schema_template_filter_entry" "n090" {
  arp_flag             = local.m_090["arp_flag"]
  destination_from     = local.m_090["destination_from"]
  destination_to       = local.m_090["destination_to"]
  display_name         = local.m_090["display_name"]
  entry_description    = local.m_090["entry_description"]
  entry_display_name   = local.m_090["entry_display_name"]
  entry_name           = local.m_090["entry_name"]
  ether_type           = local.m_090["ether_type"]
  ip_protocol          = local.m_090["ip_protocol"]
  match_only_fragments = local.m_090["match_only_fragments"]
  name                 = local.m_090["name"]
  schema_id            = local.m_090["schema_id"]
  source_from          = local.m_090["source_from"]
  source_to            = local.m_090["source_to"]
  stateful             = local.m_090["stateful"]
  tcp_session_rules    = local.m_090["tcp_session_rules"]
  template_name        = local.m_090["template_name"]
}
