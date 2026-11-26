# 157 · resource mso_fabric_policies_macsec_policy · 11. Fabric policy and resource templates
# Manages MACsec Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_macsec_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_157 = yamldecode(file("${path.module}/../models/mso_fabric_policies_macsec_policy.yml"))["mso_fabric_policies_macsec_policy"]
}

resource "mso_fabric_policies_macsec_policy" "n157" {
  admin_state            = local.m_157["admin_state"]
  cipher_suite           = local.m_157["cipher_suite"]
  confidentiality_offset = local.m_157["confidentiality_offset"]
  description            = local.m_157["description"]
  interface_type         = local.m_157["interface_type"]
  key_server_priority    = local.m_157["key_server_priority"]
  name                   = local.m_157["name"]
  sak_expire_time        = local.m_157["sak_expire_time"]
  security_policy        = local.m_157["security_policy"]
  template_id            = local.m_157["template_id"]
  window_size            = local.m_157["window_size"]
  dynamic "macsec_keys" {
    for_each = local.m_157["macsec_keys"] == null ? [] : local.m_157["macsec_keys"]
    content {
      end_time   = lookup(macsec_keys.value, "end_time", null)
      key_name   = lookup(macsec_keys.value, "key_name", null)
      psk        = lookup(macsec_keys.value, "psk", null)
      start_time = lookup(macsec_keys.value, "start_time", null)
    }
  }
}
